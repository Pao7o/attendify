import 'package:attendify/features/authentication/screens/phone_number_screen.dart';
import 'package:attendify/features/authentication/screens/phone_verification_screen.dart';
import 'package:attendify/features/authentication/screens/signup_screen.dart';
import 'package:attendify/features/common/screens/error_screen.dart';
import 'package:attendify/features/splash/screens/splash_screen.dart';
import 'package:attendify/features/authentication/screens/login_screen.dart';
import 'package:attendify/screens/bottom_bar_screen.dart';
import 'package:attendify/screens/home_page_screen.dart';
import 'package:flutter/material.dart';

import 'features/authentication/screens/email_verification_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print("Recived route is ${settings.name}");
  switch (settings.name) {
    case SplashScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SplashScreen());
    case SignUpScreen.routeName:
      return MaterialPageRoute(builder: (_) => const SignUpScreen());
    case LoginScreen.routeName:
      return MaterialPageRoute(builder: (_) => const LoginScreen());
    case HomeScreen.routeName:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case BottomBarScreen.routeName:
      return MaterialPageRoute(builder: (_) => const BottomBarScreen());
    case PhoneNumberScreen.routeName:
      return MaterialPageRoute(builder: (_) => const PhoneNumberScreen());
    case EmailVerification.routeName:
      final emailAddress = settings.arguments as String;
      return MaterialPageRoute(
          builder: (_) => EmailVerification(emailAddress: emailAddress));
    case PhoneVerificationScreen.routeName:
      final arguments = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
          builder: (_) => PhoneVerificationScreen(
                verificationId: arguments['verificationId'],
                phoneNumber: arguments['phoneNumber'],
              ));
    default:
      return MaterialPageRoute(
          builder: (_) =>
              const ErrorScreen(errorMsg: "This Page Does Not Exist"));
  }
}
