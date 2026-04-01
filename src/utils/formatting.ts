import { Timestamp } from '@react-native-firebase/firestore';

export function formatPrice(price: number): string {
  if (price === 0) return 'FREE';
  return `$${price.toFixed(price % 1 === 0 ? 0 : 2)}`;
}

export function formatRelativeTime(timestamp: Timestamp | Date): string {
  const date = timestamp instanceof Date ? timestamp : timestamp.toDate();
  const now = new Date();
  const diffMs = now.getTime() - date.getTime();
  const diffMins = Math.floor(diffMs / 60000);
  const diffHours = Math.floor(diffMs / 3600000);
  const diffDays = Math.floor(diffMs / 86400000);

  if (diffMins < 1) return 'Just now';
  if (diffMins < 60) return `${diffMins}m ago`;
  if (diffHours < 24) return `${diffHours}h ago`;
  if (diffDays < 7) return `${diffDays}d ago`;
  if (diffDays < 30) return `${Math.floor(diffDays / 7)}w ago`;
  return date.toLocaleDateString();
}

export function formatRating(rating: number): string {
  return rating.toFixed(1);
}

export function truncateText(text: string, maxLength: number): string {
  if (text.length <= maxLength) return text;
  return text.slice(0, maxLength - 3) + '...';
}

export function formatCO2(kg: number): string {
  if (kg < 1) return `${Math.round(kg * 1000)}g CO2`;
  return `${kg.toFixed(1)}kg CO2`;
}

export function formatMoneySaved(amount: number): string {
  return `$${Math.round(amount)}`;
}
