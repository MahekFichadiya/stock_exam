import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_management_exam/values/app_colors.dart';
import 'package:stock_management_exam/values/app_text_style.dart';
import 'package:stock_management_exam/values/dimension.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final int? maxLine;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final bool readOnly;
  final TextCapitalization textCapitalization;
  final TextInputType textInputType;
  final bool obscureText;
  final TextStyle? style;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.prefixIcon,
    this.suffixIcon,
    this.hintText,
    this.maxLine,
    this.inputFormatters,
    this.maxLength,
    this.textInputAction = TextInputAction.next,
    this.validator,
    this.readOnly = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.newGreyColor.withAlpha(25),
        border: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(kBorderRadius)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(kBorderRadius)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.circular(kBorderRadius)),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor, width: 2),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.errorColor, width: 2),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.newGreyColor, width: 2),
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        alignLabelWithHint: true,
        hintText: hintText,
        hintStyle: mediumTextStyle.copyWith(fontSize: 14, letterSpacing: 0),
        counterText: "",
        errorMaxLines: 2,
      ),
      style: style ?? mediumTextStyle.copyWith(fontSize: 14),
      minLines: 1,
      maxLines: maxLine,
      inputFormatters: inputFormatters,
      maxLength: maxLength,
      textInputAction: textInputAction,
      validator: validator,
      readOnly: readOnly,
      textCapitalization: textCapitalization,
      keyboardType: textInputType,
      cursorColor: AppColors.newGreyColor,
      cursorErrorColor: AppColors.errorColor,
      obscureText: obscureText,
      onTapOutside: (event) => focusNode.unfocus(),
    );
  }
}
