import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { ProfileStackParamList } from '../types/navigation';
import { ScreenWrapper, Avatar, Button } from '../components/common';
import { useAuthStore } from '../stores/useAuthStore';
import { signOut } from '../services/authService';
import { lightColors, spacing, typography } from '../config/theme';

const Stack = createNativeStackNavigator<ProfileStackParamList>();

function ProfilePlaceholder() {
  const user = useAuthStore((s) => s.user);

  return (
    <ScreenWrapper>
      <View style={styles.container}>
        <Avatar
          uri={user?.avatarUrl ?? null}
          name={user?.displayName || 'User'}
          size="lg"
        />
        <Text style={styles.name}>{user?.displayName || 'User'}</Text>
        <Text style={styles.campus}>{user?.campusName || 'Campus'}</Text>
        <Button
          title="Sign Out"
          onPress={signOut}
          variant="secondary"
          style={styles.button}
        />
      </View>
    </ScreenWrapper>
  );
}

export function ProfileStack() {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="Profile" component={ProfilePlaceholder} />
    </Stack.Navigator>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: spacing.lg },
  name: { fontSize: typography.h2.fontSize, fontWeight: '700', color: lightColors.text, marginTop: spacing.base },
  campus: { fontSize: typography.body.fontSize, color: lightColors.textSecondary, marginBottom: spacing.xl },
  button: { marginTop: spacing.base },
});
