import 'package:attendify/features/authentication/screens/phone_number_screen.dart';
import 'package:attendify/features/common/utils.dart';
import 'package:attendify/features/firebase/controller/firebase_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:open_mail_app/open_mail_app.dart';

import '../../../responsive/responsive_flutter.dart';
import '../../common/app_colors.dart';
import '../../common/image_path.dart';

class EmailVerification extends ConsumerWidget {
  final String emailAddress;
  static const String routeName = "/email_verification";

  const EmailVerification({Key? key, required this.emailAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors().appMediumColor,
      body: Column(children: [
        SizedBox(height: ResponsiveFlutter.of(context).verticalScale(40)),
        Image.asset(
          ImagePath.logo,
          height: ResponsiveFlutter.of(context).verticalScale(30),
        ),
        Container(
          height: ResponsiveFlutter.of(context).verticalScale(300),
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveFlutter.of(context).moderateScale(25)),
          child: Image.asset(
            ImagePath.newMail,
            alignment: Alignment.bottomCenter,
          ),
        ),

        /*SizedBox(
            height: 80,
              width: 80,
              child: LottieBuilder.asset("assets/lottie/sent.json", repeat: true)),*/
        SizedBox(
          height: ResponsiveFlutter.of(context).moderateScale(9),
        ),
        Text(
          "We sent you an email !",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveFlutter.of(context).fontSize(3),
              color: AppColors().lightColor),
        ),
        SizedBox(
          height: ResponsiveFlutter.of(context).moderateScale(3),
        ),
        RichText(
          text: TextSpan(
            text: "Click on the link sent to ",
            children: [
              TextSpan(
                text: emailAddress,
                style: TextStyle(
                  color: AppColors().lightColor,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
                ),
              ),
            ],
            style: TextStyle(
              color: AppColors().greyTextColor,
              fontSize: ResponsiveFlutter.of(context).fontSize(1.7),
            ),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: ResponsiveFlutter.of(context).moderateScale(4),
        ),
        Text(
          "(Also check spam)",
          style: TextStyle(
              fontSize: ResponsiveFlutter.of(context).fontSize(1.5),
              color: AppColors().greyTextColor),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveFlutter.of(context).moderateScale(40),
              vertical: ResponsiveFlutter.of(context).moderateScale(10)),
          child: ButtonTheme(
            height: 50,
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColors().btnColor),
                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: const BorderSide(color: Colors.red)))),
              onPressed: () async {
                if (await ref
                    .read(firebaseAutheControllerProvider)
                    .checkIfEmailVerified()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhoneNumbers(),
                    ),
                  );
                } else {
                  Utils().errorDialog(
                      context: context,
                      error: "Check your email and verify email");
                }
              },
              child: Center(
                child: Text(
                  "VERIFIED".toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveFlutter.of(context).moderateScale(40),
              vertical: ResponsiveFlutter.of(context).moderateScale(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                child: const Text("Open Mail App"),
                onPressed: () async {
                  // Android: Will open mail app or show native picker.
                  // iOS: Will open mail app if single mail app found.
                  var result = await OpenMailApp.openMailApp(
                    nativePickerTitle: 'Select email app to open',
                  );

                  // If no mail apps found, show error
                  if (!result.didOpen && !result.canOpen) {
                    showNoMailAppsDialog(context);

                    // iOS: if multiple mail apps found, show dialog to select.
                    // There is no native intent/default app system in iOS so
                    // you have to do it yourself.
                  } else if (!result.didOpen && result.canOpen) {
                    showDialog(
                      context: context,
                      builder: (_) {
                        return MailAppPickerDialog(
                          mailApps: result.options,
                        );
                      },
                    );
                  }
                },
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Resend mail"))
            ],
          ),
        ),
      ]),
    );
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Open Mail App"),
          content: const Text("No mail apps installed"),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
