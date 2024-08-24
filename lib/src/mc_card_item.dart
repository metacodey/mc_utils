import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class McCardItem extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? hight;
  final double radius;
  final Color? colorBorder;
  final bool showShdow;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final AlignmentGeometry? alignment;
  const McCardItem(
      {super.key,
      required this.child,
      this.width,
      this.hight,
      this.colorBorder,
      this.padding,
      this.margin,
      this.showShdow = true,
      this.radius = 20,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: padding ?? const EdgeInsets.all(15),
        width: width,
        height: hight,
        margin: margin ?? const EdgeInsets.all(0.50),
        alignment: alignment,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            border: colorBorder != null
                ? Border.all(width: 2, color: colorBorder!)
                : null,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            boxShadow: showShdow
                ? [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0.0, 1.5),
                        blurRadius: 7.0)
                  ]
                : []),
        child: child);
  }
}
