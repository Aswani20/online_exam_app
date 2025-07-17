class SignUpResponseEntity {
  final String? message;
  final String? token;
  final int? code;
  final UserEntity? user;

  SignUpResponseEntity ({
    this.message,
    this.token,
    this.user,
    this.code,
  });
}

class UserEntity {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? id;
  final String? createdAt;

  UserEntity ({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.id,
    this.createdAt,
  });
}