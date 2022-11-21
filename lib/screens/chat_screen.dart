import 'package:attendify/features/common/app_colors.dart';
import 'package:attendify/features/common/common_widget.dart';
import 'package:attendify/features/common/image_path.dart';
import 'package:attendify/features/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:attendify/screens/all_friends_screen.dart';
import 'package:attendify/screens/friends_screen.dart';
import 'package:attendify/screens/invite_friends_screen.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  AppColors appColors = AppColors();
  TabController? tabController;
  int tab = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: appColors.appMediumColor,
          body: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
