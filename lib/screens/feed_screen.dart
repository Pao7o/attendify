import 'package:attendify/common/app_colors.dart';
import 'package:attendify/common/common_widget.dart';
import 'package:attendify/common/image_path.dart';
import 'package:attendify/common/strings.dart';
import 'package:attendify/responsive/responsive_flutter.dart';
import 'package:flutter/material.dart';

import 'events_publication.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({Key? key}) : super(key: key);
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  AppColors appColors = AppColors();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: AppColors().appMediumColor,
        body: Stack(
          children: [
            EventsPublications()
          ],
        ),
      ),

    );
  }
}

