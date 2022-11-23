import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/constants.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/payment_successed_screen.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  AppColors appColors = AppColors();
  TextEditingController? cardHolderName = TextEditingController();

  bool? check = true;
  int? count = 1;

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
            Stack(
              children: [
                Container(
                  height: ResponsiveFlutter.of(context).verticalScale(125),
                  width: double.infinity,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                    vertical: ResponsiveFlutter.of(context).moderateScale(30),
                  ),
                  decoration: BoxDecoration(
                    color: appColors.appDarkColor,
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
                      MyTextView(
                        Strings.tickets,
                        textAligntNew: TextAlign.center,
                        styleNew: MyTextStyle(
                          colorNew: appColors.lightColor,
                          fontWeightNew: FontWeight.w600,
                          size: ResponsiveFlutter.of(context).fontSize(2.8),
                        ),
                      ),
                      const Spacer(),
                      Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          Container(
                            height:
                                ResponsiveFlutter.of(context).moderateScale(35),
                            width:
                                ResponsiveFlutter.of(context).moderateScale(70),
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(
                                horizontal: ResponsiveFlutter.of(context)
                                    .moderateScale(10)),
                            decoration: BoxDecoration(
                              color: appColors.appMediumColor,
                              borderRadius: BorderRadius.circular(
                                ResponsiveFlutter.of(context).moderateScale(25),
                              ),
                            ),
                            child: MyTextView(
                              count!.toString(),
                              textAligntNew: TextAlign.center,
                              styleNew: MyTextStyle(
                                colorNew: appColors.lightColor,
                                fontWeightNew: FontWeight.w600,
                                size: ResponsiveFlutter.of(context).fontSize(2),
                              ),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  if (count != 1) {
                                    count = count! - 1;
                                  }
                                  setState(() {});
                                },
                                child: Container(
                                  height: ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                  width: ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Constants.darkTheme
                                        ? appColors.appDarkColor
                                        : appColors.btnColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: appColors.btnColor,
                                      width: 3,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.remove,
                                    size: ResponsiveFlutter.of(context)
                                        .moderateScale(13),
                                    color: appColors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                  width: ResponsiveFlutter.of(context)
                                      .moderateScale(50)),
                              GestureDetector(
                                onTap: () {
                                  count = count! + 1;
                                  setState(() {});
                                },
                                child: Container(
                                  height: ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                  width: ResponsiveFlutter.of(context)
                                      .moderateScale(20),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: appColors.btnColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add,
                                    size: ResponsiveFlutter.of(context)
                                        .moderateScale(15),
                                    color: appColors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                commonAppBar(
                  context: context,
                  backArrow: true,
                  appBarColor: appColors.appDarkColor,
                  title: Strings.checkout,
                ),
              ],
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  vertical: ResponsiveFlutter.of(context).moderateScale(20),
                  horizontal: ResponsiveFlutter.of(context).moderateScale(20),
                ),
                children: [
                  Row(
                    children: [
                      Image.asset(
                        ImagePath.debitCard,
                        color: appColors.lightColor,
                        height: ResponsiveFlutter.of(context).moderateScale(17),
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
                      height: ResponsiveFlutter.of(context).moderateScale(20)),
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
                              fontWeightNew: FontWeight.w600,
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
                      height: ResponsiveFlutter.of(context).moderateScale(10)),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        ResponsiveFlutter.of(context).moderateScale(20)),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      border: Border.all(
                        color: appColors.borderColor,
                        width: ResponsiveFlutter.of(context).moderateScale(1.5),
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
                            fontWeightNew: FontWeight.w500,
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
                          keyboardType: TextInputType.number,
                          icon: false,
                          controller: cardHolderName,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: ResponsiveFlutter.of(context).moderateScale(10)),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(
                        ResponsiveFlutter.of(context).moderateScale(20)),
                    decoration: BoxDecoration(
                      color: appColors.appLightColor,
                      border: Border.all(
                        color: appColors.borderColor,
                        width: ResponsiveFlutter.of(context).moderateScale(1.5),
                      ),
                      borderRadius: BorderRadius.circular(
                          ResponsiveFlutter.of(context).moderateScale(20)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextView(
                          Strings.cardNumber,
                          textAligntNew: TextAlign.center,
                          styleNew: MyTextStyle(
                            colorNew: appColors.transactionText,
                            fontWeightNew: FontWeight.w500,
                            size: ResponsiveFlutter.of(context).fontSize(1.8),
                          ),
                        ),
                        SizedBox(
                            height:
                                ResponsiveFlutter.of(context).moderateScale(5)),
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
                      height: ResponsiveFlutter.of(context).moderateScale(10)),
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
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(1.5),
                            ),
                            borderRadius: BorderRadius.circular(
                                ResponsiveFlutter.of(context)
                                    .moderateScale(20)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextView(
                                Strings.expiryDate,
                                textAligntNew: TextAlign.center,
                                styleNew: MyTextStyle(
                                  colorNew: appColors.transactionText,
                                  fontWeightNew: FontWeight.w500,
                                  size: ResponsiveFlutter.of(context)
                                      .fontSize(1.8),
                                ),
                              ),
                              SizedBox(
                                  height: ResponsiveFlutter.of(context)
                                      .moderateScale(5)),
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
                          width:
                              ResponsiveFlutter.of(context).moderateScale(10)),
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.all(
                              ResponsiveFlutter.of(context).moderateScale(20)),
                          decoration: BoxDecoration(
                            color: appColors.appLightColor,
                            border: Border.all(
                              color: appColors.borderColor,
                              width: ResponsiveFlutter.of(context)
                                  .moderateScale(1.5),
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
                                      .moderateScale(5)),
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
                      height: ResponsiveFlutter.of(context).moderateScale(15)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            check = !check!;
                          });
                        },
                        child: Container(
                          height:
                              ResponsiveFlutter.of(context).moderateScale(25),
                          width:
                              ResponsiveFlutter.of(context).moderateScale(25),
                          decoration: BoxDecoration(
                            color: appColors.appMediumColor,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: appColors.lightPinkColor,
                              width: 2,
                            ),
                          ),
                          child: check!
                              ? Image.asset(
                                  ImagePath.check,
                                  fit: BoxFit.cover,
                                )
                              : Container(),
                        ),
                      ),
                      SizedBox(
                          width:
                              ResponsiveFlutter.of(context).moderateScale(10)),
                      MyTextView(
                        Strings.saveYourCard,
                        textAligntNew: TextAlign.center,
                        styleNew: MyTextStyle(
                          colorNew: appColors.lightColor,
                          fontWeightNew: FontWeight.w500,
                          size: ResponsiveFlutter.of(context).fontSize(2),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      height: ResponsiveFlutter.of(context).moderateScale(20)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentSuccessedScreen(),
                        ),
                      );
                    },
                    child: commonButton(
                      context: context,
                      title: Strings.pay,
                    ),
                  ),
                  SizedBox(
                      height: ResponsiveFlutter.of(context).moderateScale(15)),
                  MyTextView(
                    Strings.or,
                    textAligntNew: TextAlign.center,
                    styleNew: MyTextStyle(
                      colorNew: appColors.transactionText,
                      fontWeightNew: FontWeight.w500,
                      size: ResponsiveFlutter.of(context).fontSize(1.6),
                    ),
                  ),
                  SizedBox(
                      height: ResponsiveFlutter.of(context).moderateScale(15)),
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
                        width: ResponsiveFlutter.of(context).moderateScale(1.5),
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
                            width: ResponsiveFlutter.of(context)
                                .moderateScale(15)),
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
                      height: ResponsiveFlutter.of(context).moderateScale(20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
