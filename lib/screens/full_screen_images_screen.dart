import 'package:flutter/material.dart';

class FullScreenImage extends StatefulWidget {
  final String imageAsset;

  FullScreenImage({required this.imageAsset});

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}
class _FullScreenImageState extends State<FullScreenImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          widget.imageAsset,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}