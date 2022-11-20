import 'dart:async';

import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/constants.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/shared_pref.dart';
import 'package:attendify/features/common/utils.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash_screen";
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AppColors appColors = AppColors();
  Utils utils = Utils();
  SharedPref pref = SharedPref();

  darkOrLightTheme() async {
    String data = await pref.readString(pref.theme);
    debugPrint("data ------->> $data");
    if (utils.isEmpty(data)) {
      Constants.darkTheme = true;
      pref.saveString(pref.theme, "1");
    } else {
      if (data == "1") {
        Constants.darkTheme = true;
        pref.saveString(pref.theme, "1");
      } else if (data == "0") {
        Constants.darkTheme = false;
        pref.saveString(pref.theme, "0");
      }
    }
    debugPrint("darkTheme ------->> ${Constants.darkTheme}");
  }

  @override
  void initState() {
    super.initState();
    darkOrLightTheme();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            Constants.darkTheme ? Brightness.light : Brightness.dark,
        statusBarBrightness:
            Constants.darkTheme ? Brightness.dark : Brightness.light,
        systemNavigationBarColor: appColors.lightColor,
        // systemNavigationBarDividerColor: appColors.appDarkColor,
        systemNavigationBarIconBrightness:
            Constants.darkTheme ? Brightness.light : Brightness.dark,
      ),
    );
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.bottomCenter,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImagePath.splash),
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveFlutter.of(context).moderateScale(75)),
                child: Image.asset(ImagePath.appLogo),
              ),
              SizedBox(
                height: ResponsiveFlutter.of(context).moderateScale(100),
              ),
              Image.asset(
                ImagePath.splashImage,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
