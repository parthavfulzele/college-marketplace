import campusData from '../config/campuses.json';
import { Campus } from '../types/user';

const campuses = campusData as Record<string, { id: string; name: string; primaryColor: string; secondaryColor: string }>;

export function isEduEmail(email: string): boolean {
  if (!email || typeof email !== 'string') return false;
  const trimmed = email.trim().toLowerCase();
  return trimmed.endsWith('.edu');
}

export function getDomainFromEmail(email: string): string | null {
  if (!email || typeof email !== 'string') return null;
  const parts = email.trim().toLowerCase().split('@');
  if (parts.length !== 2) return null;
  return parts[1];
}

export function getCampusFromEmail(email: string): Campus | null {
  const domain = getDomainFromEmail(email);
  if (!domain) return null;

  const entry = campuses[domain];
  if (!entry) return null;

  return {
    id: entry.id,
    name: entry.name,
    domain,
    primaryColor: entry.primaryColor,
    secondaryColor: entry.secondaryColor,
  };
}

export function isSupportedCampus(email: string): boolean {
  return getCampusFromEmail(email) !== null;
}

export function validateListingTitle(title: string): string | null {
  if (!title || title.trim().length === 0) return 'Title is required';
  if (title.trim().length > 100) return 'Title must be under 100 characters';
  return null;
}

export function validateListingDescription(description: string): string | null {
  if (!description || description.trim().length === 0) return 'Description is required';
  if (description.trim().length > 1000) return 'Description must be under 1000 characters';
  return null;
}

export function validatePrice(price: number, isDonate: boolean): string | null {
  if (isDonate) return null;
  if (price <= 0) return 'Price must be greater than $0';
  if (price > 10000) return 'Price must be under $10,000';
  return null;
}

export function validatePassword(password: string): string | null {
  if (!password || password.length < 6) return 'Password must be at least 6 characters';
  return null;
}

export function validateDisplayName(name: string): string | null {
  if (!name || name.trim().length === 0) return 'Name is required';
  if (name.trim().length > 50) return 'Name must be under 50 characters';
  return null;
}
