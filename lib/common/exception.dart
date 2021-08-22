import 'package:firebase_auth/firebase_auth.dart';

mixin Messagable {
  String message();
}

abstract class GenericException with Messagable implements Exception {
  @override
  String message() {
    throw UnimplementedError();
  }
}

class SimpleException extends GenericException {
  final String cause;
  SimpleException(this.cause);
  @override
  String message() => cause;
}

class EntityParserException extends GenericException {
  final Map<String, dynamic> data;

  EntityParserException(this.data);

  @override
  String message() => 'Failed to parse data: $data';
}

class AuthException extends GenericException {
  final String cause;
  AuthException(this.cause);
  @override
  String message() => "Failed to auth: $cause";
}

class EmailInputException extends GenericException {
  @override
  String message() => "Invalid Email Address";
}

class UserException extends GenericException {

  final String uid;
  /// 0...notFound
  final int code;

  UserException({required this.uid, required this.code});

  static UserException notFound(String uid) => UserException(uid: uid, code: 0);

  @override
  String message() {
    if (code == 0) {
      return "idが$uidのユーザーが見つかりませんでした";
    }
    return "エラーが発生しました";
  }
}