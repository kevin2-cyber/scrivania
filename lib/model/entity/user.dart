
import 'dart:convert';

class User {
  final String? id;
  final String fullname;
  final String email;
  final String password;

  User({
    this.id,
    required this.fullname,
    required this.email,
    required this.password,
  });

  User copyWith({
    String? id,
    String? fullname,
    String? email,
    String? phone,
    String? digitalAddress,
    String? password
  }) {
    return User(
        id: id ?? this.id,
        fullname: fullname ?? this.fullname,
        email: email ?? this.email,
        password: password ?? this.password
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic> {
      'fullname' : fullname,
      'email' : email,
      'password' : password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      fullname: map['fullname'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.encode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, fullname: $fullname, email: $email, password: $password)';
  }

  @override
  bool operator == (covariant User other) {
    if(identical(this, other)) return true;

    return other.id == id &&
        other.fullname == fullname &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode => id.hashCode ^ fullname.hashCode ^ email.hashCode ^ password.hashCode;

}