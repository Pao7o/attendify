import 'dart:async';

import 'package:attendify/features/firebase/controller/firebase_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../responsive/responsive_flutter.dart';
import '../../common/app_colors.dart';
import '../../common/image_path.dart';

class PhoneVerificationScreen extends StatelessWidget {
  static const String routeName = "/email_verification_screen";
  final String phoneNumber;
  final String verificationId;
  const PhoneVerificationScreen(
      {Key? key, required this.phoneNumber, required this.verificationId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().appMediumColor,
      body: SingleChildScrollView(
        child: Column(children: [
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
              ImagePath.mailSent,
              alignment: Alignment.bottomCenter,
            ),
          ),

          /*SizedBox(
              height: 80,
                width: 80,
                child: LottieBuilder.asset("assets/lottie/sent.json", repeat: true)),*/
          const SizedBox(
            height: 19,
          ),
          PinCodeVerificationScreen(
            phoneNumber: phoneNumber,
            verificationId: verificationId,
          )
        ]),
      ),
    );
  }
}

class PinCodeVerificationScreen extends ConsumerStatefulWidget {
  const PinCodeVerificationScreen(
      {Key? key, required this.phoneNumber, required this.verificationId})
      : super(key: key);

  final String phoneNumber;
  final String verificationId;

  @override
  ConsumerState<PinCodeVerificationScreen> createState() =>
      _PinCodeVerificationScreenState();
}

class _PinCodeVerificationScreenState
    extends ConsumerState<PinCodeVerificationScreen> {
  TextEditingController textEditingController = TextEditingController();
  // ..text = "123456";

  // ignore: close_sinks
  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();

    super.dispose();
  }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(5)),
      child: SizedBox(
        height: ResponsiveFlutter.of(context).moderateScale(339),
        width: double.infinity,
        child: Column(
          children: [
            Text(
              'Phone Number Verification',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveFlutter.of(context).fontSize(3),
                  color: AppColors().lightColor),
              textAlign: TextAlign.center,
            ),
            RichText(
              text: TextSpan(
                text: "Enter the code sent to ",
                children: [
                  TextSpan(
                    text: widget.phoneNumber,
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
              height: ResponsiveFlutter.of(context).moderateScale(20),
            ),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 30,
                ),
                child: PinCodeTextField(
                  appContext: context,
                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,
                  obscureText: false,
                  obscuringCharacter: '*',

                  blinkWhenObscuring: true,
                  animationType: AnimationType.fade,

                  pinTheme: PinTheme(
                    inactiveColor: AppColors().btnColor,
                    inactiveFillColor: AppColors().btnColor,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  cursorColor: Colors.white,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: const [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 10,
                    )
                  ],
                  onCompleted: (v) {
                    debugPrint("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    debugPrint(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    debugPrint("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Text(
                hasError ? "*Wrong code" : "",
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Didn't receive the code? ",
                  style: TextStyle(color: AppColors().lightColor, fontSize: 15),
                ),
                TextButton(
                  onPressed: () => snackBar("Code resent !"),
                  child: Text(
                    "RESEND",
                    style: TextStyle(
                      color: AppColors().btnColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
              decoration: BoxDecoration(
                  color: Colors.green.shade300,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.green.shade200,
                        offset: const Offset(1, -2),
                        blurRadius: 5),
                    BoxShadow(
                        color: Colors.green.shade200,
                        offset: const Offset(-1, 2),
                        blurRadius: 5)
                  ]),
              child: ButtonTheme(
                height: 50,
                child: TextButton(
                  onPressed: () {
                    formKey.currentState!.validate();
                    // conditions for validating
                    if (currentText.length != 6) {
                      errorController!.add(ErrorAnimationType
                          .shake); // Triggering error shake animation
                      setState(() => hasError = true);
                    } else {
                      setState(
                        () {
                          hasError = false;
                          ref.read(firebaseAutheControllerProvider).verifySms(
                              context: context,
                              verificationId: widget.verificationId,
                              smsCode: currentText,
                            ref:ref
                          );
                        },
                      );
                    }
                  },
                  child: Center(
                    child: Text(
                      "VERIFY".toUpperCase(),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Center(
                    child: TextButton(
                      child: Text(
                        "Clear",
                        style: TextStyle(color: AppColors().lightColor),
                      ),
                      onPressed: () {
                        textEditingController.clear();
                      },
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

/*Text("Email sent to $emailAddress please check and confirm"),
          ElevatedButton(
              onPressed: () {}, child: const Text("Email already confirmed")),
          const Text("Did not receive the email?"),
          ElevatedButton(onPressed: () {}, child: const Text("Resend email"))*/

