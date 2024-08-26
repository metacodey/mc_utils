import 'package:flutter/material.dart';

/// [McIconTxt] is a widget that combines an icon with an optional text label.
/// It supports customization of the icon's appearance, background color, and text style,
/// and provides an onPress callback for user interaction.
class McIconTxt extends StatelessWidget {
  final IconData icons;
  final Color? bgColor;
  final Color icColor;
  final Color tiColor;
  final String? text;
  final Function()? onPress;
  final bool blod;
  final double sizeIcon;
  final double rudisIcon;
  final double sizeTitle;

  /// The [McIconTxt] constructor allows you to specify various properties for the icon and text widget.
  ///
  /// [icons] specifies the icon to be displayed.
  ///
  /// [bgColor] defines the background color of the circle surrounding the icon.
  ///
  /// [icColor] sets the color of the icon.
  ///
  /// [tiColor] defines the color of the text.
  ///
  /// [text] is the optional text to be displayed below the icon.
  ///
  /// [onPress] is a callback function that is called when the widget is tapped.
  ///
  /// [blod] makes the text bold if set to true.
  ///
  /// [sizeIcon] specifies the size of the icon.
  ///
  /// [rudisIcon] sets the radius of the circle surrounding the icon.
  ///
  /// [sizeTitle] specifies the font size of the text.
  const McIconTxt({
    Key? key,
    required this.icons,
    this.bgColor,
    this.text,
    this.blod = false,
    this.icColor = Colors.white,
    this.tiColor = Colors.black,
    this.sizeTitle = 12,
    this.rudisIcon = 23,
    this.sizeIcon = 21,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
          // Displays the icon inside a circle with optional background color.
          CircleAvatar(
            radius: rudisIcon,
            backgroundColor: bgColor,
            child: Icon(
              icons,
              size: sizeIcon,
              color: icColor,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          // Displays the optional text below the icon, if provided.
          if (text != null)
            Text(
              text!,
              style: TextStyle(
                fontSize: sizeTitle,
                color: tiColor,
                fontWeight: blod ? FontWeight.bold : null,
              ),
            ),
        ],
      ),
    );
  }
}
