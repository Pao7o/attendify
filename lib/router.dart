import 'package:attendify/features/common/screens/error_screen.dart';
import 'package:attendify/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    default:
      return MaterialPageRoute(
          builder: (_) =>
              const ErrorScreen(errorMsg: "This Page Does Not Exist"));
  }
}
