import React from 'react';
import { View, Image, Text, StyleSheet } from 'react-native';
import { lightColors } from '../../config/theme';

interface AvatarProps {
  uri: string | null;
  name: string;
  size?: 'sm' | 'md' | 'lg';
}

const sizes = { sm: 32, md: 40, lg: 80 };

export function Avatar({ uri, name, size = 'md' }: AvatarProps) {
  const dimension = sizes[size];
  const fontSize = dimension * 0.4;
  const initials = name
    .split(' ')
    .map((n) => n[0])
    .join('')
    .toUpperCase()
    .slice(0, 2);

  if (uri) {
    return (
      <Image
        source={{ uri }}
        style={[
          styles.image,
          { width: dimension, height: dimension, borderRadius: dimension / 2 },
        ]}
      />
    );
  }

  return (
    <View
      style={[
        styles.placeholder,
        { width: dimension, height: dimension, borderRadius: dimension / 2 },
      ]}
    >
      <Text style={[styles.initials, { fontSize }]}>{initials}</Text>
    </View>
  );
}

const styles = StyleSheet.create({
  image: {
    backgroundColor: lightColors.skeleton,
  },
  placeholder: {
    backgroundColor: lightColors.primary,
    alignItems: 'center',
    justifyContent: 'center',
  },
  initials: {
    color: '#FFFFFF',
    fontWeight: '700',
  },
});
