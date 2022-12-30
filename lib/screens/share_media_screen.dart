import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageViewScreen extends StatelessWidget {


  ImageViewScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image View'),
      ),
      body: Center(
        child:Text("test"),
      ),
    );
  }
}
