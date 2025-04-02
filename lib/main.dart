import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sendex_test/app/sendex.dart';

import 'core/services/injection.dart';


void main() {
    WidgetsFlutterBinding.ensureInitialized();
    initGetIt();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const Sendex());
}

