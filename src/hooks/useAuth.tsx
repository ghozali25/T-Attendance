import { useState, useEffect, createContext, useContext, ReactNode } from "react";
import { authApi, api } from "@/lib/api";

type AppRole = "admin" | "manager" | "employee";

interface User {
  id: string;
  email: string;
  full_name?: string;
  role?: AppRole;
  profile?: any;
}

interface AuthContextType {
  user: User | null;
  session: any | null;
  loading: boolean;
  role: AppRole | null;
  isAdmin: boolean;
  isManager: boolean;
  isAdminOrManager: boolean;
  signOut: () => Promise<void>;
  login: (email: string, password: string) => Promise<void>;
  register: (email: string, password: string, fullName: string) => Promise<void>;
}

const AuthContext = createContext<AuthContextType>({
  user: null,
  session: null,
  loading: true,
  role: null,
  isAdmin: false,
  isManager: false,
  isAdminOrManager: false,
  signOut: async () => { },
  login: async () => { },
  register: async () => { },
});

export const useAuth = () => {
  const context = useContext(AuthContext);
  if (!context) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
};

interface AuthProviderProps {
  children: ReactNode;
}

export const AuthProvider = ({ children }: AuthProviderProps) => {
  const [user, setUser] = useState<User | null>(null);
  const [session, setSession] = useState<any | null>(null);
  const [loading, setLoading] = useState(true);
  const [role, setRole] = useState<AppRole | null>(null);

  const initializeAuth = async () => {
    try {
      const token = localStorage.getItem('token');
      const savedUser = localStorage.getItem('user');
      
      if (token && savedUser) {
        const userData = JSON.parse(savedUser);
        setUser(userData);
        setRole(userData.role as AppRole || null);
        setSession({ user: userData });
        api.setToken(token);
      }
    } catch (error) {
      console.error("Auth init error:", error);
      api.clearToken();
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    initializeAuth();
  }, []);

  const login = async (email: string, password: string) => {
    try {
      const result = await authApi.login(email, password);
      api.setToken(result.token);
      localStorage.setItem('token', result.token);
      localStorage.setItem('user', JSON.stringify(result.user));
      setUser(result.user);
      setRole(result.user.role as AppRole);
      setSession({ user: result.user });
    } catch (error) {
      console.error("Login error:", error);
      throw error;
    }
  };

  const register = async (email: string, password: string, fullName: string) => {
    try {
      await authApi.register({ email, password, full_name: fullName });
    } catch (error) {
      console.error("Register error:", error);
      throw error;
    }
  };

  const signOut = async () => {
    api.clearToken();
    localStorage.removeItem('token');
    localStorage.removeItem('user');
    setUser(null);
    setSession(null);
    setRole(null);
  };

  const isAdmin = role === "admin";
  const isManager = role === "manager";
  const isAdminOrManager = role === "admin" || role === "manager";

  return (
    <AuthContext.Provider value={{ user, session, loading, role, isAdmin, isManager, isAdminOrManager, signOut, login, register }}>
      {children}
    </AuthContext.Provider>
  );
};
