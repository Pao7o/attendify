import 'package:attendify/features/authentication/screens/phone_verification_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../responsive/responsive_flutter.dart';
import '../../../screens/bottom_bar_screen.dart';
import '../../common/app_colors.dart';
import '../../common/image_path.dart';
class PhoneNumbers extends StatefulWidget {
  const PhoneNumbers({Key? key}) : super(key: key);

  @override
  State<PhoneNumbers> createState() => _PhoneNumbersState();
}

class _PhoneNumbersState extends State<PhoneNumbers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PhoneNumberInputPage(),
    );
  }
}

class PhoneNumberInputPage extends StatefulWidget {
  @override
  _PhoneNumberInputPageState createState() => _PhoneNumberInputPageState();
}

class _PhoneNumberInputPageState extends State<PhoneNumberInputPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number1 = PhoneNumber(isoCode: 'FR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().appMediumColor,
      body: Column(
        children: [
          SizedBox(
              height: ResponsiveFlutter.of(context)
                  .verticalScale(40)),
          Image.asset(
            ImagePath.logo,
            height: ResponsiveFlutter.of(context)
                .verticalScale(30),
          ),
          Container(
            height: ResponsiveFlutter.of(context)
                .verticalScale(300),
            padding: EdgeInsets.symmetric(
                horizontal: ResponsiveFlutter.of(context)
                    .moderateScale(25)),
            child: Image.asset(
              ImagePath.mailSent,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Form(
            child: Container(
              height: ResponsiveFlutter.of(context).moderateScale(300),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding:  EdgeInsets.all(ResponsiveFlutter.of(context).moderateScale(10)),
                    child: InternationalPhoneNumberInput(hintText: "Enter your phone here",
                      textStyle: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                      ),
                      ignoreBlank: false,
                      inputDecoration: InputDecoration(enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 2, color: Colors.purpleAccent), //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),),
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.white),
                      initialValue: number1,
                      textFieldController: controller,
                      formatInput: false,
                      keyboardType:
                      TextInputType.numberWithOptions(signed: true, decimal: true),
                      inputBorder: OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
                  ElevatedButton(
                    style: ButtonStyle(elevation: MaterialStatePropertyAll(15)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmailVerificationScreen(),
                        ),
                      );
                    },
                    child: Text('Send SMS verification'),
                  ),

                  SizedBox(height:ResponsiveFlutter.of(context).moderateScale(120) ,),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      child: Text("Verify later",style: TextStyle(color: Colors.white70,decoration:
                      TextDecoration.underline,
                        decorationColor: Colors.white70,decorationThickness: 4,),),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                            const BottomBarScreen(),
                          ),
                              (route) => false,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),),
        ],
      ),

    );
  }
  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
    await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      this.number1 = number1;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}