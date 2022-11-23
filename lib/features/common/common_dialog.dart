import 'dart:io';

import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

typedef AlertAction<T> = void Function(T index);

/// Common Dialog For auto android and ios Dialog converter ------------>>
class CommonDialog {
  String? alertTitle;
  String? alertDetailMessage;
  String? cancelTitle;
  List<String>? alertActionTitles;
  AlertAction<int>? onAlertAction;
  BuildContext? context;

  CommonDialog({
    this.context,
    this.cancelTitle = "",
    this.alertTitle = Strings.appName,
    this.alertDetailMessage,
    this.alertActionTitles,
    this.onAlertAction,
  });

  void show(BuildContext context) {
    BuildContext? dialogContext;
    List<Widget>? actions = [];
    AppColors appColors = AppColors();
    Widget actionButton = GestureDetector(
      onTap: () {
        Navigator.pop(dialogContext!);
      },
      child: cancelTitle != null
          ? Container(
              height: ResponsiveFlutter.of(context)
                  .verticalScale(Platform.isIOS ? 40 : 35),
              width: ResponsiveFlutter.of(context).scale(75),
              alignment: Alignment.center,
              color: appColors.black,
              child: Text(
                cancelTitle!,
                style: MyTextStyle(
                  size: ResponsiveFlutter.of(context).fontSize(2.1),
                  fontFamilyNew: Constants.carosSoft,
                  fontWeightNew: FontWeight.w400,
                ),
              ),
            )
          : Container(
              height: ResponsiveFlutter.of(context)
                  .verticalScale(Platform.isIOS ? 40 : 35),
              width: ResponsiveFlutter.of(context).scale(75),
              alignment: Alignment.center,
              color: appColors.black,
              child: Text(
                '',
                style: MyTextStyle(
                  size: ResponsiveFlutter.of(context).fontSize(2.1),
                  fontFamilyNew: Constants.carosSoft,
                  fontWeightNew: FontWeight.w400,
                ),
              ),
            ),
    );
    if (cancelTitle != null && cancelTitle!.isNotEmpty)
      actions.add(actionButton);
    for (int i = 0; i < alertActionTitles!.length; i++) {
      Widget actionButton = GestureDetector(
        onTap: () {
          Navigator.of(dialogContext!, rootNavigator: true).pop('dialog');
          onAlertAction!(i);
        },
        child: Container(
          height: ResponsiveFlutter.of(context)
              .verticalScale(Platform.isIOS ? 40 : 35),
          width: ResponsiveFlutter.of(context).scale(75),
          alignment: Alignment.center,
          color: appColors.black,
          child: Text(
            alertActionTitles![i],
            style: MyTextStyle(
              size: ResponsiveFlutter.of(context).fontSize(2.1),
              fontFamilyNew: Constants.carosSoft,
              fontWeightNew: FontWeight.w500,
            ),
          ),
        ),
      );
      actions.add(actionButton);
    }
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        dialogContext = context;
        return _getAlertDialog(actions);
      },
    );
  }

  Widget _getAlertDialog(List<Widget> actions) {
    if (Platform.isIOS) {
      return CupertinoAlertDialog(
        actions: actions,
        title: MyTextView(
          alertTitle ?? "",
          textAligntNew: TextAlign.center,
          styleNew: MyTextStyle(
            size: ResponsiveFlutter.of(context).fontSize(2.1),
            fontFamilyNew: Constants.carosSoft,
            fontWeightNew: FontWeight.w600,
          ),
        ),
        content: MyTextView(
          alertDetailMessage ?? "",
          maxLineWrap: true,
          textAligntNew: TextAlign.center,
          styleNew: MyTextStyle(
            size: ResponsiveFlutter.of(context).fontSize(1.9),
            fontFamilyNew: Constants.carosSoft,
          ),
        ),
      );
    } else {
      return AlertDialog(
        actions: actions,
        // buttonPadding: EdgeInsets.zero,
        title: MyTextView(
          alertTitle ?? "",
          textAligntNew: TextAlign.start,
          styleNew: MyTextStyle(
            size: ResponsiveFlutter.of(context).fontSize(2.4),
            fontFamilyNew: Constants.carosSoft,
            fontWeightNew: FontWeight.w600,
          ),
        ),
        content: MyTextView(
          alertDetailMessage ?? "",
          textAligntNew: TextAlign.start,
          maxLineWrap: true,
          styleNew: MyTextStyle(
            size: ResponsiveFlutter.of(context).fontSize(2),
            fontFamilyNew: Constants.carosSoft,
          ),
        ),
      );
    }
  }
}
