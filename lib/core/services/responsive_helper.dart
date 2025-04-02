import 'package:flutter/widgets.dart';

class ResponsiveHelper {
  static double getWidth(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth;
  }

  static double getHeight(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight;
  }

  static double getProportionateWidth(BuildContext context, double inputWidth) {
    double screenWidth = MediaQuery.of(context).size.width;
    double baseWidth = 375; 
    return (inputWidth / baseWidth) * screenWidth;
  }

  static double getProportionateHeight(BuildContext context, double inputHeight) {
    double screenHeight = MediaQuery.of(context).size.height;
    double baseHeight = 667; 
    return (inputHeight / baseHeight) * screenHeight;
  }
}
