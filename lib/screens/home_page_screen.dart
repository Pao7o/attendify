import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/location_controller.dart';
import 'package:attendify/screens/location_map.dart';
import 'package:attendify/screens/near_by_event_screen.dart';
import 'package:attendify/screens/notification_screen.dart';
import 'package:attendify/screens/popular_event_screen.dart';
import 'package:attendify/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  AppColors appColors = AppColors();

  TabController? tabController;
  int? tab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: appColors.appMediumColor,
          body: Column(
            children: [
              Container(
                height: ResponsiveFlutter.of(context).moderateScale(235),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + ResponsiveFlutter.of(context).moderateScale(10),
                  right: ResponsiveFlutter.of(context).moderateScale(20),
                  left: ResponsiveFlutter.of(context).moderateScale(20),
                  bottom: ResponsiveFlutter.of(context).moderateScale(20),
                ),
                decoration: BoxDecoration(
                  color: appColors.appDarkColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                    bottomRight: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          child: Image.asset(
                            ImagePath.location,
                            height: ResponsiveFlutter.of(context).moderateScale(20),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatPage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: ResponsiveFlutter.of(context).moderateScale(8)),
                        GestureDetector(
                          child: MyTextView(
                            Strings.dummyText24,
                            textAligntNew: TextAlign.start,
                            maxLineWrap: true,
                            styleNew: MyTextStyle(
                              colorNew: appColors.lightColor,
                              fontWeightNew: FontWeight.w500,
                              size: ResponsiveFlutter.of(context).fontSize(2.2),
                            ),
                          ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LocationTest(),
                                ),
                              );
                            },
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const NotificationScreen(),
                              ),
                            );
                          },
                          child: SizedBox(
                            height: ResponsiveFlutter.of(context).moderateScale(22),
                            width: ResponsiveFlutter.of(context).moderateScale(25),
                            child: Stack(
                              children: [
                                Image.asset(
                                  ImagePath.bell,
                                  height: ResponsiveFlutter.of(context).moderateScale(22),
                                  color: appColors.lightColor,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: ResponsiveFlutter.of(context).moderateScale(15),
                                    width: ResponsiveFlutter.of(context).moderateScale(15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: appColors.btnColor,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: appColors.appDarkColor,
                                        width: ResponsiveFlutter.of(context).moderateScale(2.5),
                                      ),
                                    ),
                                    child: MyTextView(
                                      "2",
                                      textAligntNew: TextAlign.center,
                                      maxLineWrap: true,
                                      styleNew: MyTextStyle(
                                        colorNew: appColors.lightColor,
                                        fontWeightNew: FontWeight.w500,
                                        textHeight: 1,
                                        size: ResponsiveFlutter.of(context).fontSize(1),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: ResponsiveFlutter.of(context).moderateScale(15),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ProfileScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: ResponsiveFlutter.of(context).moderateScale(50),
                            width: ResponsiveFlutter.of(context).moderateScale(50),
                            decoration: BoxDecoration(
                              color: appColors.appMediumColor,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              ImagePath.image_3,
                              height: ResponsiveFlutter.of(context).moderateScale(25),
                            ),
                          ),
                        ),
                      ],
                    ),
                    MyTextView(
                      Strings.dummyText25,
                      textAligntNew: TextAlign.start,
                      maxLineWrap: true,
                      styleNew: MyTextStyle(
                        colorNew: appColors.lightColor,
                        fontWeightNew: FontWeight.w600,
                        size: ResponsiveFlutter.of(context).fontSize(3.3),
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: TabBar(
                            controller: tabController,
                            indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                ResponsiveFlutter.of(context).moderateScale(25),
                              ), // Creates border
                              color: appColors.btnColor,
                            ),
                            onTap: (value) {
                              tab = value;
                              setState(() {});
                              debugPrint("value ------>> $value");
                            },
                            tabs: [
                              Container(
                                height: ResponsiveFlutter.of(context).moderateScale(45),
                                alignment: Alignment.center,
                                child: MyTextView(
                                  Strings.popularEvent,
                                  textAligntNew: TextAlign.start,
                                  maxLineWrap: true,
                                  styleNew: MyTextStyle(
                                    colorNew: tab == 0 ? appColors.white : appColors.darkGreyText,
                                    fontWeightNew: FontWeight.w600,
                                    size: ResponsiveFlutter.of(context).fontSize(1.8),
                                  ),
                                ),
                              ),
                              Container(
                                height: ResponsiveFlutter.of(context).moderateScale(45),
                                alignment: Alignment.center,
                                child: MyTextView(
                                  Strings.nearbyEvent,
                                  textAligntNew: TextAlign.start,
                                  maxLineWrap: true,
                                  styleNew: MyTextStyle(
                                    colorNew: tab == 1 ? appColors.white : appColors.darkGreyText,
                                    fontWeightNew: FontWeight.w600,
                                    size: ResponsiveFlutter.of(context).fontSize(1.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Expanded(
                          flex: 2,
                          child: SizedBox(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      PopularEventScreen(),
                      NearbyEventScreen(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
