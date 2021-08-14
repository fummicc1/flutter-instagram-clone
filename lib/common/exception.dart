mixin Messagable {
  String message();
}

class GenericException with Messagable implements Exception {
  @override
  String message() {
    throw UnimplementedError();
  }
}

class EntityParserException extends GenericException {

  final Map<String, dynamic> data;

  EntityParserException(this.data);

  @override
  String message() => 'Failed to parse data: $data';
}