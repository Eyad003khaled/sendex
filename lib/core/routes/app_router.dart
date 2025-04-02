// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sendex_test/features/orders/presentation/screens/orders_screen.dart';

import '../../features/order_details/presentation/screens/order_details_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';
import '../functions/animations/animation.dart';




class AppRouter {
  // Route names
  static const String splashScreen = '/splash';
  static const String ordersScreen = '/orders_screen';
  static const String orderDetailsScreen = '/order_details_screen';


  // Generate routes
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return fadeRoute(const SplashScreen());

      case ordersScreen:
        return slideRoute(  const OrdersScreen());

case orderDetailsScreen:
  final args = settings.arguments as Map<String, String>;
  final clientName = args['clientName'] ?? ''; // Provide a default value in case the key doesn't exist
  final clientAddress = args['clientAddress'] ?? '';
  final status = args['status'] ?? '';
  return fadeRoute(
    OrderDetailsScreen(
      clientName: clientName,
      clientAddress: clientAddress,
      status: status,
    ),
  );


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
