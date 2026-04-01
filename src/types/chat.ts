import { Timestamp } from '@react-native-firebase/firestore';

export interface LastMessage {
  text: string;
  senderId: string;
  timestamp: Timestamp;
}

export interface Conversation {
  id: string;
  participants: string[];
  participantNames: Record<string, string>;
  participantAvatars: Record<string, string | null>;
  listingId: string;
  listingTitle: string;
  listingImage: string;
  lastMessage: LastMessage;
  unreadCount: Record<string, number>;
  updatedAt: Timestamp;
}

export interface Message {
  id: string;
  senderId: string;
  text: string;
  imageUrl: string | null;
  createdAt: Timestamp;
}
