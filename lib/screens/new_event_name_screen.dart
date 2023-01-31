import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../features/common/app_colors.dart';
import '../responsive/responsive_flutter.dart';
import 'new_event_date_screen.dart';

class NewEventName extends StatefulWidget {
  @override
  _NewEventNameState createState() => _NewEventNameState();
}

class _NewEventNameState extends State<NewEventName> {
  AppColors appColors = AppColors();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(statusBarColor:appColors.appMediumColor),
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
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
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "New event",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Image.asset('assets/images/calendar_create.png'),
                          Text(
                            "Event name :",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'OpenSans',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: _controller,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter a name";
                                  }
                                  if (value.length > 30) {
                                    return "name must be less than 30 characters";
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
                                  prefixIcon: Icon(Icons.cake),
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
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: MaterialButton(
                                color: Colors.green[400],
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation, secondaryAnimation) => NewEventDate(eventName: _controller.text),
                                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                          return SharedAxisTransition(
                                            child: child,
                                            animation: animation,
                                            transitionType: SharedAxisTransitionType.horizontal,
                                            secondaryAnimation: secondaryAnimation,

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
                                      padding: const EdgeInsets.only(left: 65.0),
                                      child: Text(
                                        "Continue",
                                        style: TextStyle(
                                            color: appColors.lightColor,
                                            fontSize:
                                                ResponsiveFlutter.of(context)
                                                    .fontSize(2)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Icon(Icons.arrow_forward,
                                        color: appColors.lightColor)
                                  ],

                                )),
                          ),
                          SizedBox(height: 40,),
                          SizedBox(
                            width: 250,
                            height: 50,
                            child: MaterialButton(
                                color: Colors.red[800],
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                    side: BorderSide(color: Colors.black)),
                                onPressed: () {
                                  Navigator.pop(context);
                                },

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(Icons.arrow_back,
                                        color: appColors.lightColor),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 35.0),
                                      child: Text(
                                        "Back",
                                        style: TextStyle(
                                            color: appColors.lightColor,
                                            fontSize:
                                            ResponsiveFlutter.of(context)
                                                .fontSize(2)),
                                      ),
                                    ),
                                    SizedBox(width: 80,)
                                  ],

                                )),

                          ),
                          SizedBox(height: 40,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:84),
                            child: Stack(
                              children: [
                                LinearProgressIndicator(
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                                  value: 0.0,
                                ),

                                Container(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
