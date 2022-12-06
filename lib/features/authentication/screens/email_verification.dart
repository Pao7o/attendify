import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmailVerificationScreen extends StatelessWidget {
  static const String routeName = "/email_verification_screen";
  final String emailAddress;
  const EmailVerificationScreen({Key? key, required this.emailAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          LottieBuilder.asset("assets/lottie/sent.json", repeat: false),
          Text("Email sent to $emailAddress please check and confirm"),
          ElevatedButton(
              onPressed: () {}, child: const Text("Email already confirmed")),
          const Text("Did not receive the emai?"),
          ElevatedButton(onPressed: () {}, child: const Text("Resend email"))
        ],
      ),
    );
  }
}
