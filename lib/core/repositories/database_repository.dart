import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/user_model.dart';

class DatabaseRepository {
  final SupabaseClient _supabaseClient;

  DatabaseRepository(this._supabaseClient);

  Future<UserModel?> fetchProfile(String userId) async {
    try {
      final response =
          await _supabaseClient
              .from('profiles')
              .select()
              .eq('id', userId)
              .single();
      return UserModel.fromJson(response);
    } catch (e) {
      // print('Error fetching user: $e');
      return null;
    }
  }

  Future<UserModel?> createProfile({
    required String userId,
    required String username,
    String? profilePicUrl,
  }) async {
    try {
      final response =
          await _supabaseClient
              .from('profiles')
              .insert({
                'id': userId,
                'username': username,
                'profile_picture_url': profilePicUrl,
              })
              .select() // Select the data that was inserted
              .single(); // Expecting a single row back
      // Parse the inserted data into a UserModel
      return UserModel.fromJson(response);
    } catch (e) {
      // print('Error creating profile: $e');
      return null;
    }
  }
}
