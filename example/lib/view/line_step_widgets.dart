import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class LineStepWidgets extends StatelessWidget {
  const LineStepWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const McText(
          txt: "----------- Line Step ------------",
          fontSize: 20,
        ),
        for (int x = 1; x < 6; x++)
          McStepLine(
            countStep: 5,
            step: x,
            colorFont: Colors.pink,
            colorLine: Colors.pink,
          ),
        Divider(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
