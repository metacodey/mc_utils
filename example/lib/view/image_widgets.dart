import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class ImageWidgets extends StatelessWidget {
  const ImageWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        McText(
          txt: "----------- Images ------------",
          fontSize: 20,
        ),
        SizedBox(
          height: 10,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            McImageNetWork(
              url: "https://meta-code-ye.com/images/cabme/2.jpg",
              width: 100,
              height: 100,
              isCircle: true,
              pathImgError: "images/1.jpg",
            ),
            McImageNetWork(
              url: "https://meta-code-ye.com/images/cabme/2.jpg",
              width: 100,
              height: 100,
              isCircle: false,
              pathImgError: "images/1.jpg",
            ),
          ],
        ),
        //  McImageFile(
        //       file: File(""),
        //       width: 100,
        //       height: 100,
        //       isCircle: false,
        //       pathImgError: "images/1.jpg",
        //     ),
        //  McImageFile(
        //       file: File(""),
        //       width: 100,
        //       height: 100,
        //       isCircle: true,
        //       pathImgError: "images/1.jpg",
        //     ),
        SizedBox(
          height: 10,
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            McImageAssets(
              path: "images/1.jpg",
              width: 100,
              height: 100,
              isCircle: false,
              pathImgError: "images/1.jpg",
            ),
            McImageAssets(
              path: "images/1.jpg",
              width: 100,
              height: 100,
              isCircle: true,
              pathImgError: "images/1.jpg",
            ),
          ],
        ),
        Divider(),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
