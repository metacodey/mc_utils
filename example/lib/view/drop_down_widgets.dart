import 'package:example/user.dart';
import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class DropDownWidgets extends StatelessWidget {
  const DropDownWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const McText(
        txt: "----------- Drop Down Button ------------",
        fontSize: 20,
      ),
      const SizedBox(
        height: 10,
      ),
      McCardItem(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        colorBorder: Color(0xFF092A77),
        child: McDropDownBtn<UserModel>(
          isSearch: true,
          title: "Drop Down Button with Search",
          //model: const UserModel(id: 1, age: 20, name: "ali"),
          list: const [
            UserModel(id: 1, age: 20, name: "ali"),
            UserModel(id: 2, age: 30, name: "mohmmed"),
            UserModel(id: 3, age: 25, name: "younas")
          ],
          color: const Color.fromRGBO(238, 238, 238, 1),

          closedHeaderPadding: EdgeInsets.all(10),
          onChange: (user) {
            print(user?.id);
            print(user?.name);
            print(user?.age);
          },
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      const McCardItem(
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        colorBorder: Color(0xFF092A77),
        child: McDropDownBtn<String>(
          isSearch: false,
          title: "Drop Down Button",
          list: ["ali", "salh", "mohmmed"],
        ),
      ),
      Divider(),
      const SizedBox(
        height: 10,
      ),
    ]);
  }
}
