import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/models/user_model.dart';
import '../../../core/repositories/auth_repository.dart';
import '../../../core/repositories/database_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.authRepository,
    required this.databaseRepository,
  });

  final AuthRepository authRepository;
  final DatabaseRepository databaseRepository;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<UserModel?> userProfile;

  User? get currentUser => widget.authRepository.currentUser;

  @override
  void initState() {
    super.initState();
    userProfile = widget.databaseRepository.fetchProfile(currentUser?.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<UserModel?>(
        future: userProfile,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            late final username = snapshot.data?.username;
            return HomeScreenContent(
              username: username,
              currentUser: currentUser,
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({
    super.key,
    required this.username,
    required this.currentUser,
  });

  final String? username;
  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('You logged in as ${username ?? 'Your Username'}'),
          Text('You logged in as ${currentUser?.email ?? 'email@cxample.com'}'),
          const Text('Home Screen Content'),
        ],
      ),
    );
  }
}
