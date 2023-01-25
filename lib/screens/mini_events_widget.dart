import 'package:flutter/material.dart';

import '../features/common/app_colors.dart';
import '../features/common/common_widget.dart';
import '../features/common/image_path.dart';
import 'package:flutter/widgets.dart';

import '../features/common/strings.dart';
import '../responsive/responsive_flutter.dart';
import 'details_screen.dart';


class EventWidget extends StatefulWidget {
  final String eventName;


  const EventWidget({
    required this.eventName,

  }) : super();

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  @override
  Widget build(BuildContext context) {
    var appColors = AppColors();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            height: ResponsiveFlutter.of(context).moderateScale(110),
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
                      Strings.dummyText21,
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
                    Row(
                      children: [
                        MyTextView(
                          "By @ThisGroupUser",
                          textAligntNew: TextAlign.start,
                          maxLineWrap: true,
                          styleNew: MyTextStyle(
                            colorNew: appColors.lightColor,
                            fontWeightNew: FontWeight.w500,
                            size: ResponsiveFlutter.of(context)
                                .fontSize(1.5),
                          ),
                        ),
                         SizedBox(width: 12,),
                         Row(
                            children: [
                              Icon(Icons.people,color: AppColors().lightColor),
                              SizedBox(width: 8),
                              Text("7",style: TextStyle(color: AppColors().lightColor),),
              ],
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
                      Strings.book,
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
    );
  }
}







