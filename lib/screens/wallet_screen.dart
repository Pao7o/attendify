import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/model/common_model.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/add_money_screen.dart';
import 'package:attendify/screens/withdraw_money_screen.dart';
import 'package:flutter/material.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  AppColors appColors = AppColors();
  List<CommonModel> data = [
    CommonModel(value: 1),
    CommonModel(value: 0),
    CommonModel(value: 1),
    CommonModel(value: 1),
    CommonModel(value: 0),
    CommonModel(value: 1),
    CommonModel(value: 1),
    CommonModel(value: 1),
    CommonModel(value: 0),
    CommonModel(value: 0),
    CommonModel(value: 1),
    CommonModel(value: 1),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: AppBar().preferredSize.height +
                      MediaQuery.of(context).padding.top +
                      ResponsiveFlutter.of(context).moderateScale(75),
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                    vertical: ResponsiveFlutter.of(context).moderateScale(15),
                  ),
                  decoration: BoxDecoration(
                    color: appColors.btnColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(
                          ResponsiveFlutter.of(context).moderateScale(30)),
                      bottomRight: Radius.circular(
                          ResponsiveFlutter.of(context).moderateScale(30)),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyTextView(
                            Strings.dummyText15,
                            textAligntNew: TextAlign.center,
                            styleNew: MyTextStyle(
                              colorNew: appColors.white,
                              fontWeightNew: FontWeight.w600,
                              size: ResponsiveFlutter.of(context).fontSize(3),
                            ),
                          ),
                          SizedBox(
                            height:
                                ResponsiveFlutter.of(context).moderateScale(3),
                          ),
                          MyTextView(
                            Strings.myBalance,
                            textAligntNew: TextAlign.center,
                            styleNew: MyTextStyle(
                              colorNew: appColors.greyTextColor,
                              fontWeightNew: FontWeight.w500,
                              size: ResponsiveFlutter.of(context).fontSize(1.8),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddMoneyScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(45),
                          width:
                              ResponsiveFlutter.of(context).moderateScale(45),
                          padding: EdgeInsets.all(
                              ResponsiveFlutter.of(context).moderateScale(5)),
                          decoration: BoxDecoration(
                            color: appColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(ImagePath.add),
                        ),
                      ),
                      SizedBox(
                        width: ResponsiveFlutter.of(context).verticalScale(15),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const WithdrawMoneyScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(45),
                          width:
                              ResponsiveFlutter.of(context).moderateScale(45),
                          padding: EdgeInsets.all(
                              ResponsiveFlutter.of(context).moderateScale(12)),
                          decoration: BoxDecoration(
                            color: appColors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(ImagePath.withdraw),
                        ),
                      ),
                    ],
                  ),
                ),
                commonAppBar(
                  title: Strings.wallet,
                  context: context,
                  backArrow: false,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  vertical: ResponsiveFlutter.of(context).moderateScale(25),
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                ),
                children: [
                  MyTextView(
                    Strings.transactions,
                    textAligntNew: TextAlign.start,
                    styleNew: MyTextStyle(
                      colorNew: appColors.lightColor,
                      fontWeightNew: FontWeight.w500,
                      size: ResponsiveFlutter.of(context).fontSize(2.5),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).verticalScale(20),
                  ),
                  ListView.separated(
                    itemCount: data.length,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: ResponsiveFlutter.of(context).moderateScale(50),
                        width: double.infinity,
                        child: Row(
                          children: [
                            data[index].value == 1
                                ? Container(
                                    height: ResponsiveFlutter.of(context)
                                        .moderateScale(50),
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(50),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1.5,
                                        color: appColors.greenOpacity,
                                      ),
                                    ),
                                    child: Image.asset(
                                      ImagePath.greenUp,
                                      height: ResponsiveFlutter.of(context)
                                          .moderateScale(8),
                                    ),
                                  )
                                : Container(
                                    height: ResponsiveFlutter.of(context)
                                        .moderateScale(50),
                                    width: ResponsiveFlutter.of(context)
                                        .moderateScale(50),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: 1.5,
                                        color: appColors.redOpacity,
                                      ),
                                    ),
                                    child: Image.asset(
                                      ImagePath.redDown,
                                      height: ResponsiveFlutter.of(context)
                                          .moderateScale(8),
                                      alignment: Alignment.center,
                                    ),
                                  ),
                            SizedBox(
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(15),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    MyTextView(
                                      Strings.dummyText16 + " ",
                                      textAligntNew: TextAlign.start,
                                      styleNew: MyTextStyle(
                                        colorNew: appColors.lightColor,
                                        fontWeightNew: FontWeight.w300,
                                        size: ResponsiveFlutter.of(context)
                                            .fontSize(2),
                                      ),
                                    ),
                                    MyTextView(
                                      Strings.dummyText19,
                                      textAligntNew: TextAlign.start,
                                      styleNew: MyTextStyle(
                                        colorNew: appColors.lightColor,
                                        fontWeightNew: FontWeight.w500,
                                        size: ResponsiveFlutter.of(context)
                                            .fontSize(2.1),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: ResponsiveFlutter.of(context)
                                      .moderateScale(2),
                                ),
                                Row(
                                  children: [
                                    MyTextView(
                                      Strings.transactionId,
                                      textAligntNew: TextAlign.start,
                                      styleNew: MyTextStyle(
                                        colorNew: appColors.transactionText,
                                        fontWeightNew: FontWeight.w400,
                                        size: ResponsiveFlutter.of(context)
                                            .fontSize(1.5),
                                      ),
                                    ),
                                    MyTextView(
                                      Strings.dummyText20,
                                      textAligntNew: TextAlign.start,
                                      styleNew: MyTextStyle(
                                        colorNew: appColors.transactionText,
                                        fontWeightNew: FontWeight.w400,
                                        size: ResponsiveFlutter.of(context)
                                            .fontSize(1.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                MyTextView(
                                  Strings.dummyText18,
                                  textAligntNew: TextAlign.start,
                                  styleNew: MyTextStyle(
                                    colorNew: data[index].value == 1
                                        ? appColors.greenText
                                        : appColors.redText,
                                    fontWeightNew: FontWeight.w500,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(2.2),
                                  ),
                                ),
                                SizedBox(
                                  height: ResponsiveFlutter.of(context)
                                      .moderateScale(2),
                                ),
                                MyTextView(
                                  Strings.dummyText17,
                                  textAligntNew: TextAlign.start,
                                  styleNew: MyTextStyle(
                                    colorNew: appColors.transactionText,
                                    fontWeightNew: FontWeight.w400,
                                    size: ResponsiveFlutter.of(context)
                                        .fontSize(1.4),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: ResponsiveFlutter.of(context).verticalScale(15),
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ResponsiveFlutter.of(context).verticalScale(70),
            ),
          ],
        ),
      ),
    );
  }
}
