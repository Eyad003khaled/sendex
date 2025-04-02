import 'package:flutter/material.dart';
import 'package:sendex_test/core/utils/app_text_styles.dart';

class CustomHeaderText extends StatelessWidget {
  const CustomHeaderText(
      {super.key,
      required this.text,
});
  final String text;


  @override
  Widget build(BuildContext context){
    return Row(
      children: [
        Text(text,style: AppTextStyles.manropeSemiBoldstyle14.copyWith(fontSize: 20),)
      ],
    );
  }
}