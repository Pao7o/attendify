import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/features/firebase/controller/firebase_auth_controller.dart';
import 'package:attendify/features/firebase/models/app_user.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SetUsernameScreen extends ConsumerStatefulWidget {
  static const String routeName = "set_username_screen";

  final AppUser user;
  const SetUsernameScreen({super.key, required this.user});

  @override
  SetUsernameScreenState createState() => SetUsernameScreenState();
}

class SetUsernameScreenState extends ConsumerState<SetUsernameScreen> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();

  final _formKey = GlobalKey<FormState>();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
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
                                  .verticalScale(15),
                              width: double.infinity,
                              color: appColors.appMediumColor,
                            ),
                          ],
                        ),
                        Container(
                          color: appColors.appDarkColor,
                          child: Column(
                            children: [
                              Image.asset(
                                ImagePath.logo,
                                height: ResponsiveFlutter.of(context)
                                    .verticalScale(30),
                              ),
                              SizedBox(
                                  height: ResponsiveFlutter.of(context)
                                      .verticalScale(0)),
                              Image.asset(
                                ImagePath.username,
                                alignment: Alignment.bottomCenter,
                                height: 300,
                                width: double.infinity,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(
                            ResponsiveFlutter.of(context).moderateScale(20)),
                        color: appColors.appMediumColor,
                        child: Column(
                          children: [
                            Text("It's time to choose your username !",
                                style: TextStyle(
                                    color: appColors.lightColor,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(2.5))),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("(Don't worry, you can modify it later)",
                                style: TextStyle(
                                    color: appColors.lightColor,
                                    fontSize: ResponsiveFlutter.of(context)
                                        .fontSize(1.5))),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Form(
                                key: _formKey,
                                child: Column(children: <Widget>[
                                  Row(
                                    children: [
                                      Expanded(
                                        child: commonTestField(
                                          validateFunction: (p0) {
                                            if (p0 == null || p0.isEmpty) {
                                              return "Enter First Name";
                                            }
                                            if (!RegExp(r'^[a-zA-Z]')
                                                .hasMatch(p0)) {
                                              return "Enter a valid First Name";
                                            }
                                            return null;
                                          },
                                          context: context,
                                          controller: firstNameController,
                                          hintText: Strings.firstName,
                                          image: ImagePath.avatar,
                                          keyboardType: TextInputType.name,
                                          obscureText: false,
                                          icon: true,
                                        ),
                                      ),
                                      Expanded(
                                        child: commonTestField(
                                          validateFunction: (p0) {
                                            if (p0 == null || p0.isEmpty) {
                                              return "Enter Last Name";
                                            }
                                            if (!RegExp(r'^[a-zA-Z]')
                                                .hasMatch(p0)) {
                                              return "Enter a valid First Name";
                                            }
                                            return null;
                                          },
                                          context: context,
                                          controller: lastNameController,
                                          hintText: Strings.lastName,
                                          image: ImagePath.avatar,
                                          keyboardType: TextInputType.name,
                                          obscureText: false,
                                          icon: true,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 32.0),
                                  SizedBox(
                                    width: 250,
                                    height: 50,
                                    child: MaterialButton(
                                        color: Colors.green[400],
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            side: const BorderSide(
                                                color: Colors.black)),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            widget.user.firstName =
                                                firstNameController.text.trim();
                                            widget.user.lastName =
                                                lastNameController.text.trim();
                                            ref
                                                .read(
                                                    firebaseAutheControllerProvider)
                                                .addUser(
                                                    widget.user, ref, context);
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                "Continue",
                                                style: TextStyle(
                                                    color: appColors.lightColor,
                                                    fontSize:
                                                        ResponsiveFlutter.of(
                                                                context)
                                                            .fontSize(2)),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 50,
                                            ),
                                            Icon(Icons.arrow_forward,
                                                color: appColors.lightColor)
                                          ],
                                        )),
                                  ),
                                ]),
                              ),
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
        ),
      ),
    );
  }
}
