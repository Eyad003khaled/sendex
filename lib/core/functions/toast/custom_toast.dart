import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../../utils/app_colors.dart';

// Variable to keep track of the current notification
showToast(bool isSuccess, String title, String description) {


  WidgetsBinding.instance.addPostFrameCallback((_) {
   toastification.show(
      type: isSuccess ? ToastificationType.success : ToastificationType.error,
      style: ToastificationStyle.flatColored,
      autoCloseDuration: const Duration(seconds: 5),
      title: Text(title),
      description: Text(description),
      alignment: Alignment.topCenter,

      animationDuration: const Duration(milliseconds: 300),
      animationBuilder: (context, animation, alignment, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      },
      showIcon: true,
      primaryColor: isSuccess ? Colors.green : Colors.red,
      backgroundColor: isSuccess
          ? const Color.fromARGB(255, 206, 255, 208)
          : const Color.fromARGB(255, 255, 175, 169),
      foregroundColor: AppColors.defaultColor,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      showProgressBar: false,
      closeButtonShowType: CloseButtonShowType.always,
      closeOnClick: true,
      pauseOnHover: true,
      dragToClose: false,
      applyBlurEffect: true,
    );
  });

  return Container(); // Return a placeholder widget
}
