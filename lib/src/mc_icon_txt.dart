import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  const McIconTxt(
      {Key? key,
      required this.icons,
      this.bgColor,
      this.text,
      this.blod = false,
      this.icColor = Colors.white,
      this.tiColor = Colors.black,
      this.sizeTitle = 12,
      this.rudisIcon = 23,
      this.sizeIcon = 21,
      this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Column(
        children: [
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
