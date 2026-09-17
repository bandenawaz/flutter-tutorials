import 'package:neobank/features/auth/domain/entities/user.dart';

/// UserModel is the API/Database representation of User.
/// It knows how to parse JSON and convert to/from the domain entity.
class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.balance,
    super.profileImageUrl,
  });

  /// Factory method to create UserModel from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      balance: (json['balance'] as num).toDouble(),
      profileImageUrl: json['profileImageUrl'] as String?,
    );
  }

  /// Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'balance': balance,
      'profileImageUrl': profileImageUrl,
    };
  }

  /// Convert UserModel to domain entity
  User toEntity() {
    return User(
      id: id,
      name: name,
      email: email,
      balance: balance,
      profileImageUrl: profileImageUrl,
    );
  }

  /// Create UserModel from domain entity
  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      name: user.name,
      email: user.email,
      balance: user.balance,
      profileImageUrl: user.profileImageUrl,
    );
  }
}
