import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class ListButtons extends StatelessWidget {
  const ListButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const McText(
          txt: "List Bunttons Horizontal And vertical",
          fontSize: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        McListButtons(
          list: const ["ali", "salh", "alaa", "abdo", "younas"],
          sizeFont: 20,
          radius: 30,
          isHorizontal: false,
          onSelected: (p0) {},
        ),
        const SizedBox(
          height: 10,
        ),
        McListButtons(
          list: const ["ali", "salh", "mohmmed", "abdo", "younas"],
          sizeFont: 20,
          radius: 30,
          isHorizontal: true,
          onSelected: (p0) {},
        ),
        const Divider(),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
