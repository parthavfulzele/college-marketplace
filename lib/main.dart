import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/donate_screen.dart';
import 'screens/create_listing_screen.dart';
import 'screens/chat_list_screen.dart';
import 'screens/profile_screen.dart';
import 'widgets/bottom_nav.dart';

void main() {
  runApp(const CollegeMarketplaceApp());
}

class CollegeMarketplaceApp extends StatelessWidget {
  const CollegeMarketplaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College Marketplace',
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatefulWidget {
  const AuthGate({super.key});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  bool _isLoggedIn = false;

  void _handleLogin() {
    setState(() => _isLoggedIn = true);
  }

  void _handleLogout() {
    setState(() => _isLoggedIn = false);
  }

  @override
  Widget build(BuildContext context) {
    if (!_isLoggedIn) {
      return LoginScreen(onLogin: _handleLogin);
    }
    return MainShell(onLogout: _handleLogout);
  }
}

class MainShell extends StatefulWidget {
  final VoidCallback onLogout;

  const MainShell({super.key, required this.onLogout});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  // Logical tab index — 2 is the Sell FAB (modal), never stored as current
  int _currentTab = 0;

  void _onTabTapped(int index) {
    if (index == 2) {
      // Sell button opens as a full-screen modal, does not change active tab
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CreateListingScreen()),
      );
      return;
    }
    setState(() => _currentTab = index);
  }

  Widget _buildBody() {
    switch (_currentTab) {
      case 0:
        return const HomeScreen();
      case 1:
        return const DonateScreen();
      case 3:
        return const ChatListScreen();
      case 4:
        return ProfileScreen(onLogout: widget.onLogout);
      default:
        return const HomeScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: AppBottomNav(
        currentIndex: _currentTab,
        onTap: _onTabTapped,
      ),
    );
  }
}
