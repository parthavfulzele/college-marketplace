import React, { useState, useEffect } from 'react';
import { View, Text, StyleSheet } from 'react-native';
import { Button, ScreenWrapper } from '../../components/common';
import { resendVerificationEmail, reloadUser, signOut } from '../../services/authService';
import { lightColors, spacing, typography } from '../../config/theme';

export function VerifyEmailScreen() {
  const [resending, setResending] = useState(false);
  const [checking, setChecking] = useState(false);
  const [message, setMessage] = useState<string | null>(null);

  useEffect(() => {
    const interval = setInterval(async () => {
      const user = await reloadUser();
      if (user?.emailVerified) {
        clearInterval(interval);
      }
    }, 3000);

    return () => clearInterval(interval);
  }, []);

  async function handleResend() {
    setResending(true);
    setMessage(null);
    try {
      await resendVerificationEmail();
      setMessage('Verification email sent!');
    } catch (err: any) {
      setMessage(err.message || 'Failed to resend');
    } finally {
      setResending(false);
    }
  }

  async function handleCheckNow() {
    setChecking(true);
    try {
      const user = await reloadUser();
      if (!user?.emailVerified) {
        setMessage('Email not verified yet. Check your inbox.');
      }
    } catch {
      setMessage('Could not check. Try again.');
    } finally {
      setChecking(false);
    }
  }

  return (
    <ScreenWrapper>
      <View style={styles.container}>
        <Text style={styles.emoji}>📧</Text>
        <Text style={styles.title}>Check Your Email</Text>
        <Text style={styles.body}>
          We sent a verification link to your .edu email. Tap the link to verify your account.
        </Text>

        {message && <Text style={styles.message}>{message}</Text>}

        <Button
          title="I've Verified My Email"
          onPress={handleCheckNow}
          loading={checking}
          fullWidth
          style={styles.button}
        />

        <Button
          title="Resend Email"
          onPress={handleResend}
          loading={resending}
          variant="secondary"
          fullWidth
          style={styles.button}
        />

        <Button
          title="Sign Out"
          onPress={signOut}
          variant="ghost"
          style={styles.button}
        />
      </View>
    </ScreenWrapper>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    paddingHorizontal: spacing.lg,
  },
  emoji: {
    fontSize: 56,
    marginBottom: spacing.base,
  },
  title: {
    fontSize: typography.h1.fontSize,
    fontWeight: '700',
    color: lightColors.text,
    marginBottom: spacing.sm,
  },
  body: {
    fontSize: typography.body.fontSize,
    color: lightColors.textSecondary,
    textAlign: 'center',
    lineHeight: 24,
    marginBottom: spacing.xl,
  },
  message: {
    fontSize: 14,
    color: lightColors.primary,
    marginBottom: spacing.base,
    textAlign: 'center',
  },
  button: {
    marginBottom: spacing.md,
  },
});
