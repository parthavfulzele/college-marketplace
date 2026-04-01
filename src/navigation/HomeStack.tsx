import React from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { HomeStackParamList } from '../types/navigation';
import { ScreenWrapper } from '../components/common';
import { lightColors, spacing, typography } from '../config/theme';
import { useAuthStore } from '../stores/useAuthStore';

const Stack = createNativeStackNavigator<HomeStackParamList>();

function HomeScreenPlaceholder() {
  const campus = useAuthStore((s) => s.campus);
  return (
    <ScreenWrapper>
      <View style={styles.container}>
        <Text style={styles.campusHeader}>
          {campus?.name || 'Campus'} Marketplace
        </Text>
        <Text style={styles.body}>Home feed coming in Phase 3</Text>
      </View>
    </ScreenWrapper>
  );
}

export function HomeStack() {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="Home" component={HomeScreenPlaceholder} />
    </Stack.Navigator>
  );
}

const styles = StyleSheet.create({
  container: { flex: 1, justifyContent: 'center', alignItems: 'center', padding: spacing.lg },
  campusHeader: { fontSize: typography.h1.fontSize, fontWeight: '700', color: lightColors.primary, marginBottom: spacing.sm },
  body: { fontSize: typography.body.fontSize, color: lightColors.textSecondary },
});
