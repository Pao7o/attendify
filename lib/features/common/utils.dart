import 'dart:convert';
import 'dart:io';

import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_dialog.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:connectivity/connectivity.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_dialogs/material_dialogs.dart';

class Utils {
  AppColors appColors = AppColors();

  /// Dark Status Bar ------------>>
  void darkStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: appColors.lightColor,
        systemNavigationBarDividerColor: Colors.grey.shade500,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  /// Light Status Bar ------------>>
  void lightStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: appColors.lightColor,
        systemNavigationBarDividerColor: Colors.grey.shade500,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }

  /// Screen Portrait Controller ------------>>
  static void screenPortrait() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// Show Progress Dialog ------------>>
  void showProgressDialog({@required BuildContext? context}) {
    showDialog(
      context: context!,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Center(
            child: Container(
              width: ResponsiveFlutter.of(context).moderateScale(100),
              height: ResponsiveFlutter.of(context).moderateScale(100),
              decoration: BoxDecoration(
                color: appColors.black,
                borderRadius: BorderRadius.circular(
                  ResponsiveFlutter.of(context).moderateScale(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SpinKitCircle(
                    color: appColors.lightColor,
                    size: ResponsiveFlutter.of(context).moderateScale(40),
                  ),
                  MyTextView(
                    Strings.loading,
                    maxLineWrap: true,
                    textAligntNew: TextAlign.center,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      size: ResponsiveFlutter.of(context).fontSize(1.9),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Hide Progress Dialog ------------>>
  void hideProgressDialog({@required BuildContext? buildContext}) {
    Navigator.of(buildContext!, rootNavigator: true).pop();
  }

  /// Get Device Type ------------>>
  String getDeviceType() {
    if (Platform.isAndroid) {
      return Strings.android;
    } else {
      return Strings.ios;
    }
  }

  /// Email Validator ------------>>
  bool emailValidator(String email) {
    debugPrint("<<<< ------- emailValidator ------- >>>>");
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(email)) {
      return true;
    }

    return false;
  }

  /// Phone Validator ------------>>
  bool phoneValidator(String contact) {
    debugPrint("<<<< ------- phoneValidator ------- >>>>");
    String p = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(contact)) {
      return true;
    }

    return false;
  }

  /// Unics Password Validator ------------>>
  bool passwordValidator(String contact) {
    debugPrint("<<<< ------- passwordValidator ------- >>>>");
    String p = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(contact)) {
      return true;
    }
    return false;
  }

  /// Simple Phone Validate Validator ------------>>
  bool simplePhoneValidate(String value) {
    debugPrint("<<<< ------- validateMobile ------- >>>>");
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return false;
    } else if (!regExp.hasMatch(value)) {
      return false;
    }
    return true;
  }

  /// Is Empty Validator ------------>>
  bool isEmpty(String? val) {
    if (val == null ||
        val.isEmpty ||
        val == "null" ||
        val == "" ||
        val == "NULL") {
      return true;
    } else {
      return false;
    }
  }

  /// Is Network Available Check ------------>>
  Future<bool> isNetworkAvailable({
    bool? showDialog,
    BuildContext? context,
  }) async {
    ConnectivityResult result;
    final Connectivity connectivity = Connectivity();
    try {
      result = await connectivity.checkConnectivity();
      debugPrint(result.toString());
      switch (result) {
        case ConnectivityResult.wifi:
          return true;
        case ConnectivityResult.mobile:
          return true;
        default:
          if (showDialog!) {
            alertDialog(Strings.networkError, contextDialog: context!);
          }
          return false;
      }
    } on PlatformException catch (e) {
      debugPrint(e.toString());
      if (showDialog!) {
        alertDialog(Strings.networkError, contextDialog: context!);
      }
      return false;
    }
  }

  /// Simple Massage Alert Dialog ------------>>
  alertDialog(String title, {@required BuildContext? contextDialog}) async {
    List<String> alertTitles = <String>[Strings.ok];
    CommonDialog(
      context: contextDialog,
      alertTitle: Strings.appName,
      alertDetailMessage: title,
      alertActionTitles: alertTitles,
      onAlertAction: (int selectedActionIndex) {},
    ).show(contextDialog!);
  }

  /// Transform MilliSeconds ------------>>
  static transformMilliSeconds(int milliseconds) {
    int hundreds = (milliseconds / 10).truncate();
    int seconds = (hundreds / 100).truncate();
    int minutes = (seconds / 60).truncate();
    int hours = (minutes / 60).truncate();

    String hoursStr = (hours % 60).toString().padLeft(2, '0');
    String minutesStr = (minutes % 60).toString().padLeft(2, '0');
    String secondsStr = (seconds % 60).toString().padLeft(2, '0');
    String strTime = '';
    if (hoursStr == '00' || hoursStr == '0') {
      strTime = '$minutesStr:$secondsStr';
    } else {
      strTime = '$hoursStr:$minutesStr:$secondsStr';
    }
    return strTime;
  }

  /// To Convert Password To Md5 ------------>>
  String generateMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  /// Show Toast Massage ------------>>
  void showToast(String message, BuildContext context) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      textColor: appColors.lightColor,
      backgroundColor: Colors.black26,
    );
  }

  /// Get Current Time ------------>>
  String currentTime() {
    String month = DateFormat.M().format(DateTime.now().toUtc());
    String day = DateFormat.d().format(DateTime.now().toUtc());
    String time = DateFormat.Hm().format(DateTime.now().toUtc());
    String timeDate =
        '${DateFormat.y().format(DateTime.now().toUtc())}-${month.length == 1 ? '0$month' : month}-${day.length == 1 ? '0$day' : day} $time';
    return timeDate;
  }

  /// Get Current Date ------------>>
  String currentDate(String outputFormat) {
    var now = DateTime.now().toUtc();
    var formatter = DateFormat(outputFormat);
    String formattedDate = formatter.format(now);

    return formattedDate;
  }

  /// Launch URL to browser ------------>>
  void urlLaunch(String webUrl) async {
    if (await canLaunch(webUrl)) {
      await launch(webUrl);
    }
  }

  /// To Create File Slots ------------>>
  List<String> fillSlots() {
    List<String> list = [];
    for (int i = 1; i <= 100; i++) {
      list.add("$i");
    }
    return list;
  }

  /// To Change Date Format ------------>>
  Future<String> changeDateFormat(
      String? date, String? formatInput, String? formatOutput) async {
    if (date != null && date.isNotEmpty) {
      final format = DateFormat(formatInput);
      DateTime gettingDate = format.parse(date);
      final DateFormat formatter = DateFormat(formatOutput);
      final String formatted = formatter.format(gettingDate);
      return formatted;
    }
    return '';
  }

  /// To Get Day Of Month Suffix ------------>>
  String getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }

  /// To Read Time Stamp ------------>>
  String readTimestamp(int timestamp) {
    var now = DateTime.now();
    var format = DateFormat('dd-yyyy,MM HH:mm a');
    var date = DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000);
    var diff = date.difference(now);
    var time = '';

    if (diff.inSeconds <= 0 ||
        diff.inSeconds > 0 && diff.inMinutes == 0 ||
        diff.inMinutes > 0 && diff.inHours == 0 ||
        diff.inHours > 0 && diff.inDays == 0) {
      time = format.format(date);
    } else {
      if (diff.inDays == 1) {
        time = '${diff.inDays}DAY AGO';
      } else {
        time = '${diff.inDays}DAYS AGO';
      }
    }
    return time;
  }

  void sendingEmailDialog(
      {required BuildContext context, required String email}) {
    Dialogs.materialDialog(
      context: context,
      msg: "Sending verification email to $email",
      title: "Sending....",
      lottieBuilder: LottieBuilder.asset("assets/lottie/email_plane.json"),
    );
  }

  void errorDialog({required BuildContext context, required String error}) {
    Dialogs.materialDialog(
      context: context,
      msg: "Sending verification email to ",
      title: "Sending....",
      lottieBuilder: LottieBuilder.asset("assets/lottie/email_plane.json"),
    );
  }
}
