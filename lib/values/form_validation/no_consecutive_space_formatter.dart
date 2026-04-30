import 'package:flutter/services.dart';

class NoConsecutiveSpaceFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    if (newText.startsWith(' ')) {
      newText = newText.trimLeft();
    }

    newText = newText.replaceAll(RegExp(r'/s{2,}'), '');

    if (newText != newValue.text) {
      return TextEditingValue(
        text: newText,
        selection: TextSelection.collapsed(offset: newText.length),
      );
    }

    return newValue;
  }
}
