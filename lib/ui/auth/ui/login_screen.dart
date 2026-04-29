import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stock_management_exam/core/locator/locator.dart';
import 'package:stock_management_exam/data/model/request_model/user_request_model/user_request_model.dart';
import 'package:stock_management_exam/generated/assets.dart';
import 'package:stock_management_exam/router/app_router.gr.dart';
import 'package:stock_management_exam/ui/auth/store/auth_store.dart';
import 'package:stock_management_exam/ui/auth/widget/bottom_ui.dart';
import 'package:stock_management_exam/ui/auth/widget/header_ui.dart';
import 'package:stock_management_exam/values/app_colors.dart';
import 'package:stock_management_exam/values/app_icon.dart';
import 'package:stock_management_exam/values/app_text_style.dart';
import 'package:stock_management_exam/values/screen_data.dart';
import 'package:stock_management_exam/widget/custom_app_bar.dart';
import 'package:stock_management_exam/widget/custom_submission_button.dart';
import 'package:stock_management_exam/widget/custom_text_field.dart';
import 'package:stock_management_exam/widget/show_message.dart';
import 'package:stock_management_exam/widget/show_success.dart';

import '../../../generated/l10n.dart';
import '../../../values/form_validation/form_validation.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  late final FocusNode _emailFocusNode;
  late final FocusNode _passwordFocus;

  ValueNotifier<bool> showPassword = ValueNotifier(false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailFocusNode = FocusNode();
    _passwordFocus = FocusNode();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _emailController.dispose();
    _passwordController.dispose();

    _emailFocusNode.dispose();
    _passwordFocus.dispose();

    showPassword.dispose();
  }

  var authStore = locator<AuthStore>();

  Future<void> login(UserRequestModel model) async {
    try {
      if (await authStore.login(model)) {
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
    var screenHeight = screenData.screeHeight;
    var screeWidth = screenData.screenWidth;
    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: CustomAppBar(showLeading: true),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderUi(isLogin: true),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.05, horizontal: screeWidth * 0.1),
                child: Column(
                  spacing: screenHeight * 0.03,
                  children: [
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: screenHeight * 0.02,
                        children: [
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
                          Text(S.of(context).password, style: semiBoldTextStyle.copyWith(color: AppColors.newGreyColor, fontSize: 14)),
                          ValueListenableBuilder(
                            valueListenable: showPassword,
                            builder: (context, value, child) {
                              return CustomTextField(
                                controller: _passwordController,
                                focusNode: _passwordFocus,
                                prefixIcon: Assets.images.passwordIconImage.image(),
                                hintText: S.of(context).enterPassword,
                                maxLength: 13,
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
                                textInputAction: TextInputAction.done,
                                style: mediumTextStyle.copyWith(fontSize: 14, letterSpacing: 3),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: screeWidth,
                      child: CustomSubmissionButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            login(UserRequestModel(email: _emailController.text.trim(), password: _passwordController.text.trim()));
                          }
                        },
                        label: S.of(context).logIn,
                      ),
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
            isLogin: true,
            onPressed: () {
              context.pushRoute(SignupRoute());
            },
          ),
        ),
      ),
    );
  }
}
