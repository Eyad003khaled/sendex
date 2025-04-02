import 'package:flutter/material.dart';
import 'package:sendex_test/core/utils/app_assets.dart';
import 'package:sendex_test/core/utils/app_strings.dart';
import 'package:sendex_test/core/utils/app_text_styles.dart';
import 'package:sendex_test/core/widgets/custom_button.dart';

import '../../../../../core/services/responsive_helper.dart';

class CustomOrderListViewItem extends StatelessWidget {
  final String clientName;
  final String address;
  final String status;
  final VoidCallback buttonOnPressed;

  const CustomOrderListViewItem({
    super.key,
    required this.clientName,
    required this.address,
    required this.status,
    required this.buttonOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveHelper.getProportionateWidth(context, 450),
      height: ResponsiveHelper.getProportionateHeight(context, 110),
    
      
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
            Image.asset(AppImages.imageStore, width: 50, height: 50), 
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(clientName, style: AppTextStyles.manropeSemiBoldstyle14),
                  const SizedBox(height: 4),
                  Text(address, style: AppTextStyles.manropeRegularstyle14),
                  const SizedBox(height: 4),
                  Text(status,
                      style: AppTextStyles.manropeSemiBoldstyle14.copyWith(
                          color: _getStatusColor(status))),
                ],
              ),
            ),
            
            SizedBox(
              width: 120, 
              child: CustomButton(text: AppStrings.showDetails, onPressed: buttonOnPressed),
            ),
            const SizedBox(width: 4),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case AppStrings.pending:
        return Colors.orange;
      case AppStrings.shipped:
        return Colors.blue;
      case AppStrings.delivered:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
