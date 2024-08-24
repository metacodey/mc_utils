// ignore: file_names
import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart' as mc_utils;

class McStepLine extends StatelessWidget {
  final int countStep;
  final int step;
  final String title;
  final Color colorLine;
  final double fontSize;
  final Color colorFont;
  const McStepLine(
      {super.key,
      this.countStep = 6,
      this.step = 1,
      this.colorFont = const Color(0xFF252B5C),
      this.colorLine = const Color(0xFF252B5C),
      this.fontSize = 14,
      this.title = 'Step'});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              children: [
                for (int i = 1; i <= countStep; i++)
                  Opacity(
                    opacity: step >= i ? 1 : 0.5,
                    child: Container(
                      color: colorLine,
                      width: 25,
                      height: 5.5,
                    ),
                  )
              ],
            ),
          ),
          const SizedBox(width: 10),
          mc_utils.McText(
            txt: title,
            fontSize: fontSize,
            color: colorFont,
            show5Words: true,
            line: 1,
            blod: true,
          ),
          mc_utils.McText(
            txt: " $step/$countStep ",
            fontSize: fontSize,
            color: colorFont,
            show5Words: true,
            blod: true,
            line: 1,
          ),
        ],
      ),
    );
  }
}
