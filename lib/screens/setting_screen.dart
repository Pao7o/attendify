import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/constants.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/shared_pref.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/model/common_model.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/about_us_screen.dart';
import 'package:attendify/screens/bottom_bar_screen.dart';
import 'package:attendify/screens/change_password_screen.dart';
import 'package:attendify/screens/help_and_support_screen.dart';
import 'package:attendify/features/authentication/screens/login_screen.dart';
import 'package:attendify/screens/notification_settings_screen.dart';
import 'package:attendify/screens/privacy_policy_screen.dart';
import 'package:attendify/screens/terms_and_condition_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  AppColors appColors = AppColors();
  SharedPref pref = SharedPref();

  List<CommonModel>? settingsList = [
    CommonModel(
        image: ImagePath.notifications, title: Strings.notificationSettings),
    CommonModel(image: ImagePath.privacy, title: Strings.changePassword),
    CommonModel(image: ImagePath.question, title: Strings.helpAndSupport),
    CommonModel(image: ImagePath.lock, title: Strings.privacyPolicy),
    CommonModel(image: ImagePath.question, title: Strings.termsAndCondition),
    CommonModel(image: ImagePath.info, title: Strings.aboutUs),
  ];
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
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            commonAppBar(
              context: context,
              title: Strings.settings,
              backArrow: false,
              theme: true,
              themeClick: () {
                if (!Constants.darkTheme) {
                  Constants.darkTheme = true;
                } else {
                  Constants.darkTheme = false;
                }
                setState(() {});
                storeThemeColor().then((value) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomBarScreen(
                              isFrom: "Setting",
                            )),
                    (route) => false,
                  );
                });
                setState(() {});
              },
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveFlutter.of(context).moderateScale(20),
                      vertical: ResponsiveFlutter.of(context).moderateScale(15),
                    ),
                    itemCount: settingsList!.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        if (index == 0) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const NotificationSettingsScreen(),
                            ),
                          );
                        } else if (index == 1) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ChangePasswordScreen(),
                            ),
                          );
                        } else if (index == 2) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const HelpAndSupportScreen(),
                            ),
                          );
                        } else if (index == 3) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PrivacyPolicyScreen(),
                            ),
                          );
                        } else if (index == 4) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const TermsAndConditionScreen(),
                            ),
                          );
                        } else if (index == 5) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AboutUsScreen(),
                            ),
                          );
                        }
                      },
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height:
                                ResponsiveFlutter.of(context).verticalScale(52),
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              left: ResponsiveFlutter.of(context)
                                  .moderateScale(15),
                            ),
                            padding: EdgeInsets.only(
                              right: ResponsiveFlutter.of(context)
                                  .moderateScale(20),
                              left: ResponsiveFlutter.of(context)
                                  .moderateScale(40),
                            ),
                            decoration: BoxDecoration(
                              color: appColors.appLightColor,
                              borderRadius: BorderRadius.circular(
                                ResponsiveFlutter.of(context).moderateScale(17),
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                MyTextView(
                                  settingsList![index].title!,
                                  textAligntNew: TextAlign.center,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightColor,
                                    fontWeightNew: FontWeight.w400,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(1.8),
                                  ),
                                ),
                                Image(
                                  image: const AssetImage(ImagePath.back),
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(13),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height:
                                ResponsiveFlutter.of(context).verticalScale(40),
                            width: ResponsiveFlutter.of(context).scale(40),
                            padding: EdgeInsets.symmetric(
                                vertical: ResponsiveFlutter.of(context)
                                    .moderateScale(12)),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: appColors.white,
                              border: Border.all(
                                color: appColors.appMediumColor,
                                width: ResponsiveFlutter.of(context).scale(3),
                              ),
                            ),
                            child: Image(
                              image: AssetImage(settingsList![index].image!),
                            ),
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: ResponsiveFlutter.of(context).verticalScale(5),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(50),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveFlutter.of(context).moderateScale(120),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                          (route) => false,
                        );
                      },
                      child: Container(
                        height: ResponsiveFlutter.of(context).scale(50),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: appColors.lightPinkColor,
                          borderRadius: BorderRadius.circular(
                            ResponsiveFlutter.of(context).moderateScale(30),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: const AssetImage(ImagePath.logout),
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(18),
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context).scale(10),
                            ),
                            MyTextView(
                              Strings.logout.toUpperCase(),
                              textAligntNew: TextAlign.center,
                              styleNew: MyTextStyle(
                                colorNew: appColors.black,
                                fontWeightNew: FontWeight.w600,
                                size:
                                    ResponsiveFlutter.of(context).fontSize(2.2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> storeThemeColor() async {
    pref.saveString(pref.theme, Constants.darkTheme ? "1" : "0");
  }
}
