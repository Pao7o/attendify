import 'package:attendify/screens/new_event_picture_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../responsive/responsive_flutter.dart';
import 'contacts_screen.dart';

class NewEventsDetails extends StatefulWidget {
  const NewEventsDetails({Key? key}) : super(key: key);

  @override
  State<NewEventsDetails> createState() => _NewEventsDetailsState();
}

class _NewEventsDetailsState extends State<NewEventsDetails>with SingleTickerProviderStateMixin {
  int _radioValue = 0;
  bool _showInfo = false;

  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }


  void _handleRadioValueChange(int? value) {
    if (value != null) {
      setState(() {
        _radioValue = value;
      });
    }
  }

  int _currentQuestionIndex = 0;
  List<Question> _questions = [
    Question("What is the scope of your event ?", ["Public", "Friends only", "Private"]),
    Question("What is your favorite animal?", ["Dog", "Cat", "Bird"]),
    Question("What is your favorite food?", ["Pizza", "Burger", "Sushi"]),
  ];

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
                          textAlign: TextAlign.center,
                          "Here are some questions about your event...",
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
                        Image.asset('assets/images/new_event_date.png'),
                        Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                            side: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.0,
                            ),
                          ),
                          margin: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          elevation: 4,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                SlideTransition(
                                    position: Tween<Offset>(
                                      begin: const Offset(1, 0),
                                      end: Offset.zero,
                                    ).animate(_animationController),
                                    child: Text(_questions[_currentQuestionIndex].text)),
                                Column(
                                  children: _questions[_currentQuestionIndex]
                                      .answers
                                      .asMap()
                                      .entries
                                      .map((entry) => RadioListTile(
                                            title: Text(entry.value),
                                            value: entry.key,
                                            groupValue: _questions[
                                                    _currentQuestionIndex]
                                                .selectedIndex,
                                            onChanged: (value) {
                                              setState(() {
                                                _questions[_currentQuestionIndex]
                                                        .selectedIndex =
                                                    int.parse(value.toString());
                                              });
                                            },
                                          ))
                                      .toList(),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        Icons.info,
                                        size: 30,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _showInfo = !_showInfo;
                                        });
                                      },
                                    ),
                                    _showInfo
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.black.withOpacity(0.7),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                            margin: EdgeInsets.only(top: 8.0),
                                            padding: EdgeInsets.all(8.0),
                                            child: Wrap(
                                              children: [
                                                Text(
                                                  "If you choose 'private', only invited members \n will be able to join your event",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                                  maxLines: 2,
                                                  softWrap: true,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(
                                      width: 150,
                                      height: 50,
                                      child: MaterialButton(
                                          color: Colors.red[800],
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              side: BorderSide(
                                                  color: Colors.black)),
                                          onPressed: () {
                                            setState(() {
                                              if (_currentQuestionIndex > 0) {
                                                _currentQuestionIndex--;
                                                _animationController.reverse();

                                              } else {
                                                // If this is the first question, exit the screen
                                                Navigator.pop(context);
                                              }
                                            });

                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Icon(Icons.arrow_back,
                                                  color: appColors.lightColor),
                                              SizedBox(
                                                width: 30,
                                              ),
                                              Text(
                                                "Back",
                                                style: TextStyle(
                                                    color: appColors.lightColor,
                                                    fontSize:
                                                        ResponsiveFlutter.of(
                                                                context)
                                                            .fontSize(2)),
                                              ),
                                            ],
                                          )),
                                    ),
                                    SizedBox(
                                      width: 150,
                                      height: 50,
                                      child: MaterialButton(
                                          color: Colors.green[400],
                                          elevation: 10,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                              side: BorderSide(
                                                  color: Colors.black)),
                                          onPressed: () {
                                            setState(() {
                                              if (_currentQuestionIndex < _questions.length - 1) {
                                                _currentQuestionIndex++;
                                                _animationController.forward(from: 0.0);
                                              } else {
                                                 Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) => NewEventsPicture()),
                                              );
                                              }
                                            });
                                          },

                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                "Continue",
                                                style: TextStyle(
                                                    color: appColors.lightColor,
                                                    fontSize:
                                                        ResponsiveFlutter.of(
                                                                context)
                                                            .fontSize(2)),
                                              ),
                                              Icon(Icons.arrow_forward,
                                                  color: appColors.lightColor)
                                            ],
                                          )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> answers;
  int selectedIndex = -1;

  Question(this.text, this.answers);
}
