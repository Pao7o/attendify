import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../features/common/app_colors.dart';
import '../features/common/common_widget.dart';
import '../features/common/image_path.dart';
import '../features/common/strings.dart';
import '../responsive/responsive_flutter.dart';
import 'chat_screen.dart';
import 'edit_event_screen.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({Key? key}) : super(key: key);

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}
class Filters {
  final String? name;

  Filters({this.name});
}

List<Filters> userList = [
  Filters(name: "Techno",),
  Filters(name: "Rap",),
  Filters(name: "Free-party",),
  Filters(name: "Electro",),
  Filters(name: "Home-party",),
  Filters(name: "Board game",),
  Filters(name: "Nightclub",),
  Filters(name: "Bar",),
  Filters(name: "Disguised",),
  Filters(name: "Dancehall",),
  Filters(name: "Zouk",),
  Filters(name: "Festival",),
  Filters(name: "Concert",),
  Filters(name: "Afterwork",),
  Filters(name: "Students",),
  Filters(name: "School Events",),
  Filters(name: "Pop",),
  Filters(name: "Rock",),
  Filters(name: "Salsa",),
  Filters(name: "Reggae",),
  Filters(name: "Dub",),
  Filters(name: "Reggaeton",),
  Filters(name: "80's",),
  Filters(name: "90's",),
  Filters(name: "2000's",),
];


class _ClubsScreenState extends State<ClubsScreen> {
  AppColors appColors = AppColors();
  ImagePath imagePath = ImagePath();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      top: false,
      child: Scaffold(
        backgroundColor: appColors.appMediumColor,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
