
import { useState, useEffect } from "react";
import { useSearchParams } from "react-router-dom";
import {
  LayoutDashboard, Users, Clock, BarChart3, Building2, Shield, Key,
  Settings, Database, BookOpen, Plus, Search, Filter, Archive, RotateCcw, Trash2, Eye, EyeOff
} from "lucide-react";
import { ADMIN_MENU_SECTIONS } from "@/config/menu";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import {
  Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle,
  DialogFooter
} from "@/components/ui/dialog";
import { Form, FormControl, FormField, FormItem, FormLabel, FormMessage } from "@/components/ui/form";
import { useForm } from "react-hook-form";
import { zodResolver } from "@hookform/resolvers/zod";
import { z } from "zod";

import EnterpriseLayout from "@/components/layout/EnterpriseLayout";
import { EmployeeStats } from "@/components/employee/EmployeeStats";
import { EmployeeTable, EmployeeData } from "@/components/employee/EmployeeTable";
import { cn } from "@/lib/utils";

import { db } from "@/integrations/mysql/client";
import { usersApi, profilesApi } from "@/lib/api";
import { toast } from "@/hooks/use-toast";

// ========== CONFIG ==========
const PAGE_SIZE = 10; // Mockup shows 5-10 items

// Schema for Add/Edit
const employeeSchema = z.object({
  full_name: z.string().min(2, "Name must be at least 2 characters"),
  email: z.string().email("Invalid email").optional().or(z.literal("")),
  password: z.string()
    .min(6, "Password must be at least 6 characters")
    .optional()
    .or(z.literal("")),
  phone: z.string().optional().or(z.literal("")),
  department: z.string().optional().or(z.literal("")),
  position: z.string().optional().or(z.literal("")),
  role: z.string().default("karyawan"),
});

type EmployeeFormData = z.infer<typeof employeeSchema>;


const KelolaKaryawan = () => {
  const [searchParams] = useSearchParams();

  // State
  const [employees, setEmployees] = useState<EmployeeData[]>([]);
  const [departments, setDepartments] = useState<string[]>([]);
  const [isLoading, setIsLoading] = useState(true);
  const [isSubmitting, setIsSubmitting] = useState(false);

  // Filters
  const [search, setSearch] = useState("");
  const [debouncedSearch, setDebouncedSearch] = useState("");
  const [departmentFilter, setDepartmentFilter] = useState("all");
  const [statusFilter, setStatusFilter] = useState("all");
  const [showArchived, setShowArchived] = useState(false);

  // Pagination
  const [page, setPage] = useState(1);
  const [totalRecords, setTotalRecords] = useState(0);
  const [totalPages, setTotalPages] = useState(1);

  // Stats
  const [stats, setStats] = useState({ total: 0, active: 0, onLeave: 0, depts: 0 });

  const [dialogOpen, setDialogOpen] = useState(false);
  const [editingEmployee, setEditingEmployee] = useState<EmployeeData | null>(null);
  const [newDepartment, setNewDepartment] = useState("");
  const [viewMode, setViewMode] = useState<'table' | 'grid'>('table');
  const [selectedIds, setSelectedIds] = useState<string[]>([]);
  const [showPassword, setShowPassword] = useState(false);

  // Form
  const form = useForm<EmployeeFormData>({
    resolver: zodResolver(employeeSchema),
    defaultValues: { full_name: "", email: "", password: "", phone: "", department: "", position: "", role: "karyawan" },
  });

  // Debounce
  useEffect(() => {
    const timer = setTimeout(() => {
      setDebouncedSearch(search);
      setPage(1); // Reset page on search
    }, 500);
    return () => clearTimeout(timer);
  }, [search]);

  // Data Loaders
  useEffect(() => {
    fetchDepartments();
    fetchStats();
  }, []);

  useEffect(() => {
    fetchEmployees();
    setSelectedIds([]); // Reset selection when filters change
  }, [page, debouncedSearch, departmentFilter, statusFilter, showArchived]);

  // --- FETCH FUNCTIONS ---

  const fetchDepartments = async () => {
    try {
      const data = await usersApi.getAll();
      if (data && Array.isArray(data)) {
        const uniqueDepts = [...new Set(data.map((d: any) => d.department).filter(Boolean))] as string[];
        setDepartments(uniqueDepts.sort());
        setStats(prev => ({ ...prev, depts: uniqueDepts.length }));
      }
    } catch (err: any) {
      console.error('Error fetching departments:', err);
    }
  };

  const fetchStats = async () => {
    try {
      const data = await usersApi.getAll();
      if (data && Array.isArray(data)) {
        const total = data.length;
        const fakeActive = total ? Math.floor(total * 0.9) : 0;
        const fakeLeave = total ? total - fakeActive : 0;
        setStats(prev => ({ ...prev, total, active: fakeActive, onLeave: fakeLeave }));
      }
    } catch (err: any) {
      console.error('Error fetching stats:', err);
    }
  };

  const fetchEmployees = async () => {
    setIsLoading(true);
    try {
      // Use API to fetch users
      const data = await usersApi.getAll();
      
      if (!data || !Array.isArray(data)) {
        setEmployees([]);
        setTotalRecords(0);
        setTotalPages(1);
        return;
      }

      // Filter on client side (TODO: Move to backend API)
      let filtered = data;
      
      // Archived Filter
      if (showArchived) {
        filtered = filtered.filter((emp: any) => emp.deleted_at);
      } else {
        filtered = filtered.filter((emp: any) => !emp.deleted_at);
      }

      // Search Filter
      if (debouncedSearch) {
        filtered = filtered.filter((emp: any) => 
          emp.full_name?.toLowerCase().includes(debouncedSearch.toLowerCase())
        );
      }

      // Department Filter
      if (departmentFilter !== 'all') {
        filtered = filtered.filter((emp: any) => emp.department === departmentFilter);
      }

      const count = filtered.length;
      setTotalRecords(count);
      setTotalPages(Math.ceil(count / PAGE_SIZE));

      // Pagination
      const offset = (page - 1) * PAGE_SIZE;
      const paginated = filtered.slice(offset, offset + PAGE_SIZE);

      // Format data
      const formatted: EmployeeData[] = paginated.map((emp: any) => ({
        ...emp,
        id: emp.id,
        user_id: emp.id,
        full_name: emp.full_name || "",
        email: emp.email || "",
        phone: emp.phone || "",
        department: emp.department || "",
        position: emp.position || "",
        role: emp.role || "karyawan",
        status: emp.deleted_at ? 'inactive' : 'active',
        created_at: emp.created_at,
      })) || [];

      setEmployees(formatted);

    } catch (err: any) {
      toast({ variant: "destructive", title: "Error fetching employees", description: err.message || "Unknown error" });
    } finally {
      setIsLoading(false);
    }
  };

  // --- ACTIONS ---

  const handleAddNew = () => {
    setEditingEmployee(null);
    setNewDepartment("");
    form.reset({ full_name: "", email: "", password: "", phone: "", department: "", position: "", role: "karyawan" });
    setDialogOpen(true);
  };

  const handleEdit = (emp: EmployeeData) => {
    setEditingEmployee(emp);
    setNewDepartment("");
    form.reset({
      full_name: emp.full_name || "",
      email: emp.email || "",
      password: "",
      phone: emp.phone || "",
      department: emp.department || "",
      position: emp.position || "",
      role: emp.role || "karyawan",
    });
    setDialogOpen(true);
  };

  const handleDelete = async (emp: EmployeeData) => {
    if (!confirm(`Are you sure you want to archive ${emp.full_name}?`)) return;

    await db.query(
      'UPDATE profiles SET deleted_at = ? WHERE id = ?',
      [new Date().toISOString(), emp.id]
    );

    toast({ title: "Success", description: "Employee archived." });
    fetchEmployees();
    fetchStats();
  };

  const handleBulkArchive = async () => {
    if (!selectedIds.length) return;
    if (!confirm(`Are you sure you want to archive ${selectedIds.length} employees?`)) return;

    const placeholders = selectedIds.map(() => '?').join(',');
    await db.query(
      `UPDATE profiles SET deleted_at = ? WHERE id IN (${placeholders})`,
      [new Date().toISOString(), ...selectedIds]
    );

    toast({ title: "Success", description: `${selectedIds.length} employees archived.` });
    setSelectedIds([]);
    fetchEmployees();
    fetchStats();
  };

  const handleSelect = (id: string, checked: boolean) => {
    if (checked) {
      setSelectedIds(prev => [...prev, id]);
    } else {
      setSelectedIds(prev => prev.filter(item => item !== id));
    }
  };

  const handleSelectAll = (checked: boolean) => {
    if (checked) {
      setSelectedIds(employees.map(emp => emp.id));
    } else {
      setSelectedIds([]);
    }
  };

  const handleRestore = async (emp: EmployeeData) => {
    if (!confirm(`Are you sure you want to restore ${emp.full_name}?`)) return;

    await db.query(
      'UPDATE profiles SET deleted_at = NULL WHERE id = ?',
      [emp.id]
    );

    toast({ title: "Success", description: "Employee restored." });
    fetchEmployees();
    fetchStats();
  };

  const onSubmit = async (values: EmployeeFormData) => {
    setIsSubmitting(true);

    let finalDept = values.department;
    if (finalDept === "__new__") finalDept = newDepartment;
    else if (finalDept === "__none__") finalDept = null;

    try {
      if (editingEmployee) {
        // If it's a new department, also add it to the master departments table
        if (values.department === "__new__" && newDepartment) {
          const deptExists = await db.query('SELECT name FROM departments WHERE name = ?', [newDepartment]) as any[];
          if (!deptExists || deptExists.length === 0) {
            await db.query('INSERT INTO departments (id, name) VALUES (?, ?)', [window.crypto.randomUUID(), newDepartment]);
          }
        }

        // Update using API
        await usersApi.update(editingEmployee.user_id, {
          full_name: values.full_name,
          phone: values.phone || null,
          department: finalDept || null,
          position: values.position || null,
          role: values.role,
        });

        toast({ title: "Updated", description: "Employee details updated." });
      } else {
        // If it's a new department, also add it to the master departments table
        if (values.department === "__new__" && newDepartment) {
          const deptExists = await db.query('SELECT name FROM departments WHERE name = ?', [newDepartment]) as any[];
          if (!deptExists || deptExists.length === 0) {
            await db.query('INSERT INTO departments (id, name) VALUES (?, ?)', [window.crypto.randomUUID(), newDepartment]);
          }
        }

        // Create using API
        await usersApi.create({
          email: values.email,
          password: values.password || "password123",
          full_name: values.full_name,
          phone: values.phone || null,
          department: finalDept || null,
          position: values.position || null,
          role: values.role,
        });

        toast({ title: "Created", description: "New employee added successfully." });
      }

      // 1. Close dialog immediately
      setDialogOpen(false);
      
      // 2. Clear editing state
      setTimeout(() => {
        setEditingEmployee(null);
        form.reset();
      }, 100);
      
      // 3. Refresh all data after a small delay to ensure UI is unblocked
      setTimeout(async () => {
        await Promise.all([
          fetchEmployees(),
          fetchStats(),
          fetchDepartments()
        ]);
      }, 300);

    } catch (err: any) {
      toast({ variant: "destructive", title: "Error", description: err.message || "Unknown error" });
    } finally {
      setIsSubmitting(false);
    }
  };


  // --- MENU CONFIG ---
  const menuSections = ADMIN_MENU_SECTIONS;

  return (
    <EnterpriseLayout
      title="Employee Management"
      subtitle="Manage your team members and permissions."
      menuSections={menuSections}
      roleLabel="Administrator"
      showRefresh={true}
      showExport={false}
      onRefresh={fetchEmployees}
      breadcrumbs={[
        { label: "Admin", href: "/admin/dashboard" },
        { label: "Kelola Karyawan" },
      ]}
    >
      <div className="max-w-[1400px] mx-auto pb-20">

        {/* 1. STATS CARDS */}
        <EmployeeStats
          total={stats.total}
          active={stats.active}
          onLeave={stats.onLeave}
          departments={stats.depts}
          isLoading={isLoading && employees.length === 0}
        />

        {/* 2. FILTERS & ACTIONS BAR */}
        <div className="bg-white dark:bg-slate-900 p-4 rounded-xl border border-slate-200 dark:border-slate-700 shadow-sm mb-6 flex flex-col md:flex-row gap-4 items-center justify-between">
          <div className="relative w-full md:w-[400px]">
            <Search className="absolute left-3 top-1/2 -translate-y-1/2 h-4 w-4 text-slate-400" />
            <Input
              placeholder="Search by name or NIP..."
              className="pl-9 bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700"
              value={search}
              onChange={(e) => setSearch(e.target.value)}
            />
          </div>

          <div className="flex items-center gap-3 w-full md:w-auto overflow-x-auto pb-1 md:pb-0">
            <Select value={departmentFilter} onValueChange={setDepartmentFilter}>
              <SelectTrigger className="w-[180px] bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700">
                <SelectValue placeholder="All Departments" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All Departments</SelectItem>
                {departments.map(d => <SelectItem key={d} value={d}>{d}</SelectItem>)}
              </SelectContent>
            </Select>

            <Select value={statusFilter} onValueChange={setStatusFilter}>
              <SelectTrigger className="w-[150px] bg-slate-50 dark:bg-slate-800 border-slate-200 dark:border-slate-700 hidden sm:flex">
                <SelectValue placeholder="All Statuses" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="all">All Statuses</SelectItem>
                <SelectItem value="active">Active</SelectItem>
                <SelectItem value="inactive">Inactive</SelectItem>
                <SelectItem value="on_leave">On Leave</SelectItem>
              </SelectContent>
            </Select>

            {selectedIds.length > 0 ? (
              <Button
                variant="destructive"
                className="gap-2 shrink-0 bg-red-600 hover:bg-red-700 font-medium"
                onClick={handleBulkArchive}
              >
                <Trash2 className="w-4 h-4" />
                <span className="hidden sm:inline">Bulk Archive ({selectedIds.length})</span>
              </Button>
            ) : (
              <Button
                className="bg-blue-600 hover:bg-blue-700 text-white gap-2 shrink-0"
                onClick={handleAddNew}
              >
                <Plus className="w-4 h-4" />
                <span className="hidden sm:inline">Add Employee</span>
                <span className="sm:hidden">Add</span>
              </Button>
            )}

            <Button
              variant={showArchived ? "secondary" : "outline"}
              className="gap-2 shrink-0 bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-700"
              onClick={() => setShowArchived(!showArchived)}
              title={showArchived ? "Back to Active" : "View Archived"}
            >
              {showArchived ? <RotateCcw className="w-4 h-4 text-primary" /> : <Archive className="w-4 h-4 text-slate-500 dark:text-slate-400" />}
              {showArchived && <span className="hidden sm:inline text-primary">Archived</span>}
            </Button>

            <div className="flex bg-slate-100 dark:bg-slate-800/80 p-1 rounded-lg shrink-0">
              <Button
                variant="ghost"
                size="icon"
                className={cn("h-8 w-8 rounded-md transition-all", viewMode === 'table' ? "bg-white dark:bg-slate-900 shadow-sm text-primary" : "text-slate-500 dark:text-slate-400")}
                onClick={() => setViewMode('table')}
              >
                <LayoutDashboard className="h-4 w-4" />
              </Button>
              <Button
                variant="ghost"
                size="icon"
                className={cn("h-8 w-8 rounded-md transition-all", viewMode === 'grid' ? "bg-white dark:bg-slate-900 shadow-sm text-primary" : "text-slate-500 dark:text-slate-400")}
                onClick={() => setViewMode('grid')}
              >
                <Building2 className="h-4 w-4" />
              </Button>
            </div>
          </div>
        </div>

        {/* 3. TABLE/GRID */}
        <EmployeeTable
          data={employees}
          isLoading={isLoading}
          onEdit={handleEdit}
          onDelete={handleDelete}
          onRestore={handleRestore}
          isArchivedView={showArchived}
          page={page}
          totalPages={totalPages}
          totalRecords={totalRecords}
          onPageChange={setPage}
          viewMode={viewMode}
          selectedIds={selectedIds}
          onSelect={handleSelect}
          onSelectAll={handleSelectAll}
        />
      </div>

      {/* MAIN DIALOG - ADD/EDIT EMPLOYEE */}
      <Dialog open={dialogOpen} onOpenChange={setDialogOpen}>
        <DialogContent className="sm:max-w-[600px]">
          <DialogHeader>
            <DialogTitle>{editingEmployee ? "Edit Employee" : "Add New Employee"}</DialogTitle>
            <DialogDescription>
              {editingEmployee ? "Update employee information and permissions." : "Fill in the details to create a new employee account."}
            </DialogDescription>
          </DialogHeader>

          <Form {...form}>
            <form onSubmit={form.handleSubmit(onSubmit)} className="space-y-4 py-4">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <FormField control={form.control} name="full_name" render={({ field }) => (
                  <FormItem><FormLabel>Full Name</FormLabel><FormControl><Input {...field} placeholder="e.g. Budi Santoso" /></FormControl><FormMessage /></FormItem>
                )} />
                <FormField control={form.control} name="email" render={({ field }) => (
                  <FormItem><FormLabel>Email Address</FormLabel><FormControl><Input {...field} type="email" placeholder="email@company.com" disabled={!!editingEmployee} /></FormControl><FormMessage /></FormItem>
                )} />
              </div>

              {!editingEmployee && (
                <FormField control={form.control} name="password" render={({ field }) => (
                  <FormItem>
                    <FormLabel>Password</FormLabel>
                    <FormControl>
                      <div className="relative">
                        <Input 
                          {...field} 
                          type={showPassword ? "text" : "password"} 
                          placeholder="Min. 6 characters"
                          className="pr-10"
                        />
                        <button
                          type="button"
                          onClick={() => setShowPassword(!showPassword)}
                          className="absolute right-3 top-1/2 -translate-y-1/2 text-slate-400 hover:text-slate-600 dark:text-slate-500 dark:hover:text-slate-300"
                        >
                          {showPassword ? <EyeOff className="h-4 w-4" /> : <Eye className="h-4 w-4" />}
                        </button>
                      </div>
                    </FormControl>
                    <FormMessage />
                  </FormItem>
                )} />
              )}

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <FormField control={form.control} name="department" render={({ field }) => (
                  <FormItem>
                    <FormLabel>Department</FormLabel>
                    <Select onValueChange={(val) => { if (val === "__new__") setNewDepartment(""); field.onChange(val); }} value={field.value || ""}>
                      <FormControl><SelectTrigger><SelectValue placeholder="Select Department" /></SelectTrigger></FormControl>
                      <SelectContent>
                        <SelectItem value="__none__">None</SelectItem>
                        {departments.map(d => <SelectItem key={d} value={d}>{d}</SelectItem>)}
                        <SelectItem value="__new__">+ Create New</SelectItem>
                      </SelectContent>
                    </Select>
                    {field.value === "__new__" && <Input placeholder="New Department Name" value={newDepartment} onChange={e => setNewDepartment(e.target.value)} className="mt-2" />}
                    <FormMessage />
                  </FormItem>
                )} />
                <FormField control={form.control} name="position" render={({ field }) => (
                  <FormItem><FormLabel>Position</FormLabel><FormControl><Input {...field} placeholder="e.g. Senior Engineer" /></FormControl><FormMessage /></FormItem>
                )} />
              </div>

              <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <FormField control={form.control} name="phone" render={({ field }) => (
                  <FormItem><FormLabel>Phone Number</FormLabel><FormControl><Input {...field} placeholder="08..." /></FormControl><FormMessage /></FormItem>
                )} />
                <FormField control={form.control} name="role" render={({ field }) => (
                  <FormItem>
                    <FormLabel>System Role</FormLabel>
                    <Select onValueChange={field.onChange} value={field.value}>
                      <FormControl><SelectTrigger><SelectValue /></SelectTrigger></FormControl>
                      <SelectContent>
                        <SelectItem value="karyawan">Employee (Staff)</SelectItem>
                        <SelectItem value="manager">Manager</SelectItem>
                        <SelectItem value="admin">Administrator</SelectItem>
                      </SelectContent>
                    </Select>
                    <FormMessage />
                  </FormItem>
                )} />
              </div>

              <DialogFooter className="pt-4">
                <Button type="button" variant="outline" onClick={() => setDialogOpen(false)} disabled={isSubmitting}>Cancel</Button>
                <Button type="submit" className="bg-blue-600 hover:bg-blue-700" disabled={isSubmitting}>
                  {isSubmitting ? "Saving..." : editingEmployee ? "Update Employee" : "Create Employee"}
                </Button>
              </DialogFooter>
            </form>
          </Form>
        </DialogContent>
      </Dialog>

    </EnterpriseLayout>
  );
};

export default KelolaKaryawan;