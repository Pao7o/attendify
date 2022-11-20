import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/add_wallet_success_screen.dart';
import 'package:flutter/material.dart';

class AddMoneyScreen extends StatefulWidget {
  const AddMoneyScreen({Key? key}) : super(key: key);
  @override
  _AddMoneyScreenState createState() => _AddMoneyScreenState();
}

class _AddMoneyScreenState extends State<AddMoneyScreen> {
  AppColors appColors = AppColors();
  String dropDownValue = 'SBI';
  var items = [
    'SBI',
    'SBI 1',
    'SBI 2',
    'SBI 3',
    'SBI 4',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: Column(
          children: [
            commonAppBar(
              context: context,
              backArrow: true,
              title: Strings.addMoney,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  vertical: ResponsiveFlutter.of(context).moderateScale(15),
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                ),
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ImagePath.debitCard,
                        height: ResponsiveFlutter.of(context).moderateScale(20),
                        color: appColors.lightColor,
                      ),
                      SizedBox(
                        width: ResponsiveFlutter.of(context).moderateScale(12),
                      ),
                      MyTextView(
                        Strings.debitCard,
                        textAligntNew: TextAlign.center,
                        styleNew: MyTextStyle(
                          colorNew: appColors.lightColor,
                          fontWeightNew: FontWeight.w600,
                          size: ResponsiveFlutter.of(context).fontSize(2.2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(20),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        ResponsiveFlutter.of(context).moderateScale(20)),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextView(
                          Strings.addAmount,
                          textAligntNew: TextAlign.center,
                          styleNew: MyTextStyle(
                            colorNew: appColors.transactionText,
                            fontWeightNew: FontWeight.w400,
                            size: ResponsiveFlutter.of(context).fontSize(1.8),
                          ),
                        ),
                        SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(5),
                        ),
                        commonTestField(
                          context: context,
                          hintText: Strings.addAmountHint,
                          icon: false,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(10),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).verticalScale(50),
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          ResponsiveFlutter.of(context).moderateScale(20),
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 1.5,
                      ),
                    ),
                    child: DropdownButton(
                      value: dropDownValue,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: appColors.lightPinkColor,
                      ),
                      style: MyTextStyle(
                        colorNew: appColors.lightColor,
                        fontWeightNew: FontWeight.w400,
                        size: ResponsiveFlutter.of(context).fontSize(1.8),
                      ),
                      iconSize: ResponsiveFlutter.of(context).moderateScale(30),
                      isExpanded: true,
                      dropdownColor: appColors.appLightColor,
                      borderRadius: BorderRadius.circular(
                          ResponsiveFlutter.of(context).moderateScale(20)),
                      underline: Container(),
                      alignment: Alignment.bottomCenter,
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          alignment: Alignment.centerLeft,
                          child: MyTextView(
                            items,
                            textAligntNew: TextAlign.center,
                            styleNew: MyTextStyle(
                              colorNew: appColors.lightColor,
                              fontWeightNew: FontWeight.w500,
                              size: ResponsiveFlutter.of(context).fontSize(2),
                            ),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          dropDownValue = value.toString();
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(10),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        ResponsiveFlutter.of(context).moderateScale(20)),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextView(
                          Strings.cardHolderName,
                          textAligntNew: TextAlign.center,
                          styleNew: MyTextStyle(
                            colorNew: appColors.transactionText,
                            fontWeightNew: FontWeight.w400,
                            size: ResponsiveFlutter.of(context).fontSize(1.8),
                          ),
                        ),
                        SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(5),
                        ),
                        commonTestField(
                          context: context,
                          hintText: Strings.enterCardHolderName,
                          icon: false,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(10),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        ResponsiveFlutter.of(context).moderateScale(20)),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      border: Border.all(
                        color: appColors.borderColor,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(20),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextView(
                          Strings.cardNumber,
                          textAligntNew: TextAlign.center,
                          styleNew: MyTextStyle(
                            colorNew: appColors.transactionText,
                            fontWeightNew: FontWeight.w400,
                            size: ResponsiveFlutter.of(context).fontSize(1.8),
                          ),
                        ),
                        SizedBox(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(5),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: commonTestField(
                                context: context,
                                hintText: Strings.enterCardNumber,
                                icon: false,
                                keyboardType: TextInputType.number,
                              ),
                            ),
                            Image.asset(
                              ImagePath.masterCard,
                              height: ResponsiveFlutter.of(context)
                                  .moderateScale(25),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(10),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              ResponsiveFlutter.of(context).moderateScale(20)),
                          decoration: BoxDecoration(
                            color: appColors.appLightColor,
                            border: Border.all(
                              color: appColors.borderColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(
                              ResponsiveFlutter.of(context).moderateScale(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextView(
                                Strings.expiryDate,
                                textAligntNew: TextAlign.center,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.transactionText,
                                  fontWeightNew: FontWeight.w400,
                                  size: ResponsiveFlutter.of(context)
                                      .fontSize(1.8),
                                ),
                              ),
                              SizedBox(
                                height: ResponsiveFlutter.of(context)
                                    .moderateScale(5),
                              ),
                              commonTestField(
                                context: context,
                                hintText: Strings.enterExpiryDate,
                                icon: false,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: ResponsiveFlutter.of(context).moderateScale(10),
                      ),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              ResponsiveFlutter.of(context).moderateScale(20)),
                          decoration: BoxDecoration(
                            color: appColors.appLightColor,
                            border: Border.all(
                              color: appColors.borderColor,
                              width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(
                              ResponsiveFlutter.of(context).moderateScale(20),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextView(
                                Strings.cvv,
                                textAligntNew: TextAlign.center,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.transactionText,
                                  fontWeightNew: FontWeight.w400,
                                  size: ResponsiveFlutter.of(context)
                                      .fontSize(1.8),
                                ),
                              ),
                              SizedBox(
                                height: ResponsiveFlutter.of(context)
                                    .moderateScale(5),
                              ),
                              commonTestField(
                                context: context,
                                hintText: Strings.enterCvv,
                                icon: false,
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(20),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddWalletSuccessScreen(),
                        ),
                      );
                    },
                    child: commonButton(
                      context: context,
                      title: Strings.add,
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(15),
                  ),
                  MyTextView(
                    Strings.or,
                    textAligntNew: TextAlign.center,
                    styleNew: MyTextStyle(
                      colorNew: appColors.transactionText,
                      fontWeightNew: FontWeight.w400,
                      size: ResponsiveFlutter.of(context).fontSize(1.8),
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(15),
                  ),
                  Container(
                    height: ResponsiveFlutter.of(context).scale(45),
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            ResponsiveFlutter.of(context).moderateScale(30)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        ResponsiveFlutter.of(context).moderateScale(30),
                      ),
                      border: Border.all(
                        width: 1,
                        color: appColors.white,
                      ),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          ImagePath.paypal,
                          height:
                              ResponsiveFlutter.of(context).moderateScale(22),
                        ),
                        SizedBox(
                          width:
                              ResponsiveFlutter.of(context).moderateScale(15),
                        ),
                        MyTextView(
                          Strings.payPal,
                          textAligntNew: TextAlign.center,
                          styleNew: MyTextStyle(
                            colorNew: appColors.lightColor,
                            fontWeightNew: FontWeight.w600,
                            size: ResponsiveFlutter.of(context).fontSize(2.2),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: ResponsiveFlutter.of(context).moderateScale(50),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
