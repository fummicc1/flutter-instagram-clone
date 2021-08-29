import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/viewmodels/login_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../fake/repositories/fake_auth_repository.dart';
import '../../fake/repositories/fake_user_repository.dart';
import '../common/exception_matcher.dart';

void main() {
  late LoginViewModel viewModel;
  late ProviderContainer container;
  setUp(() {
    container = ProviderContainer();
    viewModel = LoginViewModel(
        FakeAuthRepository(), FakeUserRepository(), container.read);
  });
  test("valid_account", () async {
    viewModel.updateEmail("fake@fastriver.dev");
    viewModel.updatePassword("fake");
    var result = await viewModel.onClickLoginButton();
    expect(result, true);
  });

  test("no_account", () async {
    viewModel.updateEmail("non_fake@fastriver.dev");
    viewModel.updatePassword("foo");
    var errorStream = container.read(errorStateProvider).stream;
    expectLater(errorStream,
        emits(GenericExceptionMatcher(AuthException("User not found"))));
    var result = await viewModel.onClickLoginButton();
    expect(result, false);
  });

  test("invalid_email", () async {
    viewModel.updateEmail("unknown");
    var errorStream = container.read(errorStateProvider).stream;
    expectLater(
        errorStream, emits(GenericExceptionMatcher(EmailInputException())));
    var result = await viewModel.onClickLoginButton();
    expect(result, false);
  });
}
