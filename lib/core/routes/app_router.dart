// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../../features/splash/presentation/screens/splash_screen.dart';
import '../functions/animations/animation.dart';




class AppRouter {
  // Route names
  static const String splashScreen = '/splash';


  // Generate routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return fadeRoute(const SplashScreen());

      // case homeScreen:
      //   return fadeRoute(  const HomeScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }


}
