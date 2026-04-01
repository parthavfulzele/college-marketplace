import { Listing } from './listing';

export type AuthStackParamList = {
  Login: undefined;
  Signup: undefined;
  VerifyEmail: undefined;
  ForgotPassword: undefined;
};

export type HomeStackParamList = {
  Home: undefined;
  ItemDetail: { listingId: string };
  Donate: undefined;
  SellerProfile: { userId: string };
};

export type SellStackParamList = {
  CreateListing: undefined;
};

export type ChatStackParamList = {
  ChatList: undefined;
  ChatRoom: { conversationId: string; listingTitle?: string };
};

export type ProfileStackParamList = {
  Profile: undefined;
  EditProfile: undefined;
  MyListings: undefined;
  Wishlist: undefined;
};

export type MainTabParamList = {
  HomeTab: undefined;
  SellTab: undefined;
  ChatTab: undefined;
  ProfileTab: undefined;
};
