import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';

class CustomTextFieldEmail extends StatefulWidget {
  final String hintText;
    final String? Function(String?)? validator;  


  const CustomTextFieldEmail({super.key, this.hintText = AppStrings.emailTextFieldHinttext,    this.validator,  
});

  @override
  CustomTextFieldEmailState createState() => CustomTextFieldEmailState();
}

class CustomTextFieldEmailState extends State<CustomTextFieldEmail> {
  late FocusNode _focusNode;
  late TextEditingController _controller;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  // Email validation function
  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return AppStrings.emailTextFieldValidation1;
    }

    // Simple email regex validation
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);

    if (!regex.hasMatch(value)) {
      return AppStrings.emailTextFieldValidation2;
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: _controller,
      builder: (context, value, child) {
        bool isFilled = value.text.isNotEmpty;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
                        validator: widget.validator,

              controller: _controller,
              focusNode: _focusNode,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: AppTextStyles.manropeMediumstyle14.copyWith(
                  color: _focusNode.hasFocus ? AppColors.defaultColor : AppColors.placholderColor,
                ),
                prefixIcon: SvgPicture.asset(
                  AppImages.iconsEmail,
                  fit: BoxFit.scaleDown,
                  colorFilter: ColorFilter.mode(
                    isFilled ? AppColors.defaultColor : AppColors.placholderColor,
                    BlendMode.srcIn,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.borderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: AppColors.focusedBorderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.transparent,
                errorText: _errorText, // Show validation error
              ),
              onChanged: (text) {
                setState(() {
                  _errorText = _validateEmail(text);
                });
              },
            ),
          ],
        );
      },
    );
  }
}
