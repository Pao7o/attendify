import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/edit_profile_screen.dart';
import 'package:attendify/screens/my_booking_screen.dart';
import 'package:attendify/screens/my_events_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  AppColors appColors = AppColors();
  TabController? tabController;
  int tab = 0;
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
              Stack(
                children: [
                  Container(
                    height: ResponsiveFlutter.of(context).moderateScale(330),
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.symmetric(
                      vertical: ResponsiveFlutter.of(context).moderateScale(20),
                      horizontal:
                          ResponsiveFlutter.of(context).moderateScale(20),
                    ),
                    decoration: BoxDecoration(
                      color: appColors.appDarkColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                            ResponsiveFlutter.of(context).moderateScale(30)),
                        bottomRight: Radius.circular(
                            ResponsiveFlutter.of(context).moderateScale(30)),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(120),
                          width:
                              ResponsiveFlutter.of(context).moderateScale(120),
                          decoration: BoxDecoration(
                            color: appColors.appMediumColor,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            ImagePath.image_3,
                          ),
                        ),
                        SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(5),
                        ),
                        MyTextView(
                          Strings.dummyText37,
                          textAligntNew: TextAlign.start,
                          maxLineWrap: true,
                          styleNew: MyTextStyle(
                            colorNew: appColors.lightColor,
                            fontWeightNew: FontWeight.w600,
                            size: ResponsiveFlutter.of(context).fontSize(3.2),
                          ),
                        ),
                        SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(15),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TabBar(
                                controller: tabController,
                                indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    ResponsiveFlutter.of(context)
                                        .moderateScale(25),
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
                                    height: ResponsiveFlutter.of(context)
                                        .moderateScale(45),
                                    alignment: Alignment.center,
                                    child: MyTextView(
                                      Strings.myEvents,
                                      textAligntNew: TextAlign.start,
                                      maxLineWrap: true,
                                      styleNew: MyTextStyle(
                                        colorNew: tab == 0
                                            ? appColors.white
                                            : appColors.darkGreyText,
                                        fontWeightNew: FontWeight.w600,
                                        size: ResponsiveFlutter.of(context)
                                            .fontSize(1.8),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: ResponsiveFlutter.of(context)
                                        .moderateScale(45),
                                    alignment: Alignment.center,
                                    child: MyTextView(
                                      Strings.myBooking,
                                      textAligntNew: TextAlign.start,
                                      maxLineWrap: true,
                                      styleNew: MyTextStyle(
                                        colorNew: tab == 1
                                            ? appColors.white
                                            : appColors.darkGreyText,
                                        fontWeightNew: FontWeight.w600,
                                        size: ResponsiveFlutter.of(context)
                                            .fontSize(1.8),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(80),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  commonAppBar(
                    context: context,
                    backArrow: true,
                    title: Strings.profile,
                    appBarColor: appColors.appDarkColor,
                    edit: true,
                    editClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: TabBarView(
                    controller: tabController,
                    physics: const NeverScrollableScrollPhysics(),
                    children: const [
                      MyEventsScreen(),
                      MyBookingScreen(),
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
