import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/material.dart';

class AllFriendsScreen extends StatefulWidget {
  const AllFriendsScreen({Key? key}) : super(key: key);
  @override
  _AllFriendsScreenState createState() => _AllFriendsScreenState();
}

class _AllFriendsScreenState extends State<AllFriendsScreen> {
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).moderateScale(10)),
                physics: const BouncingScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    child: index % 3 == 0 ? senderRow(isSecond: true) : receiverRow(isSecond: index == 2 || index == 5 || index == 8 ? false : true),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                vertical: ResponsiveFlutter.of(context).moderateScale(20),
              ),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    height: ResponsiveFlutter.of(context).moderateScale(55),
                    margin: EdgeInsets.only(
                      right: ResponsiveFlutter.of(context).moderateScale(25),
                      bottom: ResponsiveFlutter.of(context).moderateScale(5),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: appColors.appMediumColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(30),
                      ),
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 2,
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: ResponsiveFlutter.of(context).verticalScale(15),
                          width: ResponsiveFlutter.of(context).verticalScale(15),
                          alignment: Alignment.center,
                          child: Image.asset(ImagePath.emoji),
                        ),
                        SizedBox(
                          width: ResponsiveFlutter.of(context).moderateScale(10),
                        ),
                        Expanded(
                          child: TextField(
                            style: MyTextStyle(
                              colorNew: appColors.lightColor,
                              fontWeightNew: FontWeight.w400,
                              size: ResponsiveFlutter.of(context).fontSize(1.8),
                            ),
                            cursorColor: appColors.lightColor,
                            keyboardType: TextInputType.multiline,
                            expands: false,
                            decoration: InputDecoration(
                              isDense: true,
                              border: InputBorder.none,
                              hintText: Strings.typeHere,
                              hintStyle: MyTextStyle(
                                colorNew: appColors.transactionText,
                                fontWeightNew: FontWeight.w400,
                                size: ResponsiveFlutter.of(context).fontSize(1.8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).moderateScale(53),
                    width: ResponsiveFlutter.of(context).moderateScale(53),
                    decoration: BoxDecoration(
                      color: appColors.btnColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(ImagePath.send),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  senderRow({bool? isSecond = false}) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.only(
          top: ResponsiveFlutter.of(context).moderateScale(10),
          bottom: isSecond! ? ResponsiveFlutter.of(context).moderateScale(10) : 0,
          left: MediaQuery.of(context).size.width * 0.3,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: appColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                        topLeft: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                        bottomRight: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                        topRight: Radius.circular(!isSecond ? ResponsiveFlutter.of(context).moderateScale(30) : 0),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                      vertical: ResponsiveFlutter.of(context).moderateScale(15),
                    ),
                    child: MyTextView(
                      'Hello!',
                      maxLineWrap: true,
                      styleNew: MyTextStyle(
                        size: ResponsiveFlutter.of(context).fontSize(1.8),
                        fontWeightNew: FontWeight.w500,
                        colorNew: appColors.chatTextColor,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSecond,
                    child: Padding(
                      padding: EdgeInsets.only(
                        right: ResponsiveFlutter.of(context).moderateScale(10),
                        top: ResponsiveFlutter.of(context).moderateScale(3),
                      ),
                      child: Text(
                        '8:05',
                        style: MyTextStyle(
                          size: ResponsiveFlutter.of(context).fontSize(1.2),
                          fontWeightNew: FontWeight.w500,
                          colorNew: appColors.white.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: ResponsiveFlutter.of(context).moderateScale(!isSecond ? 48 : 10)),
            Visibility(
              visible: isSecond,
              child: Container(
                height: ResponsiveFlutter.of(context).moderateScale(38),
                width: ResponsiveFlutter.of(context).moderateScale(38),
                decoration: BoxDecoration(
                  color: appColors.white,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    ImagePath.image_3,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  receiverRow({bool? isSecond = false}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.only(
          top: ResponsiveFlutter.of(context).moderateScale(10),
          bottom: !isSecond! ? ResponsiveFlutter.of(context).moderateScale(10) : 0,
          right: MediaQuery.of(context).size.width * 0.3,
        ),
        child: Row(
          children: [
            Visibility(
              visible: isSecond,
              child: Container(
                height: ResponsiveFlutter.of(context).moderateScale(38),
                width: ResponsiveFlutter.of(context).moderateScale(38),
                decoration: BoxDecoration(
                  color: appColors.chatReceiverContainerColor,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    ImagePath.image_6,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: ResponsiveFlutter.of(context).moderateScale(!isSecond ? 48 : 10)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: appColors.chatReceiverContainerColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                        topRight: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                        bottomRight: Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
                        topLeft: Radius.circular(!isSecond ? ResponsiveFlutter.of(context).moderateScale(30) : 0),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                      vertical: ResponsiveFlutter.of(context).moderateScale(15),
                    ),
                    child: MyTextView(
                      isSecond ? 'How are you?' : "Good afternoon",
                      maxLineWrap: true,
                      styleNew: MyTextStyle(
                        size: ResponsiveFlutter.of(context).fontSize(1.8),
                        fontWeightNew: FontWeight.w500,
                        colorNew: appColors.chatReceiverTextColor,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isSecond,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: ResponsiveFlutter.of(context).moderateScale(10),
                        top: ResponsiveFlutter.of(context).moderateScale(3),
                      ),
                      child: Text(
                        '8:05',
                        style: MyTextStyle(
                          size: ResponsiveFlutter.of(context).fontSize(1.2),
                          fontWeightNew: FontWeight.w500,
                          colorNew: appColors.white.withOpacity(0.5),
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
}
