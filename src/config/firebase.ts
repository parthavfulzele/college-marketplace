import firebase from '@react-native-firebase/app';
import auth from '@react-native-firebase/auth';
import firestore from '@react-native-firebase/firestore';
import storage from '@react-native-firebase/storage';

// Firebase is auto-initialized by @react-native-firebase using
// GoogleService-Info.plist (iOS) configured via Expo config plugin.
// No manual initialization needed.

export { auth, firestore, storage };
export default firebase;
