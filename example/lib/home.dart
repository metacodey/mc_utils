import 'package:example/view/button_widgets.dart';
import 'package:example/view/card_widgts.dart';
import 'package:example/view/date_time_picker.dart';
import 'package:example/view/drop_down_widgets.dart';
import 'package:example/view/image_widgets.dart';
import 'package:example/view/line_step_widgets.dart';
import 'package:example/view/list_buttons.dart';
import 'package:example/view/otp_textfield.dart';
import 'package:example/view/pop_menu_widgets.dart';
import 'package:example/view/text_field_widgets.dart';
import 'package:example/view/text_widgets.dart';
import 'package:example/view/tool.dart';
import 'package:example/view/video_player.dart';
import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const McText(txt: "mc_utils"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  const ImageWidgets(),
                  const TextFieldWidgets(),
                  const DropDownWidgets(),
                  const TextWidgets(),
                  const CardWidgts(),
                  const ButtonWidgets(),
                  const LineStepWidgets(),
                  const PopMenuWidgets(),
                  const ListButtons(),
                  const VideoPlayer(),
                  const ToolWidget(),
                  const OtpTextfield(),
                  TextFieldDateTimePicker(
                    title: "select date",
                    initDatetime: DateTime.now(),
                    onTap: (p0) {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
