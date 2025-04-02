import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_assets.dart';
import '../utils/app_colors.dart';
import '../utils/app_strings.dart';
import '../utils/app_text_styles.dart';

class CustomTextFieldPassword extends StatefulWidget {
  final String hintText;
  final String? Function(String?)? validator;  


  const CustomTextFieldPassword(
      {super.key, this.hintText = AppStrings.passwordTextFieldHinttext,    this.validator,  
});

  @override
  CustomTextFieldPasswordState createState() => CustomTextFieldPasswordState();
}

class CustomTextFieldPasswordState extends State<CustomTextFieldPassword> {
  late FocusNode _focusNode;
  late TextEditingController _controller;

  bool _obscureText = true;
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

  // Password validation function
  String? _validatePassword(String value) {
    if (value.isEmpty) {
      return "Password can't be empty";
    }
    if (value.length < 8) {
      return "Password must be at least 8 characters long";
    }
    if (!RegExp(r'(?=.*?[A-Z])').hasMatch(value)) {
      return "Password must contain at least one uppercase letter";
    }
    if (!RegExp(r'(?=.*?[a-z])').hasMatch(value)) {
      return "Password must contain at least one lowercase letter";
    }
    if (!RegExp(r'(?=.*?[0-9])').hasMatch(value)) {
      return "Password must contain at least one number";
    }

    return null; // If everything is fine
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

                keyboardType: TextInputType.visiblePassword,
                controller: _controller,
                focusNode: _focusNode,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  hintStyle: AppTextStyles.manropeMediumstyle14.copyWith(
                    color: _focusNode.hasFocus
                        ? AppColors.defaultColor
                        : AppColors.placholderColor,
                  ),
                  prefixIcon: SvgPicture.asset(
                    AppImages.iconsPassword,
                    fit: BoxFit.scaleDown,
                    colorFilter: ColorFilter.mode(
                      isFilled
                          ? AppColors.defaultColor
                          : AppColors.placholderColor,
                      BlendMode.srcIn,
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: _obscureText
                        ? SizedBox(
                            width: 24, // Adjust size as needed
                            height: 24,
                            child: SvgPicture.asset(
                              AppImages.iconsEye,
                              fit: BoxFit.scaleDown,
                              colorFilter: ColorFilter.mode(
                                isFilled
                                    ? AppColors.defaultColor
                                    : AppColors.placholderColor,
                                BlendMode.srcIn,
                              ),
                            ),
                          )
                        : SvgPicture.asset(AppImages.iconsOpenEye),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.borderColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: AppColors.focusedBorderColor),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  errorText: _errorText, // Show validation error
                ),
                onChanged: (text) {
                  setState(() {
                    _errorText = _validatePassword(text);
                  });
                },
              ),
            ],
          );
        });
  }
}
