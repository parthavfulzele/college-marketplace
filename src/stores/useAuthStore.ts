import { create } from 'zustand';
import { User, Campus, ThemePreference } from '../types/user';
import { getCampusFromEmail } from '../utils/validation';

interface AuthState {
  user: User | null;
  campus: Campus | null;
  firebaseUser: { uid: string; email: string; emailVerified: boolean } | null;
  loading: boolean;
  initialized: boolean;

  setUser: (user: User | null) => void;
  setFirebaseUser: (user: { uid: string; email: string; emailVerified: boolean } | null) => void;
  setLoading: (loading: boolean) => void;
  setInitialized: (initialized: boolean) => void;
  reset: () => void;
}

export const useAuthStore = create<AuthState>((set) => ({
  user: null,
  campus: null,
  firebaseUser: null,
  loading: true,
  initialized: false,

  setUser: (user) =>
    set({
      user,
      campus: user ? getCampusFromEmail(user.email) : null,
    }),

  setFirebaseUser: (firebaseUser) => set({ firebaseUser }),

  setLoading: (loading) => set({ loading }),

  setInitialized: (initialized) => set({ initialized }),

  reset: () =>
    set({
      user: null,
      campus: null,
      firebaseUser: null,
      loading: false,
    }),
}));
