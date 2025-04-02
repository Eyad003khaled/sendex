import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:sendex_test/core/functions/Toast/custom_toast.dart';
import 'package:sendex_test/core/utils/app_assets.dart';
import 'package:sendex_test/core/utils/app_dimensions.dart';
import 'package:sendex_test/core/utils/app_strings.dart';
import 'package:sendex_test/core/utils/app_text_styles.dart';
import 'package:sendex_test/core/widgets/custom_button.dart';

import '../../../../core/services/responsive_helper.dart';
import '../../../../core/widgets/custom_header_text.dart';

class OrderDetailsWidget extends StatefulWidget {
  final String clientName;
  final String clientAddress;
  final String status;

  const OrderDetailsWidget({
    super.key,
    required this.clientName,
    required this.clientAddress,
    required this.status,
  });

  @override
  State<OrderDetailsWidget> createState() => _OrderDetailsWidgetState();
}

class _OrderDetailsWidgetState extends State<OrderDetailsWidget> {
  late String status;
  @override
  void initState() {
    super.initState();
    status = widget.status;
  }

  // Function to update status based on the current state
  void updateStatus() {
    setState(() {
      switch (widget.status) {
        case AppStrings.pending:
          status = AppStrings.processing;
          break;
        case AppStrings.processing:
          status = AppStrings.delivered;
          break;
        case AppStrings.delivered:
          status = AppStrings.cancelled;
          break;
        case AppStrings.cancelled:
          status = AppStrings.pending;
          break;
      }
      showToast(true, AppStrings.updatedSuccessTitle,
          AppStrings.updatedSuccessSubtitle);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SlideInDown(
            child: Container(
              width: double.infinity,
              height: ResponsiveHelper.getProportionateHeight(context, 200),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.imageStore),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppDimensions.paddingSizeLarge,
                vertical: AppDimensions.paddingSizeLarge),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeInLeft(
                  child: Row(
                    children: [
                      Text(
                        AppStrings.clientName,
                        style: AppTextStyles.manropeBoldstyle14
                            .copyWith(fontSize: 20),
                      ),
                      Text(widget.clientName,
                          style: AppTextStyles.manropeBoldstyle14
                              .copyWith(fontSize: 24)),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                FadeInRight(
                  child: Row(
                    children: [
                      Text(
                        AppStrings.clientAddress,
                        style: AppTextStyles.manropeBoldstyle14
                            .copyWith(fontSize: 20),
                      ),
                      Flexible(
                          child: Text(
                        widget.clientAddress,
                        style: AppTextStyles.manropeRegularstyle14
                            .copyWith(fontSize: 16),
                        maxLines: 2,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Divider(),
                FadeInLeft(
                  child: const CustomHeaderText(
                    text: AppStrings.orderInfo,
                  ),
                ),
                const Divider(),
                const SizedBox(height: 20),
                FadeInRight(
                  child: Row(
                    children: [
                      Text(
                        AppStrings.orderDate,
                        style: AppTextStyles.manropeBoldstyle14
                            .copyWith(fontSize: 20),
                      ),
                      Flexible(
                          child: Text(
                        "${DateTime.now().subtract(const Duration(days: 3))}",
                        style: AppTextStyles.manropeSemiBoldstyle14
                            .copyWith(fontSize: 16),
                        maxLines: 2,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                FadeInLeft(
                  child: Row(
                    children: [
                      Text(
                        AppStrings.orderTotal,
                        style: AppTextStyles.manropeBoldstyle14
                            .copyWith(fontSize: 20),
                      ),
                      Flexible(
                          child: Text(
                        "150",
                        style: AppTextStyles.manropeSemiBoldstyle14
                            .copyWith(fontSize: 16),
                        maxLines: 2,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                FadeInRight(
                  child: Row(
                    children: [
                      Text(
                        AppStrings.product,
                        style: AppTextStyles.manropeBoldstyle14
                            .copyWith(fontSize: 20),
                      ),
                      Flexible(
                          child: Text(
                        "Laptop",
                        style: AppTextStyles.manropeSemiBoldstyle14
                            .copyWith(fontSize: 16),
                        maxLines: 2,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                FadeInLeft(
                  child: Row(
                    children: [
                      Text(
                        AppStrings.status,
                        style: AppTextStyles.manropeBoldstyle14
                            .copyWith(fontSize: 20),
                      ),
                      Flexible(
                          child: Text(
                        widget.status,
                        style: AppTextStyles.manropeSemiBoldstyle14
                            .copyWith(fontSize: 16),
                        maxLines: 2,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                BounceInUp(
                  delay: const Duration(milliseconds: 150),
                  child: CustomButton(
                    text: widget.status == 'Pending'
                        ? AppStrings.processing
                        : widget.status == 'Processing'
                            ? AppStrings.delivered
                            : widget.status == 'Delivered'
                                ? AppStrings.cancelled
                                : AppStrings.processing,
                    onPressed: updateStatus,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
