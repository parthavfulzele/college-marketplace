import React, { useEffect } from 'react';
import { ActivityIndicator, View, StyleSheet } from 'react-native';
import { NavigationContainer } from '@react-navigation/native';
import { AuthStack } from './AuthStack';
import { MainTabs } from './MainTabs';
import { useAuthStore } from '../stores/useAuthStore';
import { onAuthStateChanged } from '../services/authService';
import { getUserDocument, onUserDocumentChange } from '../services/userService';
import { lightColors } from '../config/theme';

export function RootNavigator() {
  const { firebaseUser, user, loading, initialized, setFirebaseUser, setUser, setLoading, setInitialized } =
    useAuthStore();

  useEffect(() => {
    const unsubscribe = onAuthStateChanged(async (fbUser) => {
      if (fbUser && fbUser.emailVerified) {
        setFirebaseUser({
          uid: fbUser.uid,
          email: fbUser.email || '',
          emailVerified: fbUser.emailVerified,
        });
        const userDoc = await getUserDocument(fbUser.uid);
        setUser(userDoc);
      } else {
        setFirebaseUser(fbUser ? { uid: fbUser.uid, email: fbUser.email || '', emailVerified: false } : null);
        setUser(null);
      }
      setLoading(false);
      setInitialized(true);
    });

    return unsubscribe;
  }, []);

  // Listen for real-time user doc changes when authenticated
  useEffect(() => {
    if (!firebaseUser?.uid || !firebaseUser.emailVerified) return;

    const unsubscribe = onUserDocumentChange(firebaseUser.uid, (userDoc) => {
      setUser(userDoc);
    });

    return unsubscribe;
  }, [firebaseUser?.uid, firebaseUser?.emailVerified]);

  if (loading || !initialized) {
    return (
      <View style={styles.loading}>
        <ActivityIndicator size="large" color={lightColors.primary} />
      </View>
    );
  }

  const isAuthenticated = firebaseUser && firebaseUser.emailVerified && user;

  return (
    <NavigationContainer>
      {isAuthenticated ? <MainTabs /> : <AuthStack />}
    </NavigationContainer>
  );
}

const styles = StyleSheet.create({
  loading: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: lightColors.background,
  },
});
