class SignUpResponseEntity {
   String? message;
   String? token;
   int? code;
   UserEntity? user;

  SignUpResponseEntity ({
    this.message,
    this.token,
    this.user,
    this.code,
  });
}

class UserEntity {
   String? username;
   String? firstName;
   String? lastName;
   String? email;
   String? phone;
   String? role;
   bool? isVerified;
   String? id;
   String? createdAt;

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