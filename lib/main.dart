import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sendex_test/app/sendex.dart';


void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const Sendex());
}

