import 'package:attendify/features/firebase/controller/firebase_auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../responsive/responsive_flutter.dart';
import '../../common/app_colors.dart';
import '../../common/image_path.dart';

class PhoneNumberScreen extends ConsumerStatefulWidget {
  static const String routeName = "phone_number_screen";
  const PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PhoneNumberScreen> createState() => PhoneNumberScreenState();
}

class PhoneNumberScreenState extends ConsumerState<PhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: PhoneNumberInputPage(),
    );
  }
}

class PhoneNumberInputPage extends ConsumerStatefulWidget {
  const PhoneNumberInputPage({super.key});

  @override
  PhoneNumberInputPageState createState() => PhoneNumberInputPageState();
}

class PhoneNumberInputPageState extends ConsumerState<PhoneNumberInputPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'NG';
  PhoneNumber number1 = PhoneNumber(isoCode: 'FR');
  bool isValidPhoneNumber = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().appMediumColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: ResponsiveFlutter.of(context).verticalScale(40)),
              Image.asset(
                ImagePath.logo,
                height: ResponsiveFlutter.of(context).verticalScale(30),
              ),
              Container(
                height: ResponsiveFlutter.of(context).verticalScale(300),
                padding: EdgeInsets.symmetric(
                    horizontal:
                        ResponsiveFlutter.of(context).moderateScale(25)),
                child: Image.asset(
                  ImagePath.mailSent,
                  alignment: Alignment.bottomCenter,
                ),
              ),
              Form(
                child: SizedBox(
                  height: ResponsiveFlutter.of(context).moderateScale(300),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(
                            ResponsiveFlutter.of(context).moderateScale(10)),
                        child: InternationalPhoneNumberInput(
                          hintText: "Enter your phone here",
                          textStyle: TextStyle(color: AppColors().lightColor),
                          textAlign: TextAlign.center,
                          onInputChanged: (PhoneNumber number) {
                            print(number.phoneNumber);
                            number1 = number;
                          },
                          onInputValidated: (bool value) {
                            print("on Input valid $value");
                            isValidPhoneNumber = value;
                          },
                          selectorConfig: const SelectorConfig(
                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                          ),
                          ignoreBlank: false,
                          inputDecoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.purpleAccent), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  width: 2,
                                  color: Colors.purpleAccent), //<-- SEE HERE
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          cursorColor: Colors.white,
                          selectorTextStyle:
                              const TextStyle(color: Colors.white),
                          initialValue: number1,
                          textFieldController: controller,
                          formatInput: false,
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: const OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: const ButtonStyle(
                            elevation: MaterialStatePropertyAll(15)),
                        onPressed: () {
                          if (isValidPhoneNumber) {
                            ref
                                .read(firebaseAutheControllerProvider)
                                .signInWithPhone(
                                    number1.phoneNumber ?? "", context);
                          }
                        },
                        child: const Text('Send SMS verification'),
                      ),
                      SizedBox(
                        height:
                            ResponsiveFlutter.of(context).moderateScale(120),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                          child: Text(
                            "Verify later",
                            style: TextStyle(
                              color: AppColors().lightColor,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors().lightColor,
                              decorationThickness: 4,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'US');

    setState(() {
      number1 = number1;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
