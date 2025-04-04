import 'package:flutter/material.dart';

import '../../../core/repositories/auth_repository.dart';
import '../../../core/services/supabase_service.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authRepository = AuthRepository(SupabaseService.client);
    final user = authRepository.currentUser;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You logged in as ${user?.email ?? 'User'}'),
            const Text('Settings Screen Content'),
          ],
        ),
      ),
    );
  }
}
