import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Column(
                          children: [
                            Container(
                              height: ResponsiveFlutter.of(context).verticalScale(256),
                              width: double.infinity,
                              color: appColors.appDarkColor,
                            ),
                            Container(
                              height: ResponsiveFlutter.of(context).verticalScale(19),
                              width: double.infinity,
                              color: appColors.appMediumColor,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Image.asset(
                              ImagePath.logo,
                              height: ResponsiveFlutter.of(context).verticalScale(30),
                            ),
                            SizedBox(height: ResponsiveFlutter.of(context).verticalScale(10)),
                            Container(
                              height: ResponsiveFlutter.of(context).verticalScale(210),
                              padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).moderateScale(25)),
                              child: Image.asset(
                                ImagePath.forgotPasswordImage,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(20)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyTextView(
                                  Strings.verification,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightColor,
                                    size: ResponsiveFlutter.of(context).fontSize(3.7),
                                    fontWeightNew: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: ResponsiveFlutter.of(context).verticalScale(5)),
                                MyTextView(
                                  Strings.enterTheVerificationCode,
                                  maxLineWrap: true,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.mediumGrayColor,
                                    size: ResponsiveFlutter.of(context).fontSize(1.8),
                                    fontWeightNew: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: ResponsiveFlutter.of(context).scale(80),
                            padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).moderateScale(10)),
                            child: OTPTextField(
                              length: 4,
                              width: MediaQuery.of(context).size.width,
                              fieldWidth: ResponsiveFlutter.of(context).scale(60),
                              outlineBorderRadius: ResponsiveFlutter.of(context).moderateScale(20),
                              otpFieldStyle: OtpFieldStyle(
                                borderColor: appColors.lightPinkColor,
                                disabledBorderColor: appColors.lightPinkColor,
                                errorBorderColor: appColors.lightPinkColor,
                                focusBorderColor: appColors.lightPinkColor,
                                enabledBorderColor: appColors.appMediumColor,
                                backgroundColor: appColors.appLightColor,
                              ),
                              style: MyTextStyle(
                                colorNew: appColors.lightPinkColor,
                                size: ResponsiveFlutter.of(context).fontSize(3),
                                fontWeightNew: FontWeight.w700,
                                textHeight: 1.2,
                              ),
                              margin: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(10)),
                              textFieldAlignment: MainAxisAlignment.center,
                              fieldStyle: FieldStyle.box,
                              onChanged: (value) {},
                              onCompleted: (pin) {
                                debugPrint("Completed: " + pin);
                              },
                            ),
                          ),
                          SizedBox(height: ResponsiveFlutter.of(context).verticalScale(5)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: ResponsiveFlutter.of(context).moderateScale(20)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginScreen(),
                                  ),
                                );
                              },
                              child: commonButton(
                                context: context,
                                title: Strings.verify,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Align(
                            alignment: Alignment.center,
                            child: MyTextView(
                              Strings.ifYouDidNotReceivedACode,
                              textAligntNew: TextAlign.center,
                              styleNew: MyTextStyle(
                                colorNew: appColors.mediumGrayColor,
                                fontWeightNew: FontWeight.w400,
                                size: ResponsiveFlutter.of(context).fontSize(1.8),
                              ),
                            ),
                          ),
                          SizedBox(height: ResponsiveFlutter.of(context).verticalScale(5)),
                          GestureDetector(
                            onTap: () {},
                            child: Align(
                              alignment: Alignment.center,
                              child: MyTextView(
                                Strings.resend,
                                textAligntNew: TextAlign.center,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.lightPinkColor,
                                  fontWeightNew: FontWeight.bold,
                                  size: ResponsiveFlutter.of(context).fontSize(2),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: ResponsiveFlutter.of(context).verticalScale(20)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
