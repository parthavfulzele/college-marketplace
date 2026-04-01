import React from 'react';
import { View, Text, StyleSheet, ViewStyle } from 'react-native';
import { lightColors, spacing, borderRadius, typography } from '../../config/theme';

interface BadgeProps {
  label: string;
  variant?: 'free' | 'condition' | 'category' | 'status';
  color?: string;
  style?: ViewStyle;
}

export function Badge({ label, variant = 'condition', color, style }: BadgeProps) {
  const variantStyle = variantStyles[variant];

  return (
    <View
      style={[
        styles.base,
        variantStyle.container,
        color && { backgroundColor: color },
        style,
      ]}
    >
      <Text
        style={[
          styles.text,
          variantStyle.text,
          color && { color: '#FFFFFF' },
        ]}
      >
        {label}
      </Text>
    </View>
  );
}

const styles = StyleSheet.create({
  base: {
    paddingHorizontal: spacing.sm,
    paddingVertical: spacing.xs,
    borderRadius: borderRadius.pill,
    alignSelf: 'flex-start',
  },
  text: {
    fontSize: typography.badge.fontSize,
    fontWeight: '700',
  },
});

const variantStyles = {
  free: {
    container: { backgroundColor: lightColors.secondary } as ViewStyle,
    text: { color: '#FFFFFF' } as ViewStyle,
  },
  condition: {
    container: { backgroundColor: '#F0F0F0' } as ViewStyle,
    text: { color: lightColors.text } as ViewStyle,
  },
  category: {
    container: { backgroundColor: lightColors.primary } as ViewStyle,
    text: { color: '#FFFFFF' } as ViewStyle,
  },
  status: {
    container: { backgroundColor: lightColors.success } as ViewStyle,
    text: { color: '#FFFFFF' } as ViewStyle,
  },
};
