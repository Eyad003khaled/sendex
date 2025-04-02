// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sendex_test/core/functions/toast/custom_toast.dart';
import 'package:sendex_test/core/routes/app_router.dart';

import '../../../../../core/database/database_helper.dart';
import '../../../../../core/utils/app_assets.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_dimensions.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_textfield_email.dart';
import '../../../../../core/widgets/custom_textfield_password.dart';

class LoginScreenWidget extends StatefulWidget {
  const LoginScreenWidget({super.key});

  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  final _formKey = GlobalKey<FormState>(); // Form key for validation

  // Create TextEditingControllers for email and password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                left: AppDimensions.paddingSizeExtraLarge,
                right: AppDimensions.paddingSizeExtraLarge,
                top: 64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: BounceInDown(
                    child: Lottie.asset(
                      AppImages.animation,
                      width: 280,
                      height: 280,
                      repeat: true,
                    ),
                  ),
                ),
                ZoomIn(
                  child: Text(
                    AppStrings.welcomeLoginTitle,
                    style: AppTextStyles.manropeBoldstyle14
                        .copyWith(fontSize: AppDimensions.fontSizeMegaLarge24),
                  ),
                ),
                const SizedBox(height: 8),
                ZoomIn(
                  child: Text(
                    AppStrings.welcomeLoginSubtitle,
                    style: AppTextStyles.manropeRegularstyle14
                        .copyWith(color: AppColors.subtitleColor),
                  ),
                ),
                const SizedBox(height: 32),

                // Wrap your fields inside the Form widget
                Form(
                  key: _formKey, // Attach the form key
                  child: Column(
                    children: [
                      FadeInRight(
                        child: CustomTextFieldEmail(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            // Simple email validation
                            final emailRegExp = RegExp(
                                r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                            if (!emailRegExp.hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: AppDimensions.paddingSizeLarge),
                      FadeInLeft(
                        child: CustomTextFieldPassword(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            if (value.length < 8) {
                              return 'Password must be at least 8 characters';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                      SlideInRight(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text(
                              AppStrings.forgetPassword,
                              style: AppTextStyles.manropeSemiBoldstyle14
                                  .copyWith(
                                      color: AppColors.defaultButton,
                                      fontSize: AppDimensions.fontSizeSmall12),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 68),
                      FadeInUp(
                        child: CustomButton(
                          text: AppStrings.signIn,
                          onPressed: () async {
                            if (_formKey.currentState?.validate() ?? false) {
                              await LocalStorage.saveUserLoginInfo(
                                  _emailController.text,
                                  _passwordController.text);

                              showToast(true, AppStrings.loginToastSuccess,
                                  AppStrings.loginToastSuccessDesc);

                              Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRouter.ordersScreen,
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              showToast(false, AppStrings.loginToastFailure,
                                  AppStrings.loginToastFailureDesc);
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: AppDimensions.paddingSizeLarge),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
