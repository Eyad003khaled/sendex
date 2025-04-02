// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:sendex_test/core/utils/app_strings.dart';
import 'package:sendex_test/core/utils/app_text_styles.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      color: AppColors.defaultButton,
      child: Center(
        child: Text(AppStrings.appName,
            style: AppTextStyles.manropeRegularstyle14
                .copyWith(color: AppColors.white,fontSize: 30)),
      ),
    );
  }
}
