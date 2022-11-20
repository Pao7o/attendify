import 'dart:ui';

import 'package:attendify/features/common/app_colors.dart';
import 'package:flutter/material.dart';

bool _isEmpty(double d) {
  return d == 0.0;
}

/// corner
class FDottedLineCorner {
  final double leftTopCorner;
  final double rightTopCorner;
  final double rightBottomCorner;
  final double leftBottomCorner;

  /// Specify the size of each rounded corner
  const FDottedLineCorner({
    this.leftTopCorner = 0,
    this.rightTopCorner = 0,
    this.rightBottomCorner = 0,
    this.leftBottomCorner = 0,
  });

  /// Set all rounded corners to one size
  FDottedLineCorner.all(double radius)
      : leftTopCorner = radius,
        rightTopCorner = radius,
        rightBottomCorner = radius,
        leftBottomCorner = radius;
}

class FDottedLine extends StatefulWidget {
  final Color? color;
  final double? height;
  final double? width;
  final double? strokeWidth;
  final double? dottedLength;
  final double? space;
  final FDottedLineCorner? corner;
  final Widget? child;

  FDottedLine({
    Key? key,
    this.color = Colors.black,
    this.height,
    this.width,
    this.dottedLength = 5.0,
    this.space = 3.0,
    this.strokeWidth = 1.0,
    this.corner,
    this.child,
  }) : super(key: key) {
    assert(width != null || height != null || child != null);
  }

  @override
  _FDottedLineState createState() => _FDottedLineState();
}

class _FDottedLineState extends State<FDottedLine> {
  AppColors appColors = AppColors();
  double? childWidth;
  double? childHeight;
  GlobalKey childKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    if (_isEmpty(widget.width!) &&
        _isEmpty(widget.height!) &&
        widget.child == null) return Container();
    if (widget.child != null) {
      tryToGetChildSize();
      List<Widget> children = [];
      children.add(
        Container(
          clipBehavior: widget.corner == null ? Clip.none : Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(
                  widget.corner != null ? widget.corner!.leftTopCorner : 0.0),
              topRight: Radius.circular(
                  widget.corner != null ? widget.corner!.rightTopCorner : 0.0),
              bottomLeft: Radius.circular(widget.corner != null
                  ? widget.corner!.leftBottomCorner
                  : 0.0),
              bottomRight: Radius.circular(widget.corner != null
                  ? widget.corner!.rightBottomCorner
                  : 0.0),
            ),
          ),
          key: childKey,
          child: widget.child,
        ),
      );
      if (childWidth != null && childHeight != null) {
        children.add(dashPath(width: childWidth!, height: childHeight!));
      }
      return Stack(
        children: children,
      );
    } else {
      return dashPath(width: widget.width!, height: widget.height!);
    }
  }

  void tryToGetChildSize() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      try {
        double tempWidth = childKey.currentContext!.size!.width;
        double tempHeight = childKey.currentContext!.size!.height;
        bool needUpdate = tempWidth != childWidth || tempHeight != childHeight;
        if (needUpdate) {
          setState(() {
            childWidth = tempWidth;
            childHeight = tempHeight;
          });
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }

  CustomPaint dashPath({double? width, double? height}) {
    return CustomPaint(
      size: Size(_isEmpty(width!) ? widget.strokeWidth! : width,
          _isEmpty(height!) ? widget.strokeWidth! : height),
      foregroundPainter: _DottedLinePainter()
        ..color = widget.color!
        ..dottedLength = widget.dottedLength!
        ..space = widget.space!
        ..strokeWidth = widget.strokeWidth!
        ..corner = widget.corner!
        ..isShape = !_isEmpty(height) && !_isEmpty(width),
    );
  }
}

class _DottedLinePainter extends CustomPainter {
  Color? color;
  double? dottedLength;
  double? space;
  double? strokeWidth;
  bool? isShape;
  FDottedLineCorner? corner;
  Radius? topLeft = Radius.zero;
  Radius? topRight = Radius.zero;
  Radius? bottomRight = Radius.zero;
  Radius? bottomLeft = Radius.zero;

  @override
  void paint(Canvas canvas, Size size) {
    var isHorizontal = size.width > size.height;
    final Paint paint = Paint()
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high
      ..color = color!
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth!;

    /// line
    if (!isShape!) {
      double length = isHorizontal ? size.width : size.height;
      double count = (length) / (dottedLength! + space!);
      if (count < 2.0) return;
      var startOffset = const Offset(0, 0);
      for (int i = 0; i < count.toInt(); i++) {
        canvas.drawLine(
            startOffset,
            startOffset.translate((isHorizontal ? dottedLength! : 0),
                (isHorizontal ? 0 : dottedLength!)),
            paint);
        startOffset = startOffset.translate(
            (isHorizontal ? (dottedLength! + space!) : 0),
            (isHorizontal ? 0 : (dottedLength! + space!)));
      }
    }

    /// shape
    else {
      Path path = Path();
      path.addRRect(RRect.fromLTRBAndCorners(
        0,
        0,
        size.width,
        size.height,
        topLeft: Radius.circular(corner != null ? corner!.leftTopCorner : 0.0),
        topRight:
            Radius.circular(corner != null ? corner!.rightTopCorner : 0.0),
        bottomLeft:
            Radius.circular(corner != null ? corner!.leftBottomCorner : 0.0),
        bottomRight:
            Radius.circular(corner != null ? corner!.rightBottomCorner : 0.0),
      ));

      Path draw = buildDashPath(path, dottedLength!, space!);
      canvas.drawPath(draw, paint);
    }
  }

  Path buildDashPath(Path path, double dottedLength, double space) {
    final Path r = Path();
    for (PathMetric metric in path.computeMetrics()) {
      double start = 0.0;
      while (start < metric.length) {
        double end = start + dottedLength;
        r.addPath(metric.extractPath(start, end), Offset.zero);
        start = end + space;
      }
    }
    return r;
  }

  @override
  bool shouldRepaint(_DottedLinePainter oldDelegate) {
    return true;
  }
}
