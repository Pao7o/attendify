import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../responsive/responsive_flutter.dart';
import '../../common/app_colors.dart';
import '../../common/image_path.dart';


class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().appMediumColor,
      body: Column(
          children: [
            SizedBox(
                height: ResponsiveFlutter.of(context)
                    .verticalScale(40)),
            Image.asset(
              ImagePath.logo,
              height: ResponsiveFlutter.of(context)
                  .verticalScale(30),
            ),

            Container(
              height: ResponsiveFlutter.of(context)
                  .verticalScale(300),
              padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveFlutter.of(context)
                      .moderateScale(25)),
              child: Image.asset(
                ImagePath.mailSent,
                alignment: Alignment.bottomCenter,
              ),
            ),

            /*SizedBox(
            height: 80,
              width: 80,
              child: LottieBuilder.asset("assets/lottie/sent.json", repeat: true)),*/
            SizedBox(height: 19,),

          ]),
    );
  }
}
