
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:sendex_test/core/utils/app_strings.dart';
import 'package:sendex_test/core/utils/app_text_styles.dart';
import 'package:sendex_test/features/splash/presentation/screens/test.dart';
import '../../../../core/utils/app_colors.dart';



class SplashWidget extends StatefulWidget {
  const SplashWidget({super.key});

  @override
  State<SplashWidget> createState() => _SplashWidgetState();
}

class _SplashWidgetState extends State<SplashWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Text(AppStrings.appName,style: AppTextStyles.manropeBoldstyle14.copyWith(color: AppColors.white,fontSize: 46)),
      nextScreen: const TestScreen(), 
      centered: true,
      duration: 2000, 
      splashTransition: SplashTransition.fadeTransition, 
      backgroundColor: AppColors.defaultButton,
    );


  }
}
