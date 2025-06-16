//user_model.dart
class UserModel {
  final int id;
  final String username;
  final String code;
  final String name;
  final String
      password; // Optional field, default to empty string if not present

  UserModel({
    required this.id,
    required this.username,
    required this.code,
    required this.name,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'] ??
          '', // Optional field, default to empty string if not present
      code: json['code'],
      name: json['name'] ??
          '', // Optional field, default to empty string if not present
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'code': code,
    };
  }
}
