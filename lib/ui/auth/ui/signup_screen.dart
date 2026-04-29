import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_management_exam/core/locator/locator.dart';

import 'package:stock_management_exam/router/app_router.gr.dart';
import 'package:stock_management_exam/ui/auth/store/auth_store.dart';
import 'package:stock_management_exam/ui/auth/widget/bottom_ui.dart';
import 'package:stock_management_exam/ui/auth/widget/header_ui.dart';
import 'package:stock_management_exam/values/app_colors.dart';
import 'package:stock_management_exam/values/screen_data.dart';
import 'package:stock_management_exam/widget/custom_app_bar.dart';
import 'package:stock_management_exam/widget/show_message.dart';

import '../../../data/model/response_model/user_response_model.dart';
import '../../../generated/assets.dart';
import '../../../generated/l10n.dart';
import '../../../values/app_icon.dart';
import '../../../values/app_text_style.dart';
import '../../../values/form_validation/form_validation.dart';
import '../../../widget/custom_submission_button.dart';
import '../../../widget/custom_text_field.dart';
import '../../../widget/show_success.dart';

@RoutePage()
class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _fullNameController;
  late final TextEditingController _emailController;
  late final TextEditingController _mobileController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  late final FocusNode _fullNameFocusNode;
  late final FocusNode _emailFocusNode;
  late final FocusNode _mobileFocus;
  late final FocusNode _passwordFocus;
  late final FocusNode _confirmPasswordFocusNode;

  ValueNotifier<bool> showPassword = ValueNotifier(false);
  ValueNotifier<bool> showConfirmPassword = ValueNotifier(false);
  ValueNotifier<bool> termsAndCondition = ValueNotifier(false);

  String? confirmPasswordValidator(String? value) {
    if (value!.isEmpty) {
      return S.current.fieldShouldntBeEmpty;
    }
    if (_passwordController.text != _confirmPasswordController.text) {
      return S.current.passwordAndConfirmPasswordShouldBeSame;
    }
    return null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _mobileController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _fullNameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _mobileFocus = FocusNode();
    _passwordFocus = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _fullNameController.dispose();
    _emailController.dispose();
    _mobileController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _fullNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _mobileFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocusNode.dispose();

    showPassword.dispose();
    showConfirmPassword.dispose();
  }

  var authStore = locator<AuthStore>();

  Future<void> signUp(UserResponseModel model) async {
    try {
      if (await authStore.signUp(model)) {
        if (!mounted) return;
        ShowSuccess(
          context: context,
          isError: false,
          onSuccessCallBack: () {
            context.router.push(HomeRoute());
          },
        ).show();
      } else {
        if (!mounted) return;
        ShowSuccess(context: context, isError: true, errorMessage: authStore.errorMessage).show();
      }
    } catch (e) {
      ShowMessage(context: context, message: e.toString()).show();
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenData = ScreenData(context: context);
    var screenWidth = screenData.screenWidth;
    var screenHeight = screenData.screeHeight;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(showLeading: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              HeaderUi(isLogin: false),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05, horizontal: screenWidth * 0.1),
                child: Column(
                  spacing: screenHeight * 0.03,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: screenHeight * 0.02,
                        children: [
                          //full name
                          Text(S.of(context).fullName, style: semiBoldTextStyle.copyWith(color: AppColors.newGreyColor, fontSize: 14)),
                          CustomTextField(
                            controller: _fullNameController,
                            focusNode: _fullNameFocusNode,
                            prefixIcon: Icon(AppIcon.personIcon),
                            hintText: S.of(context).enterFullName,
                            maxLength: 20,
                            maxLine: 2,
                            textInputType: TextInputType.text,
                            validator: FormValidation.nameValidator,
                            textCapitalization: TextCapitalization.words,
                          ),

                          //email
                          Text(S.of(context).email, style: semiBoldTextStyle.copyWith(color: AppColors.newGreyColor, fontSize: 14)),
                          CustomTextField(
                            controller: _emailController,
                            focusNode: _emailFocusNode,
                            prefixIcon: Assets.images.emailIconImage.image(),
                            hintText: S.of(context).enterEmail,
                            maxLength: 50,
                            maxLine: 2,
                            textInputType: TextInputType.emailAddress,
                            validator: FormValidation.emailValidator,
                          ),

                          //mobile
                          Text(S.of(context).mobile, style: semiBoldTextStyle.copyWith(color: AppColors.newGreyColor, fontSize: 14)),
                          CustomTextField(
                            controller: _mobileController,
                            focusNode: _mobileFocus,
                            prefixIcon: Assets.images.mobileIconImage.image(),
                            hintText: S.of(context).enterMobileNo,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            maxLength: 10,
                            textInputType: TextInputType.phone,
                            validator: FormValidation.phoneValidator,
                          ),

                          //password
                          Text(S.of(context).password, style: semiBoldTextStyle.copyWith(color: AppColors.newGreyColor, fontSize: 14)),
                          ValueListenableBuilder(
                            valueListenable: showPassword,
                            builder: (context, value, child) {
                              return CustomTextField(
                                controller: _passwordController,
                                focusNode: _passwordFocus,
                                prefixIcon: Assets.images.passwordIconImage.image(),
                                hintText: S.of(context).enterPassword,
                                maxLength: 8,
                                textInputType: TextInputType.visiblePassword,
                                validator: FormValidation.passwordValidator,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    showPassword.value = !value;
                                  },
                                  style: IconButton.styleFrom(overlayColor: AppColors.transparentColor),
                                  icon: showPassword.value ? Icon(AppIcon.inVisiblePasswordIcon) : Icon(AppIcon.visiblePasswordIcon),
                                ),
                                obscureText: !value,
                                maxLine: 1,
                                style: mediumTextStyle.copyWith(fontSize: 14, letterSpacing: 3),
                              );
                            },
                          ),

                          //confirm password
                          Text(S.of(context).confirmPassword, style: semiBoldTextStyle.copyWith(color: AppColors.newGreyColor, fontSize: 14)),
                          ValueListenableBuilder(
                            valueListenable: showConfirmPassword,
                            builder: (context, value, child) {
                              return CustomTextField(
                                controller: _confirmPasswordController,
                                focusNode: _confirmPasswordFocusNode,
                                prefixIcon: Assets.images.passwordIconImage.image(),
                                hintText: S.of(context).confirmPassword,
                                maxLength: 8,
                                textInputType: TextInputType.visiblePassword,
                                validator: confirmPasswordValidator,
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    showConfirmPassword.value = !value;
                                  },
                                  style: IconButton.styleFrom(overlayColor: AppColors.transparentColor),
                                  icon: showPassword.value ? Icon(AppIcon.inVisiblePasswordIcon) : Icon(AppIcon.visiblePasswordIcon),
                                ),
                                obscureText: !value,
                                maxLine: 1,
                                textInputAction: TextInputAction.done,
                                style: mediumTextStyle.copyWith(fontSize: 14, letterSpacing: 3),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        ValueListenableBuilder(
                          valueListenable: termsAndCondition,
                          builder: (context, value, child) {
                            return Checkbox(
                              value: value,
                              onChanged: (checkValue) {
                                termsAndCondition.value = checkValue!;
                              },
                              activeColor: AppColors.greenColor,
                              checkColor: AppColors.blackColor,
                            );
                          },
                        ),
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: regularTextStyle.copyWith(color: AppColors.newGreyColor, fontSize: 14),
                              children: [
                                TextSpan(text: S.of(context).byContinuingYouAgreeToThe),
                                TextSpan(
                                  text: S.of(context).termsOfService,
                                  style: mediumTextStyle.copyWith(color: AppColors.blackColor, fontSize: 14),
                                ),
                                TextSpan(text: S.of(context).and),
                                TextSpan(
                                  text: S.of(context).privacyPolicy,
                                  style: mediumTextStyle.copyWith(color: AppColors.blackColor, fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    ValueListenableBuilder(
                      valueListenable: termsAndCondition,
                      builder: (context, value, child) {
                        return SizedBox(
                          width: screenWidth,
                          child: CustomSubmissionButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                if (value) {
                                  signUp(
                                    UserResponseModel(
                                      fullName: _fullNameController.text.trim(),
                                      email: _emailController.text.trim(),
                                      phone: _mobileController.text.trim(),
                                      password: _confirmPasswordController.text.trim(),
                                    ),
                                  );
                                } else {
                                  ShowSuccess(isError: true, context: context, errorMessage: S.of(context).agreeToTheTermsAndConditions).show();
                                }
                              }
                            },
                            label: S.of(context).signUp,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppColors.transparentColor,
          child: BottomUi(
            isLogin: false,
            onPressed: () {
              context.pop();
            },
          ),
        ),
      ),
    );
  }
}
