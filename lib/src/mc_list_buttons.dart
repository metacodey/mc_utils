import 'package:flutter/material.dart';

import 'mc_button.dart';

class McListButtons extends StatefulWidget {
  final List<String> list;
  final Color colorSelected;
  final Color colorBtn;
  final double radius;
  final Color fontColor;
  final Color fontColorSelected;
  final double sizeFont;
  final Color colorBorder;
  final bool isHorizontal;
  final EdgeInsetsGeometry? paddingContect;
  final EdgeInsetsGeometry? paddingBtn;

  final Function(int) onSelected;

  const McListButtons(
      {super.key,
      required this.list,
      required this.onSelected,
      this.colorBtn = Colors.white,
      this.fontColor = const Color(0xFF252B5C),
      this.fontColorSelected = Colors.white,
      this.sizeFont = 14,
      this.radius = 30,
      this.colorSelected = const Color(0xFF252B5C),
      this.paddingContect,
      this.paddingBtn,
      this.colorBorder = const Color(0xFF252B5C),
      this.isHorizontal = false});

  @override
  State<McListButtons> createState() => _McListButtonsState();
}

class _McListButtonsState extends State<McListButtons> {
  int active = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: widget.isHorizontal ? Axis.vertical : Axis.horizontal,
        child: widget.isHorizontal
            ? Column(
                children:
                    List.generate(widget.list.length, (index) => item(index))
                        .toList(),
              )
            : Row(
                children:
                    List.generate(widget.list.length, (index) => item(index))
                        .toList(),
              ),
      ),
    );
  }

  Widget item(int index) {
    return Padding(
      padding: widget.paddingContect ?? const EdgeInsets.all(5),
      child: McButton(
        txt: widget.list[index],
        colorBtn: active == index ? widget.colorSelected : widget.colorBtn,
        raudis: widget.radius,
        color: active == index ? widget.fontColorSelected : widget.fontColor,
        colorBorder: widget.colorBorder,
        show5Words: true,
        blod: true,
        padding: widget.paddingBtn,
        line: 1,
        fontSize: widget.sizeFont,
        onTap: () => changeStateBtnMenu(index),
      ),
    );
  }

  void changeStateBtnMenu(int selected) {
    widget.onSelected(selected);
    setState(() {
      active = selected;
    });
  }
}
