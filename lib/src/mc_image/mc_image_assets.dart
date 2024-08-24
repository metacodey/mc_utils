import 'package:flutter/material.dart';

class McImageAssets extends StatelessWidget {
  final String path;
  final double? height;
  final double? width;
  final String? pathImgError;
  final BoxFit fit;
  final bool isCircle;
  final double radius;
  const McImageAssets(
      {super.key,
      required this.path,
      this.height,
      this.width,
      this.fit = BoxFit.cover,
      this.isCircle = false,
      this.radius = 10,
      this.pathImgError});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(path),
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
          Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: !isCircle ? BorderRadius.circular(radius) : null,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          image: DecorationImage(image: AssetImage(path), fit: fit),
        ),
      ),
      errorBuilder: (context, url, error) => Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: !isCircle ? BorderRadius.circular(radius) : null,
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
              image: DecorationImage(
                  image: AssetImage(pathImgError ?? ""), fit: fit))),
    );
  }
}
