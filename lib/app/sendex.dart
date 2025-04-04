import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

import '../core/routes/app_router.dart';

class Sendex extends StatelessWidget {
  const Sendex({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ToastificationWrapper(
      child:  MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: AppRouter.splashScreen,
          onGenerateRoute: AppRouter.generateRoute,
        ),
    );
    
  }
}
