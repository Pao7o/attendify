import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';

class FullScreenImage extends StatefulWidget {
  final List<String> imageAssets;
  final int initialIndex;

  FullScreenImage({required this.imageAssets, required this.initialIndex});

  @override
  _FullScreenImageState createState() => _FullScreenImageState();
}


class _FullScreenImageState extends State<FullScreenImage> {
  PageController _pageController= PageController(initialPage: 0);


  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PhotoViewGallery.builder(
          pageController: _pageController,
          itemCount: widget.imageAssets.length,
          builder: (context, index) {
            return PhotoViewGalleryPageOptions(
              imageProvider: AssetImage(widget.imageAssets[index]),
            );
          },
        ),
      ),
    );
  }
}
