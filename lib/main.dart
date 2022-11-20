import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/constants.dart';
import 'package:attendify/router.dart';
import 'package:attendify/features/splash/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  AppColors appColors = AppColors();
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Attendify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: appColors.primarySwatchColors,
        fontFamily: Constants.carosSoft,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const SplashScreen(),
    );
  }
}
