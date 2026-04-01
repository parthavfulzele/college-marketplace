import React from 'react';
import { View, Text } from 'react-native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { SellStackParamList } from '../types/navigation';
import { ScreenWrapper } from '../components/common';

const Stack = createNativeStackNavigator<SellStackParamList>();

function CreateListingPlaceholder() {
  return (
    <ScreenWrapper>
      <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
        <Text style={{ fontSize: 48 }}>📸</Text>
        <Text style={{ fontSize: 18, marginTop: 12, color: '#636E72' }}>
          Create listing coming in Phase 4
        </Text>
      </View>
    </ScreenWrapper>
  );
}

export function SellStack() {
  return (
    <Stack.Navigator screenOptions={{ headerShown: false }}>
      <Stack.Screen name="CreateListing" component={CreateListingPlaceholder} />
    </Stack.Navigator>
  );
}
