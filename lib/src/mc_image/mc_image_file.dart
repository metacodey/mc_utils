import 'dart:io';
import 'package:flutter/material.dart';

class McImageFile extends StatelessWidget {
  final File file;
  final double? height;
  final double? width;
  final String? pathImgError;
  final BoxFit fit;
  final bool isCircle;
  final double radius;
  const McImageFile(
      {super.key,
      required this.file,
      this.height,
      this.width,
      this.fit = BoxFit.cover,
      this.isCircle = false,
      this.radius = 10,
      this.pathImgError});

  @override
  Widget build(BuildContext context) {
    return Image(
      image: FileImage(file),
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) =>
          Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: !isCircle ? BorderRadius.circular(radius) : null,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          image: DecorationImage(image: FileImage(file), fit: fit),
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
