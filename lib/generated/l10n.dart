// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello !`
  String get hello {
    return Intl.message('Hello !', name: 'hello', desc: '', args: []);
  }

  /// `Mobile`
  String get mobile {
    return Intl.message('Mobile', name: 'mobile', desc: '', args: []);
  }

  /// `Enter Mobile No`
  String get enterMobileNo {
    return Intl.message(
      'Enter Mobile No',
      name: 'enterMobileNo',
      desc: '',
      args: [],
    );
  }

  /// `Field shouldn't be empty`
  String get fieldShouldntBeEmpty {
    return Intl.message(
      'Field shouldn\'t be empty',
      name: 'fieldShouldntBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid phone number`
  String get enterAValidPhoneNumber {
    return Intl.message(
      'Enter a valid phone number',
      name: 'enterAValidPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Length of phone number should be 10 digit`
  String get lengthOfPhoneNumberShouldBe10Digit {
    return Intl.message(
      'Length of phone number should be 10 digit',
      name: 'lengthOfPhoneNumberShouldBe10Digit',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Length of password should be 5-8`
  String get lengthOfPasswordShouldBe58 {
    return Intl.message(
      'Length of password should be 5-8',
      name: 'lengthOfPasswordShouldBe58',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least 1 uppercase`
  String get passwordShouldContainAtLeast1Uppercase {
    return Intl.message(
      'Password should contain at least 1 uppercase',
      name: 'passwordShouldContainAtLeast1Uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least 1 lowercase`
  String get passwordShouldContainAtLeast1Lowercase {
    return Intl.message(
      'Password should contain at least 1 lowercase',
      name: 'passwordShouldContainAtLeast1Lowercase',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least 1 digit`
  String get passwordShouldContainAtLeast1Digit {
    return Intl.message(
      'Password should contain at least 1 digit',
      name: 'passwordShouldContainAtLeast1Digit',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Log in`
  String get logIn {
    return Intl.message('Log in', name: 'logIn', desc: '', args: []);
  }

  /// `Don’t have an account?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don’t have an account?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Create Account`
  String get createAccount {
    return Intl.message(
      'Create Account',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter Full name`
  String get enterFullName {
    return Intl.message(
      'Enter Full name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid name`
  String get enterValidName {
    return Intl.message(
      'Enter valid name',
      name: 'enterValidName',
      desc: '',
      args: [],
    );
  }

  /// `Password should contain at least 1 non-alphabet`
  String get passwordShouldContainAtLeast1Nonalphabet {
    return Intl.message(
      'Password should contain at least 1 non-alphabet',
      name: 'passwordShouldContainAtLeast1Nonalphabet',
      desc: '',
      args: [],
    );
  }

  /// `Name should not contain digits`
  String get nameShouldNotContainDigits {
    return Intl.message(
      'Name should not contain digits',
      name: 'nameShouldNotContainDigits',
      desc: '',
      args: [],
    );
  }

  /// `Name should not contain non alphabetic value`
  String get nameShouldNotContainNonAlphabeticValue {
    return Intl.message(
      'Name should not contain non alphabetic value',
      name: 'nameShouldNotContainNonAlphabeticValue',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Enter email`
  String get enterEmail {
    return Intl.message('Enter email', name: 'enterEmail', desc: '', args: []);
  }

  /// `Enter valid email address`
  String get enterValidEmailAddress {
    return Intl.message(
      'Enter valid email address',
      name: 'enterValidEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password and confirm password should be same`
  String get passwordAndConfirmPasswordShouldBeSame {
    return Intl.message(
      'Password and confirm password should be same',
      name: 'passwordAndConfirmPasswordShouldBeSame',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `No Internet.. Please Check Your Internet`
  String get noInternetPleaseCheckYourInternet {
    return Intl.message(
      'No Internet.. Please Check Your Internet',
      name: 'noInternetPleaseCheckYourInternet',
      desc: '',
      args: [],
    );
  }

  /// `Unknown Error`
  String get unknownError {
    return Intl.message(
      'Unknown Error',
      name: 'unknownError',
      desc: '',
      args: [],
    );
  }

  /// `Request is canceled from the server`
  String get requestIsCanceledFromTheServer {
    return Intl.message(
      'Request is canceled from the server',
      name: 'requestIsCanceledFromTheServer',
      desc: '',
      args: [],
    );
  }

  /// `Connection timed out from the server`
  String get connectionTimedOutFromTheServer {
    return Intl.message(
      'Connection timed out from the server',
      name: 'connectionTimedOutFromTheServer',
      desc: '',
      args: [],
    );
  }

  /// `Received time out`
  String get receivedTimeOut {
    return Intl.message(
      'Received time out',
      name: 'receivedTimeOut',
      desc: '',
      args: [],
    );
  }

  /// `Send Time out`
  String get sendTimeOut {
    return Intl.message(
      'Send Time out',
      name: 'sendTimeOut',
      desc: '',
      args: [],
    );
  }

  /// `Request can't handle now. try it after some time..`
  String get requestCantHandleNowTryItAfterSomeTime {
    return Intl.message(
      'Request can\'t handle now. try it after some time..',
      name: 'requestCantHandleNowTryItAfterSomeTime',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message('OK', name: 'ok', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `By continuing, you agree to the`
  String get byContinuingYouAgreeToThe {
    return Intl.message(
      'By continuing, you agree to the',
      name: 'byContinuingYouAgreeToThe',
      desc: '',
      args: [],
    );
  }

  /// `Terms of Service`
  String get termsOfService {
    return Intl.message(
      'Terms of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message('and', name: 'and', desc: '', args: []);
  }

  /// `Privacy Policy.`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy.',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Agree to the terms and Conditions`
  String get agreeToTheTermsAndConditions {
    return Intl.message(
      'Agree to the terms and Conditions',
      name: 'agreeToTheTermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Live Signals`
  String get liveSignals {
    return Intl.message(
      'Live Signals',
      name: 'liveSignals',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
