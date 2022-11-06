import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/model/common_model.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  AppColors appColors = AppColors();

  List<CommonModel>? settingsList = [
    CommonModel(image: ImagePath.image_8, title: Strings.dummyText28, subTitle: "1m"),
    CommonModel(image: ImagePath.image_7, title: Strings.dummyText29, subTitle: "1m"),
    CommonModel(image: ImagePath.image_3, title: Strings.dummyText30, subTitle: "12m"),
    CommonModel(image: ImagePath.image_6, title: Strings.dummyText31, subTitle: "1d"),
    CommonModel(image: ImagePath.notifications, title: Strings.dummyText32, subTitle: "5d"),
    CommonModel(image: ImagePath.image_6, title: Strings.dummyText33, subTitle: "7d"),
    CommonModel(image: ImagePath.success, title: Strings.dummyText34, subTitle: "8d"),
    CommonModel(image: ImagePath.success, title: Strings.dummyText35, subTitle: "8d"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            commonAppBar(
              context: context,
              title: Strings.notification,
              backArrow: true,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                  vertical: ResponsiveFlutter.of(context).moderateScale(20),
                ),
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    itemCount: settingsList!.length,
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {},
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height: ResponsiveFlutter.of(context).verticalScale(index == 3 ? 70 : 52),
                            width: double.infinity,
                            margin: EdgeInsets.only(
                              left: ResponsiveFlutter.of(context).moderateScale(15),
                            ),
                            padding: EdgeInsets.only(
                              right: ResponsiveFlutter.of(context).moderateScale(20),
                              left: ResponsiveFlutter.of(context).moderateScale(40),
                            ),
                            decoration: BoxDecoration(
                              color: appColors.appLightColor,
                              borderRadius: BorderRadius.circular(
                                ResponsiveFlutter.of(context).moderateScale(17),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: MyTextView(
                                        settingsList![index].title!,
                                        textAligntNew: TextAlign.start,
                                        styleNew: MyTextStyle(
                                          colorNew: appColors.lightColor,
                                          fontWeightNew: FontWeight.w400,
                                          size: ResponsiveFlutter.of(context).fontSize(1.7),
                                        ),
                                      ),
                                    ),
                                    MyTextView(
                                      settingsList![index].subTitle!,
                                      textAligntNew: TextAlign.end,
                                      styleNew: MyTextStyle(
                                        colorNew: appColors.greenOpacity,
                                        fontWeightNew: FontWeight.w300,
                                        size: ResponsiveFlutter.of(context).fontSize(1.5),
                                      ),
                                    ),
                                  ],
                                ),
                                index == 3
                                    ? Container(
                                        height: ResponsiveFlutter.of(context).moderateScale(27),
                                        width: ResponsiveFlutter.of(context).moderateScale(55),
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(
                                          top: ResponsiveFlutter.of(context).moderateScale(7),
                                        ),
                                        decoration: BoxDecoration(
                                          color: appColors.lightPinkColor,
                                          borderRadius: BorderRadius.circular(
                                            ResponsiveFlutter.of(context).moderateScale(20),
                                          ),
                                        ),
                                        child: MyTextView(
                                          Strings.join,
                                          textAligntNew: TextAlign.center,
                                          styleNew: MyTextStyle(
                                            colorNew: appColors.black,
                                            fontWeightNew: FontWeight.w600,
                                            size: ResponsiveFlutter.of(context).fontSize(1.8),
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: ResponsiveFlutter.of(context).verticalScale(40),
                                width: ResponsiveFlutter.of(context).scale(40),
                                padding: EdgeInsets.symmetric(
                                  vertical: ResponsiveFlutter.of(context).moderateScale(index == 4 ? 10 : 0),
                                ),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: appColors.white,
                                  border: Border.all(
                                    color: appColors.appMediumColor,
                                    width: ResponsiveFlutter.of(context).scale(2.5),
                                  ),
                                ),
                                child: Image(
                                  image: AssetImage(settingsList![index].image!),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              index == 3
                                  ? SizedBox(
                                      height: ResponsiveFlutter.of(context).moderateScale(20),
                                    )
                                  : Container(),
                            ],
                          ),
                        ],
                      ),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: ResponsiveFlutter.of(context).verticalScale(5),
                    ),
                  ),
                  SizedBox(height: ResponsiveFlutter.of(context).moderateScale(25)),
                  Container(
                    height: ResponsiveFlutter.of(context).moderateScale(30),
                    width: ResponsiveFlutter.of(context).moderateScale(60),
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: ResponsiveFlutter.of(context).moderateScale(7),
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                    child: MyTextView(
                      Strings.clearAll,
                      textAligntNew: TextAlign.center,
                      styleNew: MyTextStyle(
                        colorNew: appColors.lightPinkColor,
                        fontWeightNew: FontWeight.w600,
                        size: ResponsiveFlutter.of(context).fontSize(2),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
