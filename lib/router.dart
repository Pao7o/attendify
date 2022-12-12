import 'package:attendify/features/authentication/screens/phone_verification_screen.dart';
import 'package:attendify/features/authentication/screens/signup_screen.dart';
import 'package:attendify/features/common/screens/error_screen.dart';
import 'package:attendify/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';

import 'features/authentication/screens/email_verification_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    case EmailVerification.routeName:
      final emailAddress = settings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => EmailVerification(emailAddress: emailAddress));
    default:
      return MaterialPageRoute(
          builder: (_) =>
              const ErrorScreen(errorMsg: "This Page Does Not Exist"));
  }
}
