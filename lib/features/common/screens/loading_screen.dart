import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingScreen extends StatelessWidget {
  final String loadingMsg;
  const LoadingScreen({super.key, required this.loadingMsg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              child: LottieBuilder.asset("assets/lottie/party_globe.json")),
          const SizedBox(
            height: 24,
          ),
          Text(
            loadingMsg,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    ));
  }
}
