import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/chat_screen.dart';
import 'package:attendify/screens/edit_event_screen.dart';
import 'package:flutter/material.dart';

class MyEventsScreen extends StatefulWidget {
  const MyEventsScreen({Key? key}) : super(key: key);
  @override
  _MyEventsScreenState createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: 7,
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                  vertical: ResponsiveFlutter.of(context).moderateScale(15),
                ),
                itemBuilder: (context, index) => Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: ResponsiveFlutter.of(context).moderateScale(200),
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          bottom:
                              ResponsiveFlutter.of(context).moderateScale(40)),
                      padding: EdgeInsets.all(
                          ResponsiveFlutter.of(context).moderateScale(15)),
                      decoration: BoxDecoration(
                        color: appColors.btnColor,
                        borderRadius: BorderRadius.circular(
                          ResponsiveFlutter.of(context).moderateScale(20),
                        ),
                        image: const DecorationImage(
                          image: AssetImage(ImagePath.image_2),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      height: ResponsiveFlutter.of(context).moderateScale(100),
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          bottom:
                              ResponsiveFlutter.of(context).moderateScale(40)),
                      padding: EdgeInsets.all(
                          ResponsiveFlutter.of(context).moderateScale(15)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ResponsiveFlutter.of(context).moderateScale(20)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            appColors.gradiantStartColor,
                            Colors.transparent,
                          ],
                          stops: const [0.05, 0.9],
                        ),
                      ),
                    ),
                    Positioned(
                      top: ResponsiveFlutter.of(context).moderateScale(10),
                      right: ResponsiveFlutter.of(context).moderateScale(-5),
                      child: GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            useSafeArea: false,
                            barrierColor: Colors.transparent,
                            builder: (context) => const Dialog(
                              backgroundColor: Colors.transparent,
                              insetPadding: EdgeInsets.zero,
                              child: EditEventScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(40),
                          width:
                              ResponsiveFlutter.of(context).moderateScale(40),
                          margin: EdgeInsets.symmetric(
                              horizontal: ResponsiveFlutter.of(context)
                                  .moderateScale(15)),
                          decoration: BoxDecoration(
                            // color: appColors.lightColor,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(imagePath.chatEdit),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: ResponsiveFlutter.of(context).moderateScale(80),
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              ResponsiveFlutter.of(context).moderateScale(15)),
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            ResponsiveFlutter.of(context).moderateScale(17),
                        vertical:
                            ResponsiveFlutter.of(context).moderateScale(15),
                      ),
                      decoration: BoxDecoration(
                        color: appColors.appLightColor,
                        borderRadius: BorderRadius.circular(
                          ResponsiveFlutter.of(context).moderateScale(15),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextView(
                                Strings.dummyText38,
                                textAligntNew: TextAlign.start,
                                maxLineWrap: true,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.lightColor,
                                  fontWeightNew: FontWeight.w600,
                                  size: ResponsiveFlutter.of(context)
                                      .fontSize(2.5),
                                ),
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    ImagePath.calender,
                                    color: appColors.lightColor,
                                    height: ResponsiveFlutter.of(context)
                                        .moderateScale(15),
                                  ),
                                  SizedBox(
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(6),
                                  ),
                                  MyTextView(
                                    Strings.dummyText22,
                                    textAligntNew: TextAlign.start,
                                    maxLineWrap: true,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.lightColor,
                                      fontWeightNew: FontWeight.w500,
                                      size: ResponsiveFlutter.of(context)
                                          .fontSize(1.5),
                                    ),
                                  ),
                                  SizedBox(
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(10),
                                  ),
                                  Image.asset(
                                    ImagePath.time,
                                    color: appColors.lightColor,
                                    height: ResponsiveFlutter.of(context)
                                        .moderateScale(15),
                                  ),
                                  SizedBox(
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(6),
                                  ),
                                  MyTextView(
                                    Strings.dummyText23,
                                    textAligntNew: TextAlign.start,
                                    maxLineWrap: true,
                                    styleNew: MyTextStyle(
                                      colorNew: appColors.lightColor,
                                      fontWeightNew: FontWeight.w500,
                                      size: ResponsiveFlutter.of(context)
                                          .fontSize(1.5),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChatScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(70),
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(35),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: appColors.lightPinkColor,
                                borderRadius: BorderRadius.circular(
                                  ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                ),
                              ),
                              child: MyTextView(
                                Strings.chat,
                                textAligntNew: TextAlign.start,
                                maxLineWrap: true,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.black,
                                  fontWeightNew: FontWeight.w600,
                                  size: ResponsiveFlutter.of(context)
                                      .fontSize(1.6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: ResponsiveFlutter.of(context).moderateScale(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
