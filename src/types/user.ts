import { Timestamp } from '@react-native-firebase/firestore';

export interface Campus {
  id: string;
  name: string;
  domain: string;
  primaryColor: string;
  secondaryColor: string;
}

export interface Sustainability {
  itemsSold: number;
  itemsDonated: number;
  itemsBought: number;
  moneySaved: number;
  co2Diverted: number;
}

export type BadgeType = 'fast_responder' | 'five_star' | 'generous_donor' | 'new_seller';

export type ThemePreference = 'light' | 'dark' | 'system';

export interface User {
  uid: string;
  email: string;
  displayName: string;
  avatarUrl: string | null;
  bio: string;
  campusId: string;
  campusName: string;
  graduationYear: number | null;
  fcmToken: string | null;
  listingCount: number;
  rating: number;
  ratingCount: number;
  badges: BadgeType[];
  sustainability: Sustainability;
  themePreference: ThemePreference;
  createdAt: Timestamp;
  updatedAt: Timestamp;
}

export interface Rating {
  id: string;
  fromUserId: string;
  toUserId: string;
  listingId: string;
  stars: number;
  comment: string | null;
  createdAt: Timestamp;
}
