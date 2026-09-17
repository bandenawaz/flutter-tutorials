import 'package:equatable/equatable.dart';

/// A class representing a user entity in the authentication domain.
/// User entity represents the core business model
/// of the authentication domain.
class User extends Equatable {
  /// The unique identifier of the user.
  final String id;

  /// The name of the user.
  final String name;

  /// The email address of the user.
  final String email;
  final double balance;
  final String? profileImageUrl;

  /// Creates a new instance of [User].
  /// [User] represents the core business model of the authentication domain.
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.balance,
    this.profileImageUrl,
  });

  @override
  List<Object?> get props => [id, name, email, balance, profileImageUrl];

  /// Copy with pattern fpr immutable updates
  User copyWith({
    String? id,
    String? name,
    String? email,
    double? balance,
    String? profileImageUrl,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      balance: balance ?? this.balance,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }
}
