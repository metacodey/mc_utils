import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class CardWidgts extends StatelessWidget {
  const CardWidgts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const McText(
          txt: "----------- Card  ------------",
          fontSize: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        //card item
        const McCardItem(
          width: double.infinity,
          hight: 100,
          alignment: Alignment.center,
          radius: 5,
          child: McText(txt: "hi how are you"),
        ),
        Divider(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
