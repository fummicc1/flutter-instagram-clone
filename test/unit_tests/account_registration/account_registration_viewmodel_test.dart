import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/common/exception_notifier.dart';
import 'package:flutter_instagram/viewmodels/account_registration_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../fake/repositories/fake_auth_repository.dart';
import '../../fake/repositories/fake_user_repository.dart';
import '../common/exception_matcher.dart';

void main() {
  late AccountRegistrationViewModel viewModel;
  late ExceptionStorable errorStateNotifier;
  setUp(() {
    errorStateNotifier = ExceptionNotifier(null);
    viewModel = AccountRegistrationViewModel(
        FakeAuthRepository(), FakeUserRepository(), errorStateNotifier);
  });
  test("valid_account", () async {
    viewModel.updateEmail("foo@fastriver.dev");
    viewModel.updatePassword("bar");
    var result = await viewModel.onClickNextButton();
    expect(result, true);
  });

  test("conflict_account", () async {
    viewModel.updateEmail("fake@fastriver.dev");
    viewModel.updatePassword("foo");
    final result = await viewModel.onClickNextButton();
    final exception = errorStateNotifier.exception;
    expect(exception, GenericExceptionMatcher(AuthException("User already exists")));
    expect(result, false);
  });

  test("invalid_email", () async {
    viewModel.updateEmail("unknown");
    final result = await viewModel.onClickNextButton();
    final exception = errorStateNotifier.exception;
    expect(exception, GenericExceptionMatcher(EmailInputException()));
    expect(result, false);
  });
}
