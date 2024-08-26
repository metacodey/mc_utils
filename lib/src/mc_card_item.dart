import 'package:flutter/material.dart';

/// [McCardItem] is a customizable card widget that can contain a child widget and supports various styling options.
/// It allows for customization of width, height, border color, shadow visibility, padding, margin, and border radius.
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

  /// The [McCardItem] constructor allows you to specify various properties for the card widget.
  ///
  /// [child] is the widget displayed inside the card.
  ///
  /// [width] defines the width of the card.
  ///
  /// [hight] defines the height of the card.
  ///
  /// [colorBorder] sets the color of the card's border. If null, no border is displayed.
  ///
  /// [showShdow] determines whether the card should display a shadow.
  ///
  /// [padding] specifies the padding inside the card.
  ///
  /// [margin] sets the margin outside the card.
  ///
  /// [radius] defines the border radius of the card's corners.
  ///
  /// [alignment] specifies the alignment of the child widget inside the card.
  const McCardItem({
    super.key,
    required this.child,
    this.width,
    this.hight,
    this.colorBorder,
    this.padding,
    this.margin,
    this.showShdow = true,
    this.radius = 20,
    this.alignment,
  });

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
                  blurRadius: 7.0,
                )
              ]
            : [],
      ),
      child: child,
    );
  }
}
