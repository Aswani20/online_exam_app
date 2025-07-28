class SignInResponseEntity {
  final String? message;
  final String? token;
  final UserEntity? user;

  SignInResponseEntity ({
    this.message,
    this.token,
    this.user,
  });
}

class UserEntity {
  final String? id;
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? role;
  final bool? isVerified;
  final String? createdAt;

  UserEntity ({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.role,
    this.isVerified,
    this.createdAt,
  });
}