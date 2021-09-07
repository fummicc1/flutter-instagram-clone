import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_test/flutter_test.dart';

class GenericExceptionMatcher extends Matcher {
  GenericException expected;
  GenericExceptionMatcher(this.expected);

  @override
  bool matches(actual, Map matchState) {
    matchState["actual_message"] =
        actual is GenericException ? actual.message() : "unknown";
    if (actual is! GenericException) {
      return false;
    }
    return actual.message() == expected.message();
  }

  @override
  Description describeMismatch(
      item, Description mismatchDescription, Map matchState, bool verbose) {
    return mismatchDescription.add(
        "has actual emitted exception message: '${matchState["actual_message"]}'");
  }

  @override
  Description describe(Description description) {
    return description
        .add("has expected exception message: '${expected.message()}'");
  }
}
