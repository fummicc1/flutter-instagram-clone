import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/providers/providers.dart';
import 'package:flutter_instagram/viewmodels/account_registration_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../fake/repositories/fake_auth_repository.dart';
import '../../fake/repositories/fake_user_repository.dart';
import '../common/exception_matcher.dart';

void main() {
  late AccountRegistrationViewModel viewModel;
  late ProviderContainer container;
  setUp(() {
    container = ProviderContainer();
    // container.updateOverrides([
    //   errorStateProvider
    //       .overrideWithProvider(StateProvider<GenericException?>((_) => null)),
    //   myProfileStateProvider
    //       .overrideWithProvider(StateProvider<String?>((_) => null))
    // ]);
    viewModel = AccountRegistrationViewModel(
        FakeAuthRepository(), FakeUserRepository(), container.read);
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
    var errorStream = container.read(errorStateProvider).stream;
    expectLater(errorStream,
        emits(GenericExceptionMatcher(AuthException("User already exists"))));
    var result = await viewModel.onClickNextButton();
    expect(result, false);
  });

  test("invalid_email", () async {
    viewModel.updateEmail("unknown");
    var errorStream = container.read(errorStateProvider).stream;
    expectLater(
        errorStream, emits(GenericExceptionMatcher(EmailInputException())));
    var result = await viewModel.onClickNextButton();
    expect(result, false);
  });
}
