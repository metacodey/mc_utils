import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class OtpTextfield extends StatefulWidget {
  const OtpTextfield({super.key});

  @override
  State<OtpTextfield> createState() => _OtpTextfieldState();
}

class _OtpTextfieldState extends State<OtpTextfield> {
  final formKey = GlobalKey<FormState>();

  TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const McText(
        txt: "----------Otp textField-----------",
        fontSize: 20,
      ),
      const SizedBox(
        height: 10,
      ),
      Form(
          key: formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    McOtpInput(controller: fieldOne, autoFocus: true),
                    McOtpInput(
                      controller: fieldTwo,
                      autoFocus: false,
                    ), // auto focus
                    McOtpInput(
                      controller: fieldThree,
                      autoFocus: false,
                    ), // auto focus
                    McOtpInput(
                      controller: fieldFour,
                      autoFocus: false,
                    ), // auto focus
                  ],
                ),
                const SizedBox(height: 50.0),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "resend_code",
                        style: TextStyle(
                          color: Colors.black38,
                        ),
                      ),
                      TextSpan(
                        text: 'resend'.tr,
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.orange),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40.0),
                McButton(
                  txt: "check".tr,
                  colorBorder: Colors.white,
                  blod: true,
                  fontSize: 20,
                  raudis: BorderRadius.circular(30),
                  width: 250,
                  defualtWideth: false,
                  onTap: () {},
                )
              ],
            ),
          )),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
