import 'package:flutter/material.dart';
import 'package:redacted/redacted.dart';
import 'package:sendex_test/core/utils/app_assets.dart';
import 'package:sendex_test/core/utils/app_strings.dart';
import 'package:sendex_test/core/utils/app_text_styles.dart';
import 'package:sendex_test/core/widgets/custom_button.dart';

import '../../utils/app_colors.dart';

class CustomRedactedOrderItem extends StatelessWidget {


  const CustomRedactedOrderItem({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 450,
      height: 150,
    
      
      decoration: BoxDecoration(
        color: Colors.white, // Background color
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300, width: 1.5), // Border
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1), // Subtle shadow
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.imageStore, width: 50, height: 50), // Thumbnail
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Placeholder Placeholder", style: AppTextStyles.manropeSemiBoldstyle14),
                  const SizedBox(height: 4),
                  const Text("Placeholderrrrrrrrrrrrrrrrrrrrrrrrrrrrrr", style: AppTextStyles.manropeRegularstyle14),
                  const SizedBox(height: 4),
                  Text("Placeholder",
                      style: AppTextStyles.manropeSemiBoldstyle14.copyWith(
                        )),
                ],
              ),
            ),
            
            SizedBox(
              width: 120, 
              child: CustomButton(text: AppStrings.showDetails, onPressed: () {}),
            ),
            const SizedBox(width: 4),
          ],
        ).redacted(
                                context: context,
                                redact: true,
                                configuration: RedactedConfiguration(
                                  redactedColor: AppColors.redactColor,
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                ),
                              ),
      ),
    );
  }


}
