mixin Messagable {
  String message();
}

class GenericException with Messagable implements Exception {
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
