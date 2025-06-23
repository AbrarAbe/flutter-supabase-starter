class UserModel {
  final String id;
  final String? email;
  final String? username;
  final String? profilePicUrl;

  UserModel({required this.id, this.email, this.username, this.profilePicUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      profilePicUrl: json['profile_picture_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'profile_picture_url': profilePicUrl,
    };
  }
}
