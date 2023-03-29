import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/app_colors.dart';
import '../../../responsive/responsive_flutter.dart';
import 'new_event_date_screen.dart';

class NewEventName extends StatefulWidget {
  const NewEventName({super.key});

  @override
  NewEventNameState createState() => NewEventNameState();
}

class NewEventNameState extends State<NewEventName> {
  AppColors appColors = AppColors();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light
          .copyWith(statusBarColor: appColors.appMediumColor),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF2F2644),
                        Color(0xFF4B4E69),
                        Color(0xFF8B81A4),
                      ],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Create a New event",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Image.asset('assets/images/calendar_create.png'),
                          const Text(
                            "Event name :",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: _controller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter an event name";
                                  }
                                  if (value.length > 30) {
                                    return "Event name must be less than 30 characters";
                                  }
                                  if (!RegExp(r"^[a-zA-Z0-9._ ]+$")
                                      .hasMatch(value)) {
                                    return "Username can only contain letters, numbers, '.' and '_'";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide.none),
                                  hintText: 'Event name',
                                  prefixIcon: const Icon(Icons.cake),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: ResponsiveFlutter.of(context)
                                          .fontSize(1.5)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: MaterialButton(
                                color: appColors.btnColor,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side:
                                        const BorderSide(color: Colors.black)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            NewEventDate(
                                                eventName: _controller.text),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          return SharedAxisTransition(
                                            animation: animation,
                                            transitionType:
                                                SharedAxisTransitionType
                                                    .horizontal,
                                            secondaryAnimation:
                                                secondaryAnimation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    );
                                  }
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 65.0),
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(
                                            color: appColors.lightColor,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
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
                          const SizedBox(
                            height: 40,
                          ),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: MaterialButton(
                                color: appColors.blurBtnColor,
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side:
                                        const BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.arrow_back,
                                        color: appColors.lightColor),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 35.0),
                                      child: Text(
                                        "Back",
                                        style: TextStyle(
                                            color: appColors.lightColor,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(2)),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 80,
                                    )
                                  ],
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 84),
                            child: Stack(
                              children: [
                                LinearProgressIndicator(
                                  backgroundColor: Colors.grey[200],
                                  valueColor:
                                      const AlwaysStoppedAnimation<Color>(
                                          Colors.purple),
                                  value: 0.0,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  child: const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text('0%'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
