import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/details_screen.dart';
import 'package:flutter/material.dart';

class NearbyEventScreen extends StatefulWidget {
  const NearbyEventScreen({Key? key}) : super(key: key);
  @override
  _NearbyEventScreenState createState() => _NearbyEventScreenState();
}

class _NearbyEventScreenState extends State<NearbyEventScreen> {
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveFlutter.of(context).moderateScale(20),
            vertical: ResponsiveFlutter.of(context).moderateScale(20),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.56,
                    width: MediaQuery.of(context).size.width,
                    color: appColors.appMediumColor,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(ResponsiveFlutter.of(context).moderateScale(20)),
                      child: Image.asset(
                        ImagePath.map,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveFlutter.of(context).moderateScale(15),
                      vertical: ResponsiveFlutter.of(context).moderateScale(15),
                    ),
                    child: Container(
                      height: ResponsiveFlutter.of(context).moderateScale(80),
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveFlutter.of(context).moderateScale(17),
                        vertical: ResponsiveFlutter.of(context).moderateScale(15),
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
                                Strings.dummyText21,
                                textAligntNew: TextAlign.start,
                                maxLineWrap: true,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.lightColor,
                                  fontWeightNew: FontWeight.w600,
                                  size: ResponsiveFlutter.of(context).fontSize(2.5),
                                ),
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
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DetailsScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: ResponsiveFlutter.of(context).moderateScale(70),
                              height: ResponsiveFlutter.of(context).moderateScale(35),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: appColors.lightPinkColor,
                                borderRadius: BorderRadius.circular(
                                  ResponsiveFlutter.of(context).moderateScale(20),
                                ),
                              ),
                              child: MyTextView(
                                Strings.book,
                                textAligntNew: TextAlign.start,
                                maxLineWrap: true,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.black,
                                  fontWeightNew: FontWeight.w600,
                                  size: ResponsiveFlutter.of(context).fontSize(1.6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
