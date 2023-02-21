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

  bool _showInfo = false;

  int _currentQuestionIndex = 0;


  List<QuestionBase> _questions = [    Question(      "What is the scope of your event?",      ["Public", "Friends only", "Private"],
    [1, 2, 2],"If you choose 'private', only invited members \n will be able to join your event",

  ),
    Question(
      "What type of validation do you choose?",
      ["I accept everyone", "I choose who I accept"],
      [2,2],"This will limit who can join your event"
    ),
    TextQuestion("How many people minimum ?",[3, 3],"If your event is paying, it may be interesting \nto put a minimum to be profitable."),
    TextQuestion("How many people maximum ?",[4,4],"Make sure you don't get overwhelmed by the events ;)"),
    TextQuestion("Price of the event ?",[4,4],"Your event can absolutely be free."),
  ];




  @override
  Widget build(BuildContext context) {
    bool isAnswerSelected = _questions[_currentQuestionIndex].selectedIndex != null;

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
                              children: [Text(_questions[_currentQuestionIndex].text),
                                if (_questions[_currentQuestionIndex] is Question)
                                  Column(
                                    children: (_questions[_currentQuestionIndex] as Question)
                                        .answers
                                        .asMap()
                                        .entries
                                        .map(
                                          (entry) => RadioListTile(
                                        title: Text(entry.value),
                                        value: entry.key,
                                        groupValue:
                                        (_questions[_currentQuestionIndex] as Question).selectedIndex,
                                        onChanged: (value) {
                                          setState(() {
                                            (_questions[_currentQuestionIndex] as Question).selectedIndex =
                                                int.parse(value.toString());
                                          });
                                        },
                                      ),
                                    )
                                        .toList(),
                                  ),
                                if (_questions[_currentQuestionIndex] is TextQuestion)
                                  TextField(
                                    decoration: InputDecoration(labelText: "Enter your answer"),
                                    onChanged: (value) {
                                      // TODO: Save the user's answer
                                    },
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
                                            child: Column(
                                              children: [
                                                Text(
                                                  _questions[_currentQuestionIndex].info ?? "",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                  ),
                                                  textAlign: TextAlign.center,
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
                                                if (_questions[_currentQuestionIndex].getNextQuestionIndex() != -1) {
                                                  // Revenir à la première question ayant une question précédente
                                                  int firstIndex = 0;
                                                  for (int i = 0; i < _currentQuestionIndex; i++) {
                                                    if (_questions[i].getNextQuestionIndex() != -1) {
                                                      firstIndex = i;
                                                      break;
                                                    }
                                                  }
                                                  _currentQuestionIndex = firstIndex;
                                                } else {
                                                  // Revenir à la première question de la liste
                                                  _currentQuestionIndex = 0;
                                                }
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
                                            // Vérifier si au moins une réponse est sélectionnée
                                            bool isAnswerSelected = _questions[_currentQuestionIndex].selectedIndex != -1;

                                            if (isAnswerSelected) {
                                              setState(() {
                                                int nextQuestionIndex = _questions[_currentQuestionIndex].getNextQuestionIndex();

                                                if (nextQuestionIndex != -1) {
                                                  _currentQuestionIndex = nextQuestionIndex;
                                                } else if (_currentQuestionIndex < _questions.length - 1) {
                                                  _currentQuestionIndex++;
                                                } else {
                                                  // Passer à la page suivante
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => NewEventsPicture()),
                                                  );
                                                }
                                              });
                                            } else {
                                              // Afficher un message d'erreur si aucune réponse n'est sélectionnée
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text('Veuillez sélectionner une réponse'),
                                                  duration: Duration(seconds: 2),
                                                ),
                                              );
                                            }
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
abstract class QuestionBase {
  final String text;
  final String info;
  int _selectedIndex = 0;

  QuestionBase(this.text,this.info);

  int get selectedIndex => _selectedIndex;
  set selectedIndex(int value) {
    _selectedIndex = value;
  }

  int getNextQuestionIndex() {
    return -1;
  }
}

class Question extends QuestionBase {
  final List<String> answers;
  final List<int> _nextQuestionIndexes;

  Question(String text, this.answers, this._nextQuestionIndexes,String info)
      : super(text,info);

  @override
  int getNextQuestionIndex() {
    if (_nextQuestionIndexes == null || _nextQuestionIndexes.isEmpty) {
      return -1;
    } else {
      return _nextQuestionIndexes[selectedIndex];
    }
  }
}

class TextQuestion extends QuestionBase {
  final List<int> _nextQuestionIndexes;

  TextQuestion(String text, this._nextQuestionIndexes, String info)
      : super(text,info);

  @override
  int getNextQuestionIndex() {
    if (_nextQuestionIndexes == null || _nextQuestionIndexes.isEmpty) {
      return -1;
    } else {
      return _nextQuestionIndexes[selectedIndex];
    }
  }
}








