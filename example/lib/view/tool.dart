import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class ToolWidget extends StatelessWidget {
  const ToolWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const McText(
          txt: "----------- tools -----------",
          fontSize: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        McText(
          txt: "get Type file =>${McProcess.getFileType("assets/1.jpg")}",
        ),
        const SizedBox(
          height: 5,
        ),
        McText(
          txt: "check nummber  : 44521 =>${McProcess.checkIsNumirc("44521")}",
        ),
        const SizedBox(
          height: 5,
        ),
        const McText(txt: "-------------- Date and Time --------------"),
        McText(txt: McProcess.changeDateTime(DateTime(2024, 8, 7, 6, 58))),
        const SizedBox(
          height: 5,
        ),
        const SizedBox(
          height: 5,
        ),
        McText(txt: McProcess.changeDateTime(DateTime(2024, 8, 26, 6, 58))),
        const SizedBox(
          height: 5,
        ),
        McText(txt: McProcess.changeDateTime(DateTime.now())),
        const SizedBox(
          height: 5,
        ),
        McText(txt: McProcess.getTime(DateTime.now())),
        const SizedBox(
          height: 5,
        ),
        McText(txt: McProcess.getDateEnglish(DateTime.now().toString())),
        const SizedBox(
          height: 5,
        ),
        const McText(txt: "calculate Time Between two dates :"),
        McText(
            txt: McProcess.calculateTimeDifference(
          DateTime(2024, 8, 26, 6, 58),
          DateTime.now(),
        )),
        const SizedBox(
          height: 5,
        ),
        const McText(txt: "-------------- format Nummber --------------"),
        const SizedBox(
          height: 5,
        ),
        McText(txt: McProcess.formatNumber("5522014")),
      ],
    );
  }
}
