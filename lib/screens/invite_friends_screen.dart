import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/model/common_model.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/material.dart';

class InviteFriendsScreen extends StatefulWidget {
  const InviteFriendsScreen({Key? key}) : super(key: key);
  @override
  _InviteFriendsScreenState createState() => _InviteFriendsScreenState();
}

class _InviteFriendsScreenState extends State<InviteFriendsScreen> {
  AppColors appColors = AppColors();
  List<CommonModel>? settingsList = [
    CommonModel(image: ImagePath.image_7, title: "Thomas Adition", value: 1),
    CommonModel(image: ImagePath.image_8, title: "Thomas Adition", value: 1),
    CommonModel(image: ImagePath.image_6, title: "Thomas Adition", value: 1),
    CommonModel(image: ImagePath.image_8, title: "Thomas Adition", value: 0),
    CommonModel(image: ImagePath.image_7, title: "Thomas Adition", value: 1),
    CommonModel(image: ImagePath.image_8, title: "Thomas Adition", value: 1),
    CommonModel(image: ImagePath.image_6, title: "Thomas Adition", value: 0),
    CommonModel(image: ImagePath.image_5, title: "Thomas Adition", value: 0),
    CommonModel(image: ImagePath.image_3, title: "Thomas Adition", value: 1),
    CommonModel(image: ImagePath.image_7, title: "Thomas Adition", value: 0),
    CommonModel(image: ImagePath.image_3, title: "Thomas Adition", value: 1),
    CommonModel(image: ImagePath.image_6, title: "Thomas Adition", value: 0),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            commonAppBar(
              context: context,
              title: Strings.inviteFriends,
              backArrow: true,
            ),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                  vertical: ResponsiveFlutter.of(context).moderateScale(15),
                ),
                itemCount: settingsList!.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {},
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Container(
                        height: ResponsiveFlutter.of(context).verticalScale(52),
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
                                size: ResponsiveFlutter.of(context).fontSize(1.8),
                              ),
                            ),
                            Container(
                              height: ResponsiveFlutter.of(context).verticalScale(28),
                              width: ResponsiveFlutter.of(context).scale(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: settingsList![index].value == 1 ? appColors.appLightColor : appColors.lightPinkColor,
                                borderRadius: BorderRadius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                                border: Border.all(
                                  color: appColors.lightPinkColor,
                                  width: ResponsiveFlutter.of(context).scale(2),
                                ),
                              ),
                              child: MyTextView(
                                settingsList![index].value == 1 ? Strings.invite : Strings.invited,
                                textAligntNew: TextAlign.center,
                                styleNew: MyTextStyle(
                                  colorNew: settingsList![index].value == 1 ? appColors.lightPinkColor : appColors.black,
                                  fontWeightNew: FontWeight.w500,
                                  size: ResponsiveFlutter.of(context).fontSize(1.6),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: ResponsiveFlutter.of(context).verticalScale(40),
                        width: ResponsiveFlutter.of(context).scale(40),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: appColors.lightColor,
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
            ),
          ],
        ),
      ),
    );
  }
}
