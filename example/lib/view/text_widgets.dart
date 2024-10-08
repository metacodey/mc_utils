import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class TextWidgets extends StatelessWidget {
  const TextWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        McText(
          txt: "----------- Text and Lines ------------",
          fontSize: 20,
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // multi lines
            McCardItem(
              child: McText(
                txt: "multi lines \n multi lines.",
                txtAlign: TextAlign.center,
                blod: true,
                show5Words: false,
              ),
            ),
            // one line
            McCardItem(
              width: 100,
              child: McText(
                txt: "one line \n what are you doing.",
                txtAlign: TextAlign.center,
                blod: true,
                line: 1,
                show5Words: false,
              ),
            ),
            //line with ponits
            McCardItem(
              width: 120,
              child: McText(
                txt: "line with points",
                txtAlign: TextAlign.center,
                blod: true,
                line: 1,
                show5Words: false,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        McCardItem(
          width: double.infinity,
          child: McText(
            txt: " show five words in this line ",
            txtAlign: TextAlign.center,
            blod: true,
            line: 1,
            show5Words: true,
          ),
        ),
        Divider(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
