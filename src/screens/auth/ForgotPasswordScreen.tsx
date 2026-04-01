import React, { useState } from 'react';
import { View, Text, StyleSheet, TouchableOpacity } from 'react-native';
import { NativeStackNavigationProp } from '@react-navigation/native-stack';
import { AuthStackParamList } from '../../types/navigation';
import { Button, Input, ScreenWrapper } from '../../components/common';
import { sendPasswordReset } from '../../services/authService';
import { lightColors, spacing, typography } from '../../config/theme';

type Props = {
  navigation: NativeStackNavigationProp<AuthStackParamList, 'ForgotPassword'>;
};

export function ForgotPasswordScreen({ navigation }: Props) {
  const [email, setEmail] = useState('');
  const [loading, setLoading] = useState(false);
  const [sent, setSent] = useState(false);
  const [error, setError] = useState<string | null>(null);

  async function handleReset() {
    setError(null);
    setLoading(true);
    try {
      await sendPasswordReset(email.trim());
      setSent(true);
    } catch (err: any) {
      setError(err.message || 'Failed to send reset email');
    } finally {
      setLoading(false);
    }
  }

  if (sent) {
    return (
      <ScreenWrapper>
        <View style={styles.container}>
          <Text style={styles.emoji}>✉️</Text>
          <Text style={styles.title}>Email Sent</Text>
          <Text style={styles.body}>
            Check your inbox for a password reset link.
          </Text>
          <Button
            title="Back to Login"
            onPress={() => navigation.navigate('Login')}
            fullWidth
          />
        </View>
      </ScreenWrapper>
    );
  }

  return (
    <ScreenWrapper>
      <View style={styles.container}>
        <Text style={styles.title}>Reset Password</Text>
        <Text style={styles.body}>
          Enter your .edu email and we'll send you a reset link.
        </Text>

        <Input
          label="Email"
          placeholder="you@university.edu"
          value={email}
          onChangeText={setEmail}
          keyboardType="email-address"
          autoCapitalize="none"
        />

        {error && <Text style={styles.error}>{error}</Text>}

        <Button
          title="Send Reset Link"
          onPress={handleReset}
          loading={loading}
          fullWidth
          disabled={!email}
        />

        <TouchableOpacity
          onPress={() => navigation.goBack()}
          style={styles.link}
        >
          <Text style={styles.linkText}>Back to Login</Text>
        </TouchableOpacity>
      </View>
    </ScreenWrapper>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    paddingHorizontal: spacing.lg,
  },
  emoji: {
    fontSize: 56,
    textAlign: 'center',
    marginBottom: spacing.base,
  },
  title: {
    fontSize: typography.h1.fontSize,
    fontWeight: '700',
    color: lightColors.text,
    marginBottom: spacing.sm,
    textAlign: 'center',
  },
  body: {
    fontSize: typography.body.fontSize,
    color: lightColors.textSecondary,
    textAlign: 'center',
    marginBottom: spacing.xl,
    lineHeight: 24,
  },
  error: {
    color: lightColors.error,
    fontSize: 14,
    textAlign: 'center',
    marginBottom: spacing.base,
  },
  link: {
    alignItems: 'center',
    marginTop: spacing.base,
  },
  linkText: {
    color: lightColors.primary,
    fontSize: 14,
  },
});
