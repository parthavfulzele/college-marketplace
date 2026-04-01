import firestore from '@react-native-firebase/firestore';
import { User, Campus } from '../types/user';
import { getCampusFromEmail } from '../utils/validation';

const usersRef = firestore().collection('users');

export async function createUserDocument(
  uid: string,
  email: string,
  displayName: string
): Promise<void> {
  const campus = getCampusFromEmail(email);
  if (!campus) throw new Error('Unable to determine campus from email');

  const now = firestore.FieldValue.serverTimestamp();

  await usersRef.doc(uid).set({
    uid,
    email,
    displayName,
    avatarUrl: null,
    bio: '',
    campusId: campus.id,
    campusName: campus.name,
    graduationYear: null,
    fcmToken: null,
    listingCount: 0,
    rating: 0,
    ratingCount: 0,
    badges: ['new_seller'],
    sustainability: {
      itemsSold: 0,
      itemsDonated: 0,
      itemsBought: 0,
      moneySaved: 0,
      co2Diverted: 0,
    },
    themePreference: 'system',
    createdAt: now,
    updatedAt: now,
  });
}

export async function getUserDocument(uid: string): Promise<User | null> {
  const doc = await usersRef.doc(uid).get();
  if (!doc.exists) return null;
  return { ...doc.data(), uid: doc.id } as User;
}

export async function updateUserProfile(
  uid: string,
  updates: Partial<Pick<User, 'displayName' | 'bio' | 'graduationYear' | 'avatarUrl' | 'themePreference'>>
): Promise<void> {
  await usersRef.doc(uid).update({
    ...updates,
    updatedAt: firestore.FieldValue.serverTimestamp(),
  });
}

export async function updateFcmToken(uid: string, token: string): Promise<void> {
  await usersRef.doc(uid).update({ fcmToken: token });
}

export function onUserDocumentChange(
  uid: string,
  callback: (user: User | null) => void
): () => void {
  return usersRef.doc(uid).onSnapshot((doc) => {
    if (!doc.exists) {
      callback(null);
      return;
    }
    callback({ ...doc.data(), uid: doc.id } as User);
  });
}
