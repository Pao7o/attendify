import 'dart:io';

import 'package:attendify/screens/location_map.dart';
import 'package:flutter/material.dart';


class ShareMedia extends StatefulWidget {
  const ShareMedia({Key? key}) : super(key: key);

  @override
  State<ShareMedia> createState() => _ShareMediaState();
}

class _ShareMediaState extends State<ShareMedia> {
  File? imgFile;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShareMediaScreen(),
    );
  }
}

class ShareMediaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Share media'),
      ),
      body: Container(
        width: 500,
        height: 500,

      ),
    );
  }
}
