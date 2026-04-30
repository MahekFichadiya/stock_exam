import '../../generated/l10n.dart';

class FormValidation {
  static String? Function(String?)? phoneValidator = (String? value) {
    if (value!.isEmpty) {
      return S.current.fieldShouldntBeEmpty;
    }
    if (value.length < 10) {
      return S.current.lengthOfPhoneNumberShouldBe10Digit;
    }
    if (!RegExp(r'^[6789]').hasMatch(value)) {
      return S.current.enterAValidPhoneNumber;
    }
    return null;
  };

  static String? Function(String?)? passwordValidator = (String? value) {
    if (value!.isEmpty) {
      return S.current.fieldShouldntBeEmpty;
    }

    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return S.current.passwordShouldContainAtLeast1Uppercase;
    }
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return S.current.passwordShouldContainAtLeast1Lowercase;
    }
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return S.current.passwordShouldContainAtLeast1Digit;
    }
    if (!RegExp(r'[!@_#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return S.current.passwordShouldContainAtLeast1Nonalphabet;
    }
    if (RegExp(r'.{13,}').hasMatch(value)) {
      return S.current.lengthOfPasswordShouldBe58;
    }
    return null;
  };

  static String? Function(String?)? nameValidator = (String? value) {
    if (value!.isEmpty) {
      return S.current.fieldShouldntBeEmpty;
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return S.current.enterValidName;
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return S.current.nameShouldNotContainDigits;
    }
    if (RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return S.current.nameShouldNotContainNonAlphabeticValue;
    }
    return null;
  };

  static String? Function(String?)? emailValidator = (String? value) {
    if (value!.isEmpty) {
      return S.current.fieldShouldntBeEmpty;
    }
    if (!RegExp(r'[A-Za-z0-9.]+@[a-z]+\.[a-z]+').hasMatch(value)) {
      return S.current.enterValidEmailAddress;
    }
    if (RegExp(r'^[0-9]').hasMatch(value)) {
      return S.current.emailShouldNotStartWithTheDigit;
    }

    if (RegExp(r'^[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return S.current.emailShouldNotStartWithSymbol;
    }
    return null;
  };
}
