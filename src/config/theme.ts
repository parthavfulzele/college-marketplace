import { Campus } from '../types/user';

export const lightColors = {
  primary: '#6C5CE7',
  primaryLight: '#A29BFE',
  secondary: '#00CECE',
  secondaryLight: '#81ECEC',
  accent: '#FD79A8',
  accentLight: '#FAB1D0',
  success: '#00B894',
  error: '#E17055',
  warning: '#FDCB6E',
  background: '#F8F9FA',
  card: '#FFFFFF',
  text: '#2D3436',
  textSecondary: '#636E72',
  border: '#E0E0E0',
  inputBorder: '#DDD',
  skeleton: '#E8E8E8',
};

export const darkColors = {
  primary: '#A29BFE',
  primaryLight: '#6C5CE7',
  secondary: '#81ECEC',
  secondaryLight: '#00CECE',
  accent: '#FAB1D0',
  accentLight: '#FD79A8',
  success: '#55EFC4',
  error: '#FAB1A0',
  warning: '#FFEAA7',
  background: '#1A1A2E',
  card: '#16213E',
  text: '#E8E8E8',
  textSecondary: '#B2BEC3',
  border: '#2D3436',
  inputBorder: '#3D3D5C',
  skeleton: '#2D3436',
};

export type ThemeColors = typeof lightColors;

export const spacing = {
  xs: 4,
  sm: 8,
  md: 12,
  base: 16,
  lg: 24,
  xl: 32,
  xxl: 48,
  xxxl: 64,
} as const;

export const typography = {
  h1: { fontSize: 28, fontFamily: 'Nunito-Bold', fontWeight: '700' as const },
  h2: { fontSize: 22, fontFamily: 'Nunito-Bold', fontWeight: '700' as const },
  h3: { fontSize: 18, fontFamily: 'Nunito-SemiBold', fontWeight: '600' as const },
  body: { fontSize: 16, fontFamily: 'NunitoSans-Regular', fontWeight: '400' as const },
  caption: { fontSize: 14, fontFamily: 'NunitoSans-Regular', fontWeight: '400' as const },
  price: { fontSize: 24, fontFamily: 'Nunito-ExtraBold', fontWeight: '800' as const },
  badge: { fontSize: 12, fontFamily: 'Nunito-Bold', fontWeight: '700' as const },
} as const;

export const borderRadius = {
  sm: 8,
  md: 12,
  lg: 16,
  pill: 999,
} as const;

export const shadows = {
  card: {
    shadowColor: '#000',
    shadowOffset: { width: 0, height: 2 },
    shadowOpacity: 0.08,
    shadowRadius: 8,
    elevation: 3,
  },
  button: {
    shadowColor: '#6C5CE7',
    shadowOffset: { width: 0, height: 4 },
    shadowOpacity: 0.2,
    shadowRadius: 8,
    elevation: 4,
  },
} as const;

export const categoryColors: Record<string, string> = {
  electronics: '#3498DB',
  books: '#E67E22',
  clothing: '#FD79A8',
  dorm_stuff: '#6C5CE7',
  utilities: '#636E72',
  sports: '#00B894',
  tickets: '#FDCB6E',
  other: '#DFE6E9',
};

export function getCampusTintedColors(
  baseColors: ThemeColors,
  campus: Campus | null
): ThemeColors {
  if (!campus) return baseColors;
  return {
    ...baseColors,
    primary: campus.primaryColor || baseColors.primary,
  };
}
