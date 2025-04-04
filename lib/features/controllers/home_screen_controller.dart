import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/repositories/auth_repository.dart';
import '../../core/services/supabase_service.dart';
import '../components/common/my_appbar.dart';
import '../components/common/bottom_navigation_bar.dart'; // Import the bottom navigation bar component
import '../screens/home/home_screen.dart';
import '../screens/home/settings_screen.dart';
import '../screens/home/profile_screen.dart';

class HomeScreenController extends ConsumerStatefulWidget {
  const HomeScreenController({super.key});

  @override
  ConsumerState<HomeScreenController> createState() =>
      _HomeScreenControllerState();
}

class _HomeScreenControllerState extends ConsumerState<HomeScreenController> {
  int _selectedIndex = 0;

  final _widgetOptions = <Widget>[
    const HomeScreen(),
    const ProfileScreen(),
    const SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  String _title() {
    return _selectedIndex == 0
        ? "Home"
        : _selectedIndex == 1
        ? "Profile"
        : "Settings";
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> _snackbar(
    BuildContext context,
  ) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('See you later!'),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(25),
        showCloseIcon: true,
        elevation: 1,
        duration: const Duration(seconds: 3),
        dismissDirection: DismissDirection.horizontal,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }

  Future<dynamic> _loading(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository(SupabaseService.client);
    return Scaffold(
      appBar: MyAppbar(
        title: Text(_title()),
        actions:
            _title() == "Settings"
                ? [
                  IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () async {
                      // Show loading indicator
                      _loading(context);
                      // Sign out and Navigate to login screen
                      await authRepository.signOut();
                      context.go('/');
                      // Show snackbar
                      _snackbar(context);
                    },
                  ),
                ]
                : null,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: HomeBottomNavigationBar(
        // Use the imported component
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
