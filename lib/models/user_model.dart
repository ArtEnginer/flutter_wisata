import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class UserModel {

  const UserModel({
    required this.fullname,
    required this.email,
  });

  final String fullname;
  final String email;

  factory UserModel.fromJson(Map<String,dynamic> json) => UserModel(
    fullname: json['fullname'].toString(),
    email: json['email'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'fullname': fullname,
    'email': email
  };

  UserModel clone() => UserModel(
    fullname: fullname,
    email: email
  );


  UserModel copyWith({
    String? fullname,
    String? email
  }) => UserModel(
    fullname: fullname ?? this.fullname,
    email: email ?? this.email,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is UserModel && fullname == other.fullname && email == other.email;

  @override
  int get hashCode => fullname.hashCode ^ email.hashCode;
}
