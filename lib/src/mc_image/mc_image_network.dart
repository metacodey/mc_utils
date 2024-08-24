import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class McImageNetWork extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final String? pathImgError;
  final BoxFit fit;
  final bool isCircle;
  final double radius;
  const McImageNetWork(
      {super.key,
      required this.url,
      this.height,
      this.width,
      this.fit = BoxFit.cover,
      this.isCircle = false,
      this.radius = 10,
      this.pathImgError});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      imageBuilder: (context, imageProvider) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: !isCircle ? BorderRadius.circular(radius) : null,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          image: DecorationImage(image: imageProvider, fit: fit),
        ),
      ),
      placeholder: (context, url) => Container(
        width: width,
        height: height,
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => Container(
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
