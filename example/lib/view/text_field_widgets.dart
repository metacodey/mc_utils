import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class TextFieldWidgets extends StatelessWidget {
  const TextFieldWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const McText(
          txt: "----------- textField Them ------------",
          fontSize: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: McTextFieldTheme.inputBoxDecorationShaddow(),
          child: TextFormField(
            decoration: McTextFieldTheme.textInputDecoration(
              prefixIcon: const Icon(Icons.email, color: Colors.blue),
              suffixIcon: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.add),
                  Icon(Icons.edit, color: Colors.blue),
                  Icon(
                    Icons.delete,
                    color: Colors.red,
                  )
                ],
              ),
              lableText: "email",
              hintText: " enter your email:",
              borderSide: const BorderSide(color: Color(0xFF092A77), width: 2),
              contentPadding: const EdgeInsets.all(15),
            ),
            keyboardType: TextInputType.text,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: McCardItem(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                child: TextFormField(
                  decoration: McTextFieldTheme.textInputDecoration(
                    prefixIcon:
                        const Icon(Icons.emoji_emotions, color: Colors.blue),
                    borderRadius: BorderRadius.circular(50),
                    suffixIcon: const Padding(
                      padding: EdgeInsets.all(6),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.mic),
                          Icon(
                            Icons.attach_file,
                          ),
                          Icon(
                            Icons.camera_alt,
                          )
                        ],
                      ),
                    ),
                    lableText: "Msg",
                    hintText: "wtite your message :",
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.5),
                    contentPadding: const EdgeInsets.all(10),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            const McIconTxt(
              icons: Icons.send,
              rudisIcon: 20,
              bgColor: Colors.green,
            )
          ],
        ),
        Divider(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
