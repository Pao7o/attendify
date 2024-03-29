import 'package:attendify/features/authentication/screens/phone_number_screen.dart';
import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/features/common/utils.dart';
import 'package:attendify/features/firebase/controller/firebase_auth_controller.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const String routeName = "/signup_screen";
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends ConsumerState<SignUpScreen> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

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
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top,
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(240),
                                  width: double.infinity,
                                  color: appColors.appDarkColor,
                                ),
                                Container(
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(15),
                                  width: double.infinity,
                                  color: appColors.appMediumColor,
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    top: ResponsiveFlutter.of(context)
                                        .verticalScale(30)),
                                child: Image.asset(
                                  imagePath.registerImageBG,
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Image.asset(
                                  ImagePath.logo,
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(30),
                                ),
                                SizedBox(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(20)),
                                Container(
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(200),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: ResponsiveFlutter.of(context)
                                          .moderateScale(25)),
                                  child: Image.asset(
                                    ImagePath.registerImage,
                                    alignment: Alignment.bottomCenter,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(
                                ResponsiveFlutter.of(context)
                                    .moderateScale(20)),
                            color: appColors.appMediumColor,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                MyTextView(
                                  Strings.signUp,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.lightColor,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(3.7),
                                    fontWeightNew: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(5)),
                                MyTextView(
                                  Strings.pleaseFillTheDetails,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.mediumGrayColor,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(1.8),
                                    fontWeightNew: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(15)),
                                Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    Container(
                                      height: ResponsiveFlutter.of(context)
                                          .verticalScale(180),
                                      padding: EdgeInsets.symmetric(
                                        vertical: ResponsiveFlutter.of(context)
                                            .moderateScale(20),
                                        horizontal:
                                            ResponsiveFlutter.of(context)
                                                .moderateScale(25),
                                      ),
                                      alignment: Alignment.topCenter,
                                      margin: EdgeInsets.only(
                                          bottom: ResponsiveFlutter.of(context)
                                              .moderateScale(25)),
                                      decoration: BoxDecoration(
                                        color: appColors.appLightColor,
                                        borderRadius: BorderRadius.circular(
                                          ResponsiveFlutter.of(context)
                                              .moderateScale(25),
                                        ),
                                      ),
                                      child: Form(
                                        key: _formKey,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: commonTestField(
                                                      validateFunction: (p0) {
                                                        if (p0 == null ||
                                                            p0.isEmpty) {
                                                          return "Enter First Name";
                                                        }
                                                        if (!RegExp(
                                                                r'^[a-zA-Z]')
                                                            .hasMatch(p0)) {
                                                          return "Enter a valid First Name";
                                                        }
                                                        return null;
                                                      },
                                                      context: context,
                                                      controller:
                                                          firstNameController,
                                                      hintText:
                                                          Strings.firstName,
                                                      image: ImagePath.avatar,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      obscureText: false,
                                                      icon: true,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: commonTestField(
                                                      validateFunction: (p0) {
                                                        if (p0 == null ||
                                                            p0.isEmpty) {
                                                          return "Enter Last Name";
                                                        }
                                                        if (!RegExp(
                                                                r'^[a-zA-Z]')
                                                            .hasMatch(p0)) {
                                                          return "Enter a valid First Name";
                                                        }
                                                        return null;
                                                      },
                                                      context: context,
                                                      controller:
                                                          lastNameController,
                                                      hintText:
                                                          Strings.lastName,
                                                      image: ImagePath.avatar,
                                                      keyboardType:
                                                          TextInputType.name,
                                                      obscureText: false,
                                                      icon: true,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                  height: ResponsiveFlutter.of(
                                                          context)
                                                      .verticalScale(20)),
                                              commonTestField(
                                                validateFunction: (p0) {
                                                  if (p0 == null ||
                                                      p0.isEmpty) {
                                                    return "Field is empty";
                                                  }
                                                  if (!EmailValidator.validate(
                                                      p0)) {
                                                    return "Enter a valid Email Address";
                                                  }
                                                  return null;
                                                },
                                                context: context,
                                                controller: emailController,
                                                hintText: Strings.emailAddress,
                                                image: ImagePath.email,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                obscureText: false,
                                                icon: true,
                                              ),
                                              SizedBox(
                                                  height: ResponsiveFlutter.of(
                                                          context)
                                                      .verticalScale(20)),
                                              commonTestField(
                                                validateFunction: (p0) {
                                                  if (p0 == null ||
                                                      p0.isEmpty) {
                                                    return "Field is empty";
                                                  }
                                                  return null;
                                                },
                                                context: context,
                                                controller: passwordController,
                                                hintText: Strings.password,
                                                image: ImagePath.password,
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                obscureText: true,
                                                icon: true,
                                              ),
                                              Visibility(
                                                child: FlutterPwValidator(
                                                    width: 400,
                                                    height: 150,
                                                    minLength: 0,
                                                    onSuccess: () {},
                                                    controller:
                                                        passwordController),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            ResponsiveFlutter.of(context)
                                                .moderateScale(55),
                                      ),
                                      child: GestureDetector(
                                        onTap: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            Utils().sendingEmailDialog(
                                                context: context,
                                                email: emailController.text
                                                    .trim());
                                            await ref
                                                .read(
                                                    firebaseAutheControllerProvider)
                                                .signupWithEmailandPassword(
                                                  ref: ref,
                                                  context: context,
                                                  email: emailController.text
                                                      .trim(),
                                                  password:
                                                      passwordController.text,
                                                  firstName: firstNameController
                                                      .text
                                                      .trim(),
                                                  lastName: lastNameController
                                                      .text
                                                      .trim(),
                                                );
                                          }
                                        },
                                        child: commonButton(
                                          context: context,
                                          title: Strings.signUp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(10)),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(
                                            ResponsiveFlutter.of(context)
                                                .moderateScale(8.5)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            width: ResponsiveFlutter.of(context)
                                                .scale(120),
                                            height:
                                                ResponsiveFlutter.of(context)
                                                    .verticalScale(35),
                                            child: MaterialButton(
                                              onPressed: () {
                                                ref
                                                    .read(
                                                        firebaseAutheControllerProvider)
                                                    .signUpWithGoogle(
                                                  context: context,ref:ref);
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              color: Colors.white,
                                              textColor: Colors.black,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 10, 10, 10),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/ic_google.png",
                                                    width: ResponsiveFlutter.of(
                                                            context)
                                                        .scale(25),
                                                    height:
                                                        ResponsiveFlutter.of(
                                                                context)
                                                            .verticalScale(25),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          ResponsiveFlutter.of(
                                                                  context)
                                                              .scale(10)),
                                                  const Text(
                                                    'Sign up',
                                                    style: TextStyle(
                                                      fontFamily: 'Google',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(
                                            ResponsiveFlutter.of(context)
                                                .moderateScale(8.5)),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: SizedBox(
                                            width: ResponsiveFlutter.of(context)
                                                .scale(120),
                                            height:
                                                ResponsiveFlutter.of(context)
                                                    .verticalScale(35),
                                            child: MaterialButton(
                                              onPressed: () {
                                                Navigator.pushNamed(
                                                    context,
                                                    PhoneNumberScreen
                                                        .routeName);
                                              },
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                              ),
                                              color: Colors.white,
                                              textColor: Colors.black,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      10, 10, 10, 10),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                    "assets/images/ic_phone_blue.png",
                                                    width: ResponsiveFlutter.of(
                                                            context)
                                                        .scale(25),
                                                    height:
                                                        ResponsiveFlutter.of(
                                                                context)
                                                            .verticalScale(25),
                                                  ),
                                                  SizedBox(
                                                      width:
                                                          ResponsiveFlutter.of(
                                                                  context)
                                                              .scale(10)),
                                                  const Text(
                                                    'Sign up',
                                                    style: TextStyle(
                                                      fontFamily: 'Google',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]),
                                SizedBox(
                                    height: ResponsiveFlutter.of(context)
                                        .verticalScale(15)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MyTextView(
                                      Strings.doNotHaveAnAccount,
                                      textAligntNew: TextAlign.center,
                                      styleNew: MyTextStyle(
                                        colorNew: appColors.mediumGrayColor,
                                        fontWeightNew: FontWeight.w400,
                                        size: ResponsiveFlutter.of(context)
                                            .fontSize(1.8),
                                      ),
                                    ),
                                    SizedBox(
                                        width: ResponsiveFlutter.of(context)
                                            .verticalScale(2)),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: MyTextView(
                                          Strings.login,
                                          textAligntNew: TextAlign.center,
                                          styleNew: MyTextStyle(
                                            colorNew: appColors.lightPinkColor,
                                            fontWeightNew: FontWeight.bold,
                                            size: ResponsiveFlutter.of(context)
                                                .fontSize(2),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }
}
