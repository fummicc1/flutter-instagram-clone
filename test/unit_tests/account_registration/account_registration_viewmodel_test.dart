import 'dart:async';
import 'dart:io';

import 'package:flutter_instagram/common/exception.dart';
import 'package:flutter_instagram/viewmodels/account_registration_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fake/repositories/fake_auth_repository.dart';
import '../common/exception_matcher.dart';

void main() {
  late AccountRegistrationViewModel viewModel;
  setUp(() {
    viewModel = AccountRegistrationViewModel(FakeAuthRepository());
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
    var errorStream = viewModel.errorStream.stream;
    expectLater(
        errorStream,
        emits(GenericExceptionMatcher(
            SimpleException("Failed to auth: User already exists"))));
    var result = await viewModel.onClickNextButton();
    expect(result, false);
  });

  test("invalid_email", () async {
    viewModel.updateEmail("unknown");
    var errorStream = viewModel.errorStream.stream;
    expectLater(
        errorStream, emits(GenericExceptionMatcher(EmailInputException())));
    var result = await viewModel.onClickNextButton();
    expect(result, false);
  });
}
