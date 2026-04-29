// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthStore on _AuthStore, Store {
  late final _$isLoadingAtom = Atom(
    name: '_AuthStore.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$successMessageAtom = Atom(
    name: '_AuthStore.successMessage',
    context: context,
  );

  @override
  String? get successMessage {
    _$successMessageAtom.reportRead();
    return super.successMessage;
  }

  @override
  set successMessage(String? value) {
    _$successMessageAtom.reportWrite(value, super.successMessage, () {
      super.successMessage = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_AuthStore.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$userResponseModelAtom = Atom(
    name: '_AuthStore.userResponseModel',
    context: context,
  );

  @override
  UserResponseModel? get userResponseModel {
    _$userResponseModelAtom.reportRead();
    return super.userResponseModel;
  }

  @override
  set userResponseModel(UserResponseModel? value) {
    _$userResponseModelAtom.reportWrite(value, super.userResponseModel, () {
      super.userResponseModel = value;
    });
  }

  late final _$signUpAsyncAction = AsyncAction(
    '_AuthStore.signUp',
    context: context,
  );

  @override
  Future<bool> signUp(UserResponseModel model) {
    return _$signUpAsyncAction.run(() => super.signUp(model));
  }

  late final _$loginAsyncAction = AsyncAction(
    '_AuthStore.login',
    context: context,
  );

  @override
  Future<bool> login(UserRequestModel model) {
    return _$loginAsyncAction.run(() => super.login(model));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
successMessage: ${successMessage},
errorMessage: ${errorMessage},
userResponseModel: ${userResponseModel}
    ''';
  }
}
