
import 'package:attendify/features/common/constants.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class MyTextView extends Text {
  final TextAlign? textAligntNew;
  final int? maxLinesNew;
  final TextStyle? styleNew;
  final TextOverflow? overflowText;
  final bool? maxLineWrap;
  final TextDirection? textDirectionNew;
  MyTextView(
    String s, {
    Key? key,
    this.textDirectionNew,
    this.textAligntNew = TextAlign.start,
    this.maxLinesNew = 1,
    this.overflowText = TextOverflow.ellipsis,
    this.maxLineWrap = false,
    this.styleNew,
  })  : assert(maxLinesNew != null),
        super(
          s,
          key: key,
          textAlign: textAligntNew,
          maxLines: maxLineWrap! ? null : maxLinesNew,
          overflow: maxLineWrap ? null : overflowText,
          style: styleNew,
          textDirection: textDirectionNew,
        );
}

class MyTextStyle extends TextStyle {
  final Color? colorNew;
  final FontWeight? fontWeightNew;
  final double? size;
  final String? fontFamilyNew;
  final TextDecoration? decorationNew;
  final Paint? backGround;
  final double? letterSpacingNew;
  final double? textHeight;
  const MyTextStyle({
    this.textHeight,
    this.colorNew = Colors.black,
    this.fontWeightNew = FontWeight.normal,
    this.size = 14,
    this.fontFamilyNew = Constants.carosSoft,
    this.decorationNew = TextDecoration.none,
    this.backGround,
    this.letterSpacingNew = 0.0,
  })  : assert(colorNew != null && fontWeightNew != null),
        super(
          color: colorNew,
          fontWeight: fontWeightNew,
          fontSize: size,
          fontFamily: fontFamilyNew,
          decoration: decorationNew,
          background: backGround,
          letterSpacing: letterSpacingNew,
          height: textHeight,
        );
}

Widget commonButton({
  BuildContext? context,
  String? title,
  Color? btnColor,
  Color? textColor,
}) {
  AppColors appColors = AppColors();
  return Container(
    height: ResponsiveFlutter.of(context).scale(45),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: btnColor ?? appColors.btnColor,
      borderRadius: BorderRadius.circular(
        ResponsiveFlutter.of(context).moderateScale(30),
      ),
    ),
    child: MyTextView(
      title!.toUpperCase(),
      textAligntNew: TextAlign.center,
      styleNew: MyTextStyle(
        colorNew: textColor ?? appColors.white,
        fontWeightNew: FontWeight.w600,
        size: ResponsiveFlutter.of(context).fontSize(2),
      ),
    ),
  );
}

Widget commonTestField({
  BuildContext? context,
  bool? icon = false,
  String? image = "",
  String? hintText,
  bool? obscureText = false,
  TextInputType? keyboardType,
  TextEditingController? controller,
}) {
  AppColors appColors = AppColors();
  return Row(
    children: [
      Visibility(
        visible: icon!,
        child: Container(
          height: ResponsiveFlutter.of(context).verticalScale(17),
          width: ResponsiveFlutter.of(context).verticalScale(17),
          margin:
              EdgeInsets.only(right: ResponsiveFlutter.of(context).scale(10)),
          alignment: Alignment.center,
          child: Image.asset(
            image!,
            color: appColors.iconColor,
          ),
        ),
      ),
      Expanded(
        child: TextField(
          style: MyTextStyle(
            colorNew: appColors.lightColor,
            fontWeightNew: FontWeight.w500,
            size: ResponsiveFlutter.of(context).fontSize(1.9),
          ),
          obscureText: obscureText!,
          cursorColor: appColors.lightColor,
          keyboardType: keyboardType,
          controller: controller,
          scrollPadding: EdgeInsets.zero,
          expands: false,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            isDense: true,
            hintStyle: MyTextStyle(
              colorNew: appColors.mediumLightColor,
              fontWeightNew: FontWeight.w400,
              size: ResponsiveFlutter.of(context).fontSize(1.9),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget commonAppBar({
  BuildContext? context,
  String? title,
  bool? backArrow = false,
  bool? edit = false,
  bool? search = false,
  bool? theme = false,
  Color? appBarColor,
  GestureTapCallback? editClick,
  GestureTapCallback? themeClick,
  GestureTapCallback? searchClick,
  EdgeInsetsGeometry? editPadding,
  StackFit? editStack,
  double? iconsize,
  double? textSize,
  double? appBarHeight,
}) {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();
  return Container(
    height: appBarHeight ??
        AppBar().preferredSize.height + MediaQuery.of(context!).padding.top,
    width: double.infinity,
    padding: editPadding ??
        EdgeInsets.only(
          bottom: ResponsiveFlutter.of(context).moderateScale(20),
          left: ResponsiveFlutter.of(context).moderateScale(20),
          right: ResponsiveFlutter.of(context).moderateScale(20),
        ),
    decoration: BoxDecoration(
      color: appBarColor ?? appColors.appMediumColor,
      borderRadius: BorderRadius.only(
        bottomLeft:
            Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
        bottomRight:
            Radius.circular(ResponsiveFlutter.of(context).moderateScale(30)),
      ),
    ),
    alignment: Alignment.bottomCenter,
    child: Stack(
      fit: editStack ?? StackFit.loose,
      alignment: Alignment.center,
      children: [
        Visibility(
          visible: backArrow!,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context!);
                },
                child: Container(
                  height: iconsize ??
                      ResponsiveFlutter.of(context).moderateScale(30),
                  width: iconsize ??
                      ResponsiveFlutter.of(context).moderateScale(30),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: appColors.lightColor,
                    size: ResponsiveFlutter.of(context).moderateScale(20),
                  ),
                ),
              ),
              const Spacer(),
              Visibility(
                visible: edit!,
                child: GestureDetector(
                  onTap: editClick,
                  child: Container(
                    height: iconsize ??
                        ResponsiveFlutter.of(context).moderateScale(25),
                    width: iconsize ??
                        ResponsiveFlutter.of(context).moderateScale(25),
                    padding: EdgeInsets.all(
                        ResponsiveFlutter.of(context).moderateScale(2)),
                    child: Image.asset(imagePath.edit),
                  ),
                ),
              ),
              Visibility(
                visible: search!,
                child: GestureDetector(
                  onTap: searchClick,
                  child: Container(
                    height: iconsize ??
                        ResponsiveFlutter.of(context).moderateScale(40),
                    width: iconsize ??
                        ResponsiveFlutter.of(context).moderateScale(40),
                    padding: EdgeInsets.all(
                        ResponsiveFlutter.of(context).moderateScale(1)),
                    child: Image.asset(imagePath.search),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Visibility(
              visible: theme!,
              child: GestureDetector(
                onTap: themeClick,
                child: Container(
                  height: ResponsiveFlutter.of(context).moderateScale(25),
                  width: ResponsiveFlutter.of(context).moderateScale(25),
                  padding: EdgeInsets.all(
                      ResponsiveFlutter.of(context).moderateScale(2)),
                  child: Constants.darkTheme
                      ? Icon(
                          Icons.light_mode,
                          color: appColors.lightColor,
                        )
                      : Icon(
                          Icons.dark_mode,
                          color: appColors.lightColor,
                        ),
                ),
              ),
            ),
          ],
        ),
        Center(
          child: MyTextView(
            title!.toUpperCase(),
            textAligntNew: TextAlign.center,
            styleNew: MyTextStyle(
              colorNew: appColors.lightColor,
              fontWeightNew: FontWeight.w600,
              size: textSize ?? ResponsiveFlutter.of(context).fontSize(2),
            ),
          ),
        ),
      ],
    ),
  );
}




