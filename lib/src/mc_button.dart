import 'package:flutter/material.dart';
import 'package:mc_utils/src/mc_text.dart';

class McButton extends McText {
  final Color colorBorder;
  final Color colorBtn;
  final IconData? icon;
  final Function()? onTap;
  final bool width;
  final double raudis;
  final EdgeInsetsGeometry? padding;
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
              borderRadius: BorderRadius.all(Radius.circular(raudis))),
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
          )),
    );
  }
}
