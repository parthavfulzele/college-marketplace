import { Timestamp } from '@react-native-firebase/firestore';

export type Category =
  | 'electronics'
  | 'books'
  | 'clothing'
  | 'dorm_stuff'
  | 'utilities'
  | 'sports'
  | 'tickets'
  | 'other';

export type Condition = 'new' | 'like_new' | 'good' | 'fair';

export type ListingStatus = 'active' | 'sold' | 'reserved' | 'removed';

export interface Listing {
  id: string;
  sellerId: string;
  sellerName: string;
  sellerAvatarUrl: string | null;
  sellerRating: number;
  campusId: string;
  title: string;
  description: string;
  price: number;
  isDonate: boolean;
  category: Category;
  condition: Condition;
  images: string[];
  aiPriceSuggestion: number | null;
  status: ListingStatus;
  viewCount: number;
  createdAt: Timestamp;
  updatedAt: Timestamp;
}

export interface WishlistItem {
  id: string;
  query: string;
  category: Category | null;
  maxPrice: number | null;
  createdAt: Timestamp;
  notifiedListings: string[];
}

export interface WishlistIndex {
  id: string;
  userId: string;
  campusId: string;
  category: Category | null;
  maxPrice: number | null;
  query: string;
  fcmToken: string | null;
}
