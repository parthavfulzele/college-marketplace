import React from 'react';
import { View, Text } from 'react-native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { ChatStackParamList } from '../types/navigation';
import { ScreenWrapper, EmptyState } from '../components/common';

const Stack = createNativeStackNavigator<ChatStackParamList>();

function ChatListPlaceholder() {
  return (
    <ScreenWrapper>
      <EmptyState
        title="No Messages Yet"
        message="Find something you like and message the seller!"
      />
    </ScreenWrapper>
  );
}

export function ChatStack() {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="ChatList" component={ChatListPlaceholder} />
    </Stack.Navigator>
  );
}
