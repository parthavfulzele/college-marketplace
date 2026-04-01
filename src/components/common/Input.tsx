import React, { useState } from 'react';
import {
  View,
  TextInput,
  Text,
  StyleSheet,
  TextInputProps,
  ViewStyle,
} from 'react-native';
import { lightColors, spacing, borderRadius, typography } from '../../config/theme';

interface InputProps extends TextInputProps {
  label?: string;
  error?: string | null;
  containerStyle?: ViewStyle;
}

export function Input({
  label,
  error,
  containerStyle,
  style,
  ...props
}: InputProps) {
  const [focused, setFocused] = useState(false);

  return (
    <View style={[styles.container, containerStyle]}>
      {label && <Text style={styles.label}>{label}</Text>}
      <TextInput
        style={[
          styles.input,
          focused && styles.inputFocused,
          error && styles.inputError,
          style,
        ]}
        placeholderTextColor={lightColors.textSecondary}
        onFocus={(e) => {
          setFocused(true);
          props.onFocus?.(e);
        }}
        onBlur={(e) => {
          setFocused(false);
          props.onBlur?.(e);
        }}
        {...props}
      />
      {error && <Text style={styles.error}>{error}</Text>}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    marginBottom: spacing.base,
  },
  label: {
    fontSize: typography.caption.fontSize,
    fontWeight: '600',
    color: lightColors.text,
    marginBottom: spacing.xs,
  },
  input: {
    height: 48,
    borderWidth: 1,
    borderColor: lightColors.inputBorder,
    borderRadius: borderRadius.md,
    paddingHorizontal: spacing.base,
    fontSize: typography.body.fontSize,
    color: lightColors.text,
    backgroundColor: '#FFFFFF',
  },
  inputFocused: {
    borderColor: lightColors.primary,
    borderWidth: 2,
  },
  inputError: {
    borderColor: lightColors.error,
    borderWidth: 2,
  },
  error: {
    fontSize: 12,
    color: lightColors.error,
    marginTop: spacing.xs,
  },
});
