import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class CardWidgts extends StatelessWidget {
  const CardWidgts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        McText(
          txt: "----------- Card  ------------",
          fontSize: 20,
        ),
        SizedBox(
          height: 10,
        ),
        //card item
        McCardItem(
          width: double.infinity,
          hight: 100,
          alignment: Alignment.center,
          radius: BorderRadius.all(Radius.circular(10)),
          child: McText(txt: "hi how are you"),
        ),
        Divider(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
