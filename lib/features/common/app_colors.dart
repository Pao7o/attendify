import 'package:attendify/features/common/constants.dart';
import 'package:flutter/material.dart';

Map<int, Color> darkTheme = {
  50: const Color(0x1A261E39),
  100: const Color(0x26261E39),
  200: const Color(0x33261E39),
  300: const Color(0x4D261E39),
  400: const Color(0x66261E39),
  500: const Color(0x80261E39),
  600: const Color(0x99261E39),
  700: const Color(0xB3261E39),
  800: const Color(0xCC261E39),
  900: const Color(0xE6261E39),
};

Map<int, Color> lightTheme = {
  50: const Color(0x1AFFFFFF),
  100: const Color(0x26FFFFFF),
  200: const Color(0x33FFFFFF),
  300: const Color(0x4DFFFFFF),
  400: const Color(0x66FFFFFF),
  500: const Color(0x80FFFFFF),
  600: const Color(0x99FFFFFF),
  700: const Color(0xB3FFFFFF),
  800: const Color(0xCCFFFFFF),
  900: const Color(0xE6FFFFFF),
};

class AppColors {
  MaterialColor primarySwatchColors = Constants.darkTheme
      ? MaterialColor(0xFF261E39, darkTheme)
      : MaterialColor(0xFFFFFFFF, lightTheme);
  Color green = const Color(0xFF00FA00);
  Color red = const Color(0xFFFF0000);
  Color yellow = const Color(0xFFEEC829);
  Color black = const Color(0xFF000000);
  Color white = const Color(0xFFFFFFFF);

  Color btnColor =
      Constants.darkTheme ? const Color(0xFFB23EFF) : const Color(0xFFB23EFF);
  Color blurBtnColor =
      Constants.darkTheme ? const Color(0xFF413351) : const Color(0xFF413351);

  Color lightColor =
      Constants.darkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF2F2644);
  Color mediumGrayColor =
      Constants.darkTheme ? const Color(0xFF9793A2) : const Color(0xFF9793A2);
  Color mediumLightColor =
      Constants.darkTheme ? const Color(0xFFD7D5DC) : const Color(0xFF888CAC);
  Color lightPinkColor =
      Constants.darkTheme ? const Color(0xFFFFB6D6) : const Color(0xFFFF92C2);

  Color greyTextColor = const Color(0xFFD5D4D6);
  Color darkGreyText = const Color(0xFF717694);
  Color grey = const Color(0xFF707070);

  Color chatTextColor = const Color(0xFF261E39);
  Color chatReceiverContainerColor =
      Constants.darkTheme ? const Color(0xFF392F51) : const Color(0xFFE6E6E6);
  Color chatReceiverTextColor =
      Constants.darkTheme ? const Color(0xFFF6F6F6) : const Color(0xFF392F51);
  Color appDarkColor =
      Constants.darkTheme ? const Color(0xFF261E39) : const Color(0xFFFFFFFF);
  Color appMediumColor =
        Constants.darkTheme ? const Color(0xFF2F2644) : const Color(0xFFF6F6F6);
  Color appLightColor =
      Constants.darkTheme ? const Color(0xFF392F51) : const Color(0xFFFFFFFF);

  Color iconColor =
      Constants.darkTheme ? const Color(0xFFFFFFFF) : const Color(0xFF302745);

  Color dividerColor = const Color(0xFFC3C5CF);
  Color switchColor =
      Constants.darkTheme ? const Color(0xFF675198) : const Color(0xFFA927FF);
  Color switchToggleColor =
      Constants.darkTheme ? const Color(0xFF675198) : const Color(0xFFFFFFFF);
  Color borderColor =
      Constants.darkTheme ? const Color(0xFF433760) : const Color(0xFFFFFFFF);
  Color transactionText = const Color(0xFF888CAC);
  Color greenOpacity = const Color(0xffCDEFCC);
  Color greenText = const Color(0xff2FD529);
  Color redText = const Color(0xffFF4848);
  Color redOpacity = const Color(0xffBEBAC5);
  Color gradiantStartColor = const Color(0xff581101);
}
