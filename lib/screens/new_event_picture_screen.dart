import 'package:flutter/material.dart';

class NewEventsPicture extends StatefulWidget {
  @override
  _NewEventsPictureState createState() => _NewEventsPictureState();
}

class _NewEventsPictureState extends State<NewEventsPicture> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Event Picture'),
      ),
      body: Container(
        child: Center(
          child: Text('Add a new event picture'),
        ),
      ),
    );
  }
}
