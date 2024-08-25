import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class ButtonWidgets extends StatelessWidget {
  const ButtonWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const McText(
          txt: "----------- Buttons ------------",
          fontSize: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        // button
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            McButton(
              txt: "login".toUpperCase(),
              icon: Icons.login,
              color: Color(0xFF092A77),
              colorBorder: Color(0xFF092A77),
              blod: true,
              fontSize: 18,
              raudis: 10,
              width: true,
              onTap: () {
                print("button");
              },
            ),
            McButton(
              txt: "login",
              colorBtn: Color(0xFF092A77),
              color: Colors.white,
              icon: Icons.login,
              colorBorder: Colors.white,
              blod: true,
              fontSize: 18,
              raudis: 10,
              width: true,
              onTap: () {
                print("button");
              },
            ),
          ],
        ),

        const SizedBox(
          height: 10,
        ),
        //button
        McButton(
          txt: "login",
          colorBtn: Color(0xFF092A77),
          color: Colors.white,
          icon: Icons.login,
          colorBorder: Colors.white,
          blod: true,
          fontSize: 18,
          raudis: 20,
          width: false,
          onTap: () {
            print("button");
          },
        ),
        Divider(),
        const SizedBox(
          height: 10,
        ),
        const McText(
          txt: "----- Icon Buttons And Text -----",
          fontSize: 20,
        ),
        const SizedBox(
          height: 10,
        ),
        // icon and text
        McIconTxt(
          icons: Icons.done,
          bgColor: Color(0xFF092A77),
          blod: true,
          icColor: Colors.white,
          sizeIcon: 30,
          rudisIcon: 20,
          sizeTitle: 16,
          text: "hi how are you",
          tiColor: Colors.black,
          onPress: () {
            print("button");
          },
        ),
        const SizedBox(
          height: 10,
        ),
        McIconTxt(
          icons: Icons.done,
          bgColor: Color(0xFF092A77),
          blod: true,
          icColor: Colors.white,
          sizeIcon: 30,
          rudisIcon: 20,
          onPress: () {
            print("button");
          },
        ),
        Divider(),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}