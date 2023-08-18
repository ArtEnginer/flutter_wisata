import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class UserModel {

  const UserModel({
    required this.fullname,
    required this.email,
    required this.role,
  });

  final String fullname;
  final String email;
  final List<dynamic> role;

  factory UserModel.fromJson(Map<String,dynamic> json) => UserModel(
    fullname: json['fullname'].toString(),
    email: json['email'].toString(),
    role: (json['role'] as List? ?? []).map((e) => e as dynamic).toList()
  );
  
  Map<String, dynamic> toJson() => {
    'fullname': fullname,
    'email': email,
    'role': role.map((e) => e.toString()).toList()
  };

  UserModel clone() => UserModel(
    fullname: fullname,
    email: email,
    role: role.toList()
  );


  UserModel copyWith({
    String? fullname,
    String? email,
    List<dynamic>? role
  }) => UserModel(
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
    role: role ?? this.role,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is UserModel && fullname == other.fullname && email == other.email && role == other.role;

  @override
  int get hashCode => fullname.hashCode ^ email.hashCode ^ role.hashCode;
}
