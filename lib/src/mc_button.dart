import 'package:flutter/material.dart';
import 'package:mc_utils/src/mc_text.dart';

/// [McButton] is a customizable button widget that extends [McText].
/// It supports adding an icon, custom border and background colors,
/// padding, and tap actions, and can adjust its width based on the screen size.
class McButton extends McText {
  final Color colorBorder;
  final Color colorBtn;
  final IconData? icon;
  final Function()? onTap;
  final bool width;
  final double raudis;
  final EdgeInsetsGeometry? padding;

  /// The [McButton] constructor allows you to specify various properties for the button.
  ///
  /// [colorBorder] sets the color of the button's border.
  ///
  /// [colorBtn] defines the background color of the button.
  ///
  /// [icon] is an optional icon to be displayed inside the button.
  ///
  /// [onTap] is a callback function that is called when the button is tapped.
  ///
  /// [width] determines whether the button should occupy a fixed width based on the screen size.
  ///
  /// [raudis] specifies the border radius of the button's corners.
  ///
  /// [padding] sets the padding inside the button.
  ///
  /// The following properties are inherited from [McText]:
  ///
  /// [txt] is the text displayed inside the button.
  ///
  /// [fontSize] sets the font size of the text.
  ///
  /// [color] defines the color of the text.
  ///
  /// [blod] makes the text bold if set to true.
  ///
  /// [line] limits the number of lines the text can occupy.
  ///
  /// [fontFamily] sets the font family for the text.
  ///
  /// [txtAlign] allows you to align the text.
  ///
  /// [show5Words] when set to true, truncates the text to show only the first 5 words.
  const McButton({
    super.key,
    this.onTap,
    this.icon,
    this.raudis = 10,
    this.width = false,
    this.colorBtn = Colors.white,
    this.colorBorder = Colors.black,
    required super.txt,
    super.fontSize,
    super.color,
    super.blod = false,
    super.line = 1,
    super.fontFamily,
    super.txtAlign,
    super.show5Words = false,
    this.padding =
        const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width ? MediaQuery.of(context).size.width * 0.4 : null,
        padding: padding ??
            const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        decoration: BoxDecoration(
          color: colorBtn,
          border: Border.all(width: 2, color: colorBorder),
          borderRadius: BorderRadius.all(Radius.circular(raudis)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Icon(
                icon,
                color: color,
              ),
            if (icon != null)
              const SizedBox(
                width: 5,
              ),
            McText(
              txt: txt,
              fontSize: fontSize,
              color: color,
              blod: blod,
              fontFamily: fontFamily,
              line: line,
              show5Words: show5Words,
              txtAlign: txtAlign,
            ),
          ],
        ),
      ),
    );
  }
}
