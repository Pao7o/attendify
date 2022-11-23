import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/constants.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/create_event_screen.dart';
import 'package:attendify/screens/favorites_screen.dart';
import 'package:attendify/screens/home_page_screen.dart';
import 'package:attendify/screens/location_map.dart';
import 'package:attendify/screens/setting_screen.dart';
import 'package:attendify/screens/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'chat_screen.dart';
import 'my_booking_screen.dart';

class BottomBarScreen extends StatefulWidget {
  final String isFrom;
  const BottomBarScreen({Key? key, this.isFrom = ""}) : super(key: key);

  @override
  _BottomBarScreenState createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();
  Widget? tabBar;

  bool? home = true;
  bool? favorites = false;
  bool? create = false;
  bool? wallet = false;
  bool? setting = false;

  @override
  void initState() {
    super.initState();
    if (widget.isFrom == "Setting") {
      tabBar = const SettingScreen();
      home = false;
      favorites = false;
      create = false;
      wallet = false;
      setting = true;
      setState(() {});
    } else {
      tabBar = const HomeScreen();
      home = true;
      favorites = false;
      create = false;
      wallet = false;
      setting = false;
      setState(() {});
    }
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
        backgroundColor: appColors.appMediumColor,
        resizeToAvoidBottomInset: false,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            tabBar!,
            Stack(
              children: [
                Container(
                  height: ResponsiveFlutter.of(context).verticalScale(72),
                  margin: EdgeInsets.only(
                      top: ResponsiveFlutter.of(context).moderateScale(10)),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage(imagePath.bottomBar),
                      alignment: Alignment.center,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
                SizedBox(
                  height: ResponsiveFlutter.of(context).verticalScale(50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabBar = const HomeScreen();
                            home = true;
                            favorites = false;
                            create = false;
                            wallet = false;
                            setting = false;
                          });
                        },
                        child: Container(
                          height:
                              ResponsiveFlutter.of(context).verticalScale(30),
                          width:
                              ResponsiveFlutter.of(context).verticalScale(30),
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage(
                                home! ? ImagePath.homeSelect : ImagePath.home),
                            height:
                                ResponsiveFlutter.of(context).verticalScale(20),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabBar = const ChatInterface();
                            home = false;
                            favorites = true;
                            create = false;
                            wallet = false;
                            setting = false;
                          });
                        },
                        child: Container(
                          height:
                              ResponsiveFlutter.of(context).verticalScale(30),
                          width:
                              ResponsiveFlutter.of(context).verticalScale(30),
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage(favorites!
                                ? ImagePath.social_onselected
                                : ImagePath.social),
                            height: ResponsiveFlutter.of(context)
                                .verticalScale(24.5),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabBar = const CreateEventScreen();
                            home = false;
                            favorites = false;
                            create = true;
                            wallet = false;
                            setting = false;
                          });
                        },
                        child: Image(
                          image: const AssetImage(ImagePath.create),
                          height:
                              ResponsiveFlutter.of(context).verticalScale(45),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabBar = const MyBookingScreen();
                            home = false;
                            favorites = false;
                            create = false;
                            wallet = true;
                            setting = false;
                          });
                        },
                        child: Container(
                          height:
                              ResponsiveFlutter.of(context).verticalScale(30),
                          width:
                              ResponsiveFlutter.of(context).verticalScale(30),
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage(wallet!
                                ? ImagePath.ticket_onselected
                                : ImagePath.ticket),
                            height: ResponsiveFlutter.of(context)
                                .verticalScale(24.5),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            tabBar = const SettingScreen();
                            home = false;
                            favorites = false;
                            create = false;
                            wallet = false;
                            setting = true;
                          });
                        },
                        child: Container(
                          height:
                              ResponsiveFlutter.of(context).verticalScale(30),
                          width:
                              ResponsiveFlutter.of(context).verticalScale(30),
                          alignment: Alignment.center,
                          child: Image(
                            image: AssetImage(setting!
                                ? imagePath.settingSelect
                                : ImagePath.setting),
                            height:
                                ResponsiveFlutter.of(context).verticalScale(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
