import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
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
            commonAppBar(
              context: context,
              title: Strings.changePassword,
              backArrow: true,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                  vertical: ResponsiveFlutter.of(context).moderateScale(20),
                ),
                children: [
                  Container(
                    height: ResponsiveFlutter.of(context).verticalScale(50),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).moderateScale(20)),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      border: Border.all(
                        color: appColors.borderColor,
                        width: ResponsiveFlutter.of(context).moderateScale(2),
                      ),
                    ),
                    child: commonTestField(
                      context: context,
                      icon: false,
                      hintText: Strings.enterCurrentPassword,
                      keyboardType: TextInputType.multiline,
                      obscureText: false,
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(7),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).verticalScale(50),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).moderateScale(20)),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      border: Border.all(
                        color: appColors.borderColor,
                        width: ResponsiveFlutter.of(context).moderateScale(2),
                      ),
                    ),
                    child: commonTestField(
                      context: context,
                      icon: false,
                      hintText: Strings.newPassword,
                      keyboardType: TextInputType.multiline,
                      obscureText: false,
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(7),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).verticalScale(50),
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).moderateScale(20)),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      border: Border.all(
                        color: appColors.borderColor,
                        width: ResponsiveFlutter.of(context).moderateScale(2),
                      ),
                    ),
                    child: commonTestField(
                      context: context,
                      icon: false,
                      hintText: Strings.confirmPassword,
                      keyboardType: TextInputType.multiline,
                      obscureText: false,
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(25),
                  ),
                  commonButton(
                    context: context,
                    title: Strings.save,
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
