import 'package:attendify/features/common/repository/shared_pref.dart';
import 'package:attendify/features/firebase/models/app_user.dart';
import 'package:attendify/features/create_new/screens/new_event_name_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common/app_colors.dart';

class CreateScreen extends ConsumerStatefulWidget {
  const CreateScreen({super.key});

  @override
  _CreateScreenState createState() => _CreateScreenState();
}

class _CreateScreenState extends ConsumerState<CreateScreen> {
  AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    Future<AppUser> getUserName =
        ref.read(sharedprefProvider).readCurrentUser();
    return SafeArea(
      child: Scaffold(
          body: Container(
        width: double.infinity,
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FutureBuilder<AppUser>(
                future: getUserName,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return Text(
                        "Hi ${snapshot.data?.firstName ?? ""} \nWhat do you want to create?",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    }
                  }

                  return const Text(
                    "Hi Paolo ! \nWhat do you want to create?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NewEventName(),
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
              const SizedBox(height: 40),
            ],
          ),
        ),
      )),
    );
  }
}

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 24,
    fontFamily: 'Montserrat',
    color: Colors.white,
  );

  static const TextStyle subHeading = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    fontFamily: 'Montserrat',
    color: Colors.white,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    fontFamily: 'Montserrat',
    color: Colors.white,
  );
}
