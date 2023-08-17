import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class AuthModel {

  const AuthModel({
    this.identity,
    this.token,
  });

  final String? identity;
  final String? token;

  factory AuthModel.fromJson(Map<String,dynamic> json) => AuthModel(
    identity: json['identity']?.toString(),
    token: json['token']?.toString()
  );
  
  Map<String, dynamic> toJson() => {
    'identity': identity,
    'token': token
  };

  AuthModel clone() => AuthModel(
    identity: identity,
    token: token
  );


  AuthModel copyWith({
    Optional<String?>? identity,
    Optional<String?>? token
  }) => AuthModel(
    identity: checkOptional(identity, () => this.identity),
    token: checkOptional(token, () => this.token),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is AuthModel && identity == other.identity && token == other.token;

  @override
  int get hashCode => identity.hashCode ^ token.hashCode;
}
