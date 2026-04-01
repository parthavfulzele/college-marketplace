import React, { useState, useMemo } from 'react';
import { View, Text, StyleSheet, TouchableOpacity, KeyboardAvoidingView, Platform, ScrollView } from 'react-native';
import { NativeStackNavigationProp } from '@react-navigation/native-stack';
import { AuthStackParamList } from '../../types/navigation';
import { Button, Input, ScreenWrapper } from '../../components/common';
import { signUp } from '../../services/authService';
import { createUserDocument } from '../../services/userService';
import { getCampusFromEmail, isEduEmail, validatePassword, validateDisplayName } from '../../utils/validation';
import { lightColors, spacing, typography } from '../../config/theme';

type Props = {
  navigation: NativeStackNavigationProp<AuthStackParamList, 'Signup'>;
};

export function SignupScreen({ navigation }: Props) {
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [displayName, setDisplayName] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  const detectedCampus = useMemo(() => getCampusFromEmail(email), [email]);
  const emailHint = useMemo(() => {
    if (!email) return null;
    if (!isEduEmail(email)) return 'Use your .edu email address';
    if (!detectedCampus) return 'Your university is not supported yet';
    return null;
  }, [email, detectedCampus]);

  async function handleSignup() {
    const nameError = validateDisplayName(displayName);
    if (nameError) { setError(nameError); return; }
    const passError = validatePassword(password);
    if (passError) { setError(passError); return; }

    setError(null);
    setLoading(true);
    try {
      const credential = await signUp(email.trim(), password, displayName.trim());
      await createUserDocument(credential.user.uid, email.trim(), displayName.trim());
      navigation.replace('VerifyEmail');
    } catch (err: any) {
      setError(err.message || 'Signup failed');
    } finally {
      setLoading(false);
    }
  }

  return (
    <ScreenWrapper>
      <KeyboardAvoidingView
        behavior={Platform.OS === 'ios' ? 'padding' : 'height'}
        style={styles.flex}
      >
        <ScrollView contentContainerStyle={styles.container} keyboardShouldPersistTaps="handled">
          <Text style={styles.title}>Create Account</Text>
          <Text style={styles.subtitle}>Join your campus marketplace</Text>

          <Input
            label="Full Name"
            placeholder="Your name"
            value={displayName}
            onChangeText={setDisplayName}
            autoCapitalize="words"
          />

          <Input
            label="Email"
            placeholder="you@university.edu"
            value={email}
            onChangeText={setEmail}
            keyboardType="email-address"
            autoCapitalize="none"
            autoCorrect={false}
            error={emailHint}
          />

          {detectedCampus && (
            <View style={[styles.campusBanner, { borderLeftColor: detectedCampus.primaryColor }]}>
              <Text style={styles.campusName}>{detectedCampus.name}</Text>
              <Text style={styles.campusNote}>Detected from your email</Text>
            </View>
          )}

          <Input
            label="Password"
            placeholder="At least 6 characters"
            value={password}
            onChangeText={setPassword}
            secureTextEntry
          />

          {error && <Text style={styles.error}>{error}</Text>}

          <Button
            title="Create Account"
            onPress={handleSignup}
            loading={loading}
            fullWidth
            disabled={!email || !password || !displayName || !detectedCampus}
          />

          <View style={styles.footer}>
            <Text style={styles.footerText}>Already have an account? </Text>
            <TouchableOpacity onPress={() => navigation.navigate('Login')}>
              <Text style={styles.footerLink}>Sign In</Text>
            </TouchableOpacity>
          </View>
        </ScrollView>
      </KeyboardAvoidingView>
    </ScreenWrapper>
  );
}

const styles = StyleSheet.create({
  flex: { flex: 1 },
  container: {
    paddingHorizontal: spacing.lg,
    paddingTop: spacing.xxl,
    paddingBottom: spacing.xl,
  },
  title: {
    fontSize: typography.h1.fontSize,
    fontWeight: '700',
    color: lightColors.text,
    marginBottom: spacing.xs,
  },
  subtitle: {
    fontSize: typography.body.fontSize,
    color: lightColors.textSecondary,
    marginBottom: spacing.xl,
  },
  campusBanner: {
    borderLeftWidth: 4,
    paddingLeft: spacing.md,
    paddingVertical: spacing.sm,
    marginBottom: spacing.base,
    backgroundColor: '#F0F0F0',
    borderRadius: 4,
  },
  campusName: {
    fontSize: 16,
    fontWeight: '700',
    color: lightColors.text,
  },
  campusNote: {
    fontSize: 12,
    color: lightColors.textSecondary,
  },
  error: {
    color: lightColors.error,
    fontSize: 14,
    textAlign: 'center',
    marginBottom: spacing.base,
  },
  footer: {
    flexDirection: 'row',
    justifyContent: 'center',
    marginTop: spacing.lg,
  },
  footerText: {
    color: lightColors.textSecondary,
    fontSize: 14,
  },
  footerLink: {
    color: lightColors.primary,
    fontSize: 14,
    fontWeight: '700',
  },
});
