import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class PopMenuWidgets extends StatelessWidget {
  const PopMenuWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const McText(
          txt: "----------- Pop Menu ------------",
          fontSize: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const McPopUpMenChat(
              menuList: [
                PopupMenuItem(
                  child: McText(txt: "one item"),
                ),
                PopupMenuItem(
                  child: McText(txt: "tow item "),
                ),
                PopupMenuItem(
                  child: McText(txt: "three item"),
                )
              ],
              child: McText(txt: "click on me"),
            ),
            const McPopUpMenChat(
              color: Color(0xFF092A77),
              position: PopupMenuPosition.over,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              menuList: [
                PopupMenuItem(
                  child: McText(txt: "one item"),
                ),
                PopupMenuItem(
                  child: McText(txt: "tow item "),
                ),
                PopupMenuItem(
                  child: McText(txt: "three item"),
                )
              ],
              child: McText(txt: "click on me"),
            ),
            McPopUpMenChat(
              color: Color(0xFF092A77),
              position: PopupMenuPosition.over,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                  side:
                      BorderSide(color: Colors.red, width: 4, strokeAlign: 5)),
              menuList: [
                PopupMenuItem(
                  child: const McText(
                    txt: "one item",
                  ),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: const McText(txt: "tow item "),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: const McText(txt: "three item"),
                  onTap: () {},
                )
              ],
              child: const McText(txt: "click on me"),
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
