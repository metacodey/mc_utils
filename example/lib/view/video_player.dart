import 'package:flutter/material.dart';
import 'package:mc_utils/mc_utils.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const McText(
          txt: "---- Video player asste,file,network -----",
          fontSize: 20,
        ),
        const SizedBox(
          height: 10,
        ),

        Container(
          width: double.infinity,
          height: 200,
          child: McPlayer.network(
            url:
                "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        Container(
          width: double.infinity,
          height: 200,
          child: McPlayer.asset(
            path: "images/test.mp4",
          ),
        ),

        //   Container(
        //   width: double.infinity,
        //   height: 200,
        //   child: McPlayer.file(
        //     file: File(""),
        //   ),
        // ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
