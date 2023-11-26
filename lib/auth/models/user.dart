import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

var uuid = const Uuid();

/// {@template user}
/// User model
///
/// [User.empty] represents an unauthenticated user.
/// {@endtemplate}
class IUser extends Equatable {
  /// {@macro user}
  const IUser({
    required this.id,
    this.email,
    this.name,
    this.photo,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  /// Empty user which represents an unauthenticated user.
  static const empty = IUser(id: '', email: null, name: null, photo: null);

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == IUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != IUser.empty;

  @override
  List<Object?> get props => [email, id, name, photo];
}
