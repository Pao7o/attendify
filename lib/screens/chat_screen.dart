import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/all_friends_screen.dart';
import 'package:attendify/screens/friends_screen.dart';
import 'package:attendify/screens/invite_friends_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
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
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.42,
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: appColors.appDarkColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                        bottomRight: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                        bottomRight: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                      ),
                      child: Image.asset(
                        ImagePath.image_4,
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).moderateScale(300),
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: appColors.appDarkColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                        bottomRight: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          appColors.appDarkColor,
                          Colors.transparent,
                        ],
                        stops: const [0.3, 0.8],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: ResponsiveFlutter.of(context).moderateScale(20),
                      horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: appColors.lightColor,
                                size: ResponsiveFlutter.of(context).moderateScale(23),
                              ),
                            ),
                            const Spacer(),
                          ],
                        ),
                        SizedBox(
                          height: ResponsiveFlutter.of(context).moderateScale(70),
                        ),
                        Row(
                          children: [
                            MyTextView(
                              Strings.welcomeParty,
                              textAligntNew: TextAlign.start,
                              maxLineWrap: true,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightColor,
                                fontWeightNew: FontWeight.w600,
                                size: ResponsiveFlutter.of(context).fontSize(3.3),
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context).moderateScale(15),
                            ),
                            Container(
                              height: ResponsiveFlutter.of(context).moderateScale(30),
                              width: ResponsiveFlutter.of(context).moderateScale(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: appColors.blurBtnColor,
                                borderRadius: BorderRadius.circular(
                                  ResponsiveFlutter.of(context).moderateScale(20),
                                ),
                              ),
                              child: MyTextView(
                                Strings.dance,
                                textAligntNew: TextAlign.center,
                                maxLineWrap: true,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.lightPinkColor,
                                  fontWeightNew: FontWeight.w500,
                                  size: ResponsiveFlutter.of(context).fontSize(1.4),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ResponsiveFlutter.of(context).moderateScale(15),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              ImagePath.calender,
                              color: appColors.lightColor,
                              height: ResponsiveFlutter.of(context).moderateScale(15),
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context).moderateScale(6),
                            ),
                            MyTextView(
                              Strings.dummyText22,
                              textAligntNew: TextAlign.start,
                              maxLineWrap: true,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightColor,
                                fontWeightNew: FontWeight.w500,
                                size: ResponsiveFlutter.of(context).fontSize(1.5),
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context).moderateScale(10),
                            ),
                            Image.asset(
                              ImagePath.time,
                              color: appColors.lightColor,
                              height: ResponsiveFlutter.of(context).moderateScale(15),
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context).moderateScale(6),
                            ),
                            MyTextView(
                              Strings.dummyText23,
                              textAligntNew: TextAlign.start,
                              maxLineWrap: true,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightColor,
                                fontWeightNew: FontWeight.w500,
                                size: ResponsiveFlutter.of(context).fontSize(1.5),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ResponsiveFlutter.of(context).moderateScale(15),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: ResponsiveFlutter.of(context).moderateScale(30),
                                  width: ResponsiveFlutter.of(context).moderateScale(30),
                                  decoration: BoxDecoration(
                                    color: appColors.appLightColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: appColors.appMediumColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Image.asset(
                                    ImagePath.image_5,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height: ResponsiveFlutter.of(context).moderateScale(30),
                                  width: ResponsiveFlutter.of(context).moderateScale(30),
                                  margin: EdgeInsets.only(left: ResponsiveFlutter.of(context).moderateScale(20)),
                                  decoration: BoxDecoration(
                                    color: appColors.appLightColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: appColors.appMediumColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Image.asset(
                                    ImagePath.image_5,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  height: ResponsiveFlutter.of(context).moderateScale(30),
                                  width: ResponsiveFlutter.of(context).moderateScale(30),
                                  margin: EdgeInsets.only(left: ResponsiveFlutter.of(context).moderateScale(40)),
                                  decoration: BoxDecoration(
                                    color: appColors.appLightColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: appColors.appMediumColor,
                                      width: 2,
                                    ),
                                  ),
                                  child: Image.asset(
                                    ImagePath.image_5,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context).moderateScale(10),
                            ),
                            MyTextView(
                              "26 " + Strings.participate,
                              textAligntNew: TextAlign.start,
                              maxLineWrap: true,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightPinkColor,
                                fontWeightNew: FontWeight.w500,
                                size: ResponsiveFlutter.of(context).fontSize(1.8),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const InviteFriendsScreen(),
                                  ),
                                );
                              },
                              child: Container(
                                height: ResponsiveFlutter.of(context).moderateScale(35),
                                width: ResponsiveFlutter.of(context).moderateScale(66),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: appColors.lightPinkColor,
                                  borderRadius: BorderRadius.circular(
                                    ResponsiveFlutter.of(context).moderateScale(20),
                                  ),
                                ),
                                child: MyTextView(
                                  Strings.invite,
                                  textAligntNew: TextAlign.center,
                                  maxLineWrap: true,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.black,
                                    fontWeightNew: FontWeight.w500,
                                    size: ResponsiveFlutter.of(context).fontSize(1.8),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ResponsiveFlutter.of(context).moderateScale(15),
                        ),
                        Row(
                          children: [
                            Expanded(
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
                                      Strings.all,
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
                                      Strings.friends,
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
                            SizedBox(
                              width: ResponsiveFlutter.of(context).moderateScale(80),
                            ),
                          ],
                        ),
                      ],
                    ),
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
                      AllFriendsScreen(),
                      FriendsScreen(),
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
