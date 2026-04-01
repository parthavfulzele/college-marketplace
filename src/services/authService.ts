import auth, { FirebaseAuthTypes } from '@react-native-firebase/auth';
import { isEduEmail, isSupportedCampus, getCampusFromEmail } from '../utils/validation';

export async function signUp(
  email: string,
  password: string,
  displayName: string
): Promise<FirebaseAuthTypes.UserCredential> {
  if (!isEduEmail(email)) {
    throw new Error('Please use a .edu email address');
  }
  if (!isSupportedCampus(email)) {
    throw new Error('Your university is not supported yet');
  }

  const credential = await auth().createUserWithEmailAndPassword(email, password);
  await credential.user.updateProfile({ displayName });
  await credential.user.sendEmailVerification();
  return credential;
}

export async function signIn(
  email: string,
  password: string
): Promise<FirebaseAuthTypes.UserCredential> {
  const credential = await auth().signInWithEmailAndPassword(email, password);

  if (!credential.user.emailVerified) {
    await auth().signOut();
    throw new Error('Please verify your email before signing in');
  }

  return credential;
}

export async function signOut(): Promise<void> {
  await auth().signOut();
}

export async function sendPasswordReset(email: string): Promise<void> {
  await auth().sendPasswordResetEmail(email);
}

export async function resendVerificationEmail(): Promise<void> {
  const user = auth().currentUser;
  if (!user) throw new Error('No user signed in');
  await user.sendEmailVerification();
}

export async function reloadUser(): Promise<FirebaseAuthTypes.User | null> {
  const user = auth().currentUser;
  if (!user) return null;
  await user.reload();
  return auth().currentUser;
}

export function onAuthStateChanged(
  callback: (user: FirebaseAuthTypes.User | null) => void
): () => void {
  return auth().onAuthStateChanged(callback);
}

export function getCurrentUser(): FirebaseAuthTypes.User | null {
  return auth().currentUser;
}
