const API_BASE_URL = '/api';

class ApiClient {
  private baseUrl: string;
  private token: string | null = null;

  constructor(baseUrl: string = API_BASE_URL) {
    this.baseUrl = baseUrl;
    // Load token from localStorage
    this.token = localStorage.getItem('token');
  }

  setToken(token: string) {
    this.token = token;
    localStorage.setItem('token', token);
  }

  clearToken() {
    this.token = null;
    localStorage.removeItem('token');
  }

  private async request<T>(
    endpoint: string,
    options: RequestInit = {}
  ): Promise<T> {
    const url = `${this.baseUrl}${endpoint}`;
    
    const headers: HeadersInit = {
      'Content-Type': 'application/json',
      ...options.headers,
    };

    if (this.token) {
      headers['Authorization'] = `Bearer ${this.token}`;
    }

    const config: RequestInit = {
      ...options,
      headers,
    };

    try {
      const response = await fetch(url, config);
      
      if (!response.ok) {
        const error = await response.json().catch(() => ({ error: 'Request failed' }));
        throw new Error(error.error || error.message || 'Request failed');
      }

      return await response.json();
    } catch (error) {
      console.error('API request error:', error);
      throw error;
    }
  }

  async get<T>(endpoint: string): Promise<T> {
    return this.request<T>(endpoint, { method: 'GET' });
  }

  async post<T>(endpoint: string, data?: any): Promise<T> {
    return this.request<T>(endpoint, {
      method: 'POST',
      body: JSON.stringify(data),
    });
  }

  async put<T>(endpoint: string, data?: any): Promise<T> {
    return this.request<T>(endpoint, {
      method: 'PUT',
      body: JSON.stringify(data),
    });
  }

  async delete<T>(endpoint: string): Promise<T> {
    return this.request<T>(endpoint, { method: 'DELETE' });
  }
}

export const api = new ApiClient();

// Auth API
export const authApi = {
  login: (email: string, password: string) =>
    api.post<{ token: string; user: any }>('/auth/login', { email, password }),
  register: (data: any) =>
    api.post<{ message: string; userId: string }>('/auth/register', data),
};

// Attendance API
export const attendanceApi = {
  getAll: (params?: { user_id?: string; date?: string; start_date?: string; end_date?: string }) =>
    api.get<any[]>(`/attendance?${new URLSearchParams(params as any).toString()}`),
  create: (data: any) =>
    api.post<{ message: string; id: string }>('/attendance', data),
  update: (id: string, data: any) =>
    api.put<{ message: string }>(`/attendance/${id}`, data),
};

// Profiles API
export const profilesApi = {
  getAll: (params?: { department?: string }) =>
    api.get<any[]>(`/profiles?${new URLSearchParams(params as any).toString()}`),
  getById: (userId: string) =>
    api.get<any>(`/profiles/${userId}`),
  update: (userId: string, data: any) =>
    api.put<{ message: string }>(`/profiles/${userId}`, data),
};

// Journals API
export const journalsApi = {
  getAll: (params?: { user_id?: string; start_date?: string; end_date?: string; verification_status?: string }) =>
    api.get<any[]>(`/journals?${new URLSearchParams(params as any).toString()}`),
  create: (data: any) =>
    api.post<{ message: string; id: string }>('/journals', data),
  update: (id: string, data: any) =>
    api.put<{ message: string }>(`/journals/${id}`, data),
  delete: (id: string) =>
    api.delete<{ message: string }>(`/journals/${id}`),
};

// Leave API
export const leaveApi = {
  getAll: (params?: { user_id?: string; status?: string }) =>
    api.get<any[]>(`/leave?${new URLSearchParams(params as any).toString()}`),
  create: (data: any) =>
    api.post<{ message: string; id: string }>('/leave', data),
  update: (id: string, data: any) =>
    api.put<{ message: string }>(`/leave/${id}`, data),
};

// Users API
export const usersApi = {
  getAll: (params?: { role?: string }) =>
    api.get<any[]>(`/users?${new URLSearchParams(params as any).toString()}`),
  create: (data: any) =>
    api.post<{ message: string; userId: string }>('/users', data),
  update: (id: string, data: any) =>
    api.put<{ message: string }>(`/users/${id}`, data),
  updatePassword: (id: string, password: string) =>
    api.put<{ message: string }>(`/users/${id}/password`, { password }),
};

// Holidays API
export const holidaysApi = {
  getAll: (params?: { year?: number }) => {
    const urlParams = new URLSearchParams();
    if (params?.year) urlParams.append('year', params.year.toString());
    return api.get<any[]>(`/holidays?${urlParams.toString()}`);
  },
  getById: (id: string) =>
    api.get<any>(`/holidays/${id}`),
  create: (data: any) =>
    api.post<{ message: string; id: string }>('/holidays', data),
  update: (id: string, data: any) =>
    api.put<{ message: string }>(`/holidays/${id}`, data),
  delete: (id: string) =>
    api.delete<{ message: string }>(`/holidays/${id}`),
  checkDate: (date: string) =>
    api.get<{ isHoliday: boolean; holiday?: any }>(`/holidays/check?date=${date}`),
};

export default api;
