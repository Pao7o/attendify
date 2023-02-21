import 'package:attendify/screens/create_event_screen.dart';
import 'package:attendify/screens/new_event_name_screen.dart';
import 'package:flutter/material.dart';

import '../../common/app_colors.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
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
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Hi Paolo ! \nWhat do you want to create?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 40),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewEventName(),
                          ),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.purple[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.event,
                              size: 50,
                              color: Colors.purple,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "New Event",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.purple[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.create,
                              size: 50,
                              color: Colors.purple,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "New Post",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 200,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.purple[50],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.group,
                              size: 50,
                              color: Colors.purple,
                            ),
                            SizedBox(height: 10),
                            Text(
                              "New Group",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.purple,
                                fontSize: 30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppTextStyles {
  static final TextStyle heading = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    fontFamily: 'Montserrat',
    color: Colors.white,
  );

  static final TextStyle subHeading = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    fontFamily: 'Montserrat',
    color: Colors.white,
  );

  static final TextStyle body = const TextStyle(
    fontSize: 16,
    fontFamily: 'Montserrat',
    color: Colors.white,
  );
}
