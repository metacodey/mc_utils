import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mc_utils/mc_utils.dart';
import '../controller/video_player_controller.dart';

class McVideoPlayer extends StatelessWidget {
  final String url;
  final int type;
  McVideoPlayer({
    Key? key,
    required this.url,
    required this.type,
  }) : super(key: key) {
    Get.put(
      VideoPlayerController(url: url, type: type),
    );
  }

  void _toggleFullscreen(BuildContext context, bool isFullscreen) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, _, __) => Scaffold(
          backgroundColor: Colors.black,
          body: GestureDetector(
            onTap: () {
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.portraitUp,
                DeviceOrientation.portraitDown,
              ]);
              Navigator.of(context).pop();
            },
            child: McVideoPlayer(
              url: url,
              type: type,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async => false,
      child: GetBuilder<VideoPlayerController>(builder: (controller) {
        return GestureDetector(
          onTap: () {
            controller.toggleControls();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              controller.model.controller.value.isInitialized
                  ? Container(
                      width: controller.model.showFullScreen
                          ? double.infinity
                          : size.width,
                      height: controller.model.showFullScreen
                          ? double.infinity
                          : null,
                      child: AspectRatio(
                        aspectRatio:
                            controller.model.controller.value.aspectRatio,
                        child:
                            CachedVideoPlayerPlus(controller.model.controller),
                      ),
                    )
                  : const CircularProgressIndicator.adaptive(),
              if (controller.model.showProgressBar)
                const Center(
                  child: CircularProgressIndicator.adaptive(
                    backgroundColor: Colors.red,
                  ),
                ),
              Container(
                color: !controller.model.isStart
                    ? Colors.black.withOpacity(0.5)
                    : controller.model.showControls
                        ? Colors.black.withOpacity(0.5)
                        : null,
                width: size.width,
                height:
                    controller.model.showFullScreen ? double.infinity : null,
              ),
              if (!controller.model.isStart)
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    McIconTxt(
                      icons: Icons.play_arrow,
                      sizeIcon: 40,
                      bgColor: Colors.white,
                      icColor: Colors.black,
                      onPress: () {
                        controller.startVideo();
                      },
                    ),
                  ],
                ),
              if (controller.model.showControls && controller.model.isStart)
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Expanded(flex: 2, child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(),
                        McIconTxt(
                          icons: Icons.skip_previous,
                          bgColor: Colors.white.withOpacity(0.1),
                          sizeIcon: 50,
                          rudisIcon: 25,
                          onPress: () {
                            controller.rewind();
                          },
                        ),
                        McIconTxt(
                          icons: controller.model.isPlaying
                              ? Icons.pause
                              : Icons.play_arrow,
                          bgColor: Colors.white.withOpacity(0.1),
                          sizeIcon: 50,
                          rudisIcon: 25,
                          onPress: () {
                            controller.togglePlayPause();
                          },
                        ),
                        McIconTxt(
                          icons: Icons.skip_next_sharp,
                          bgColor: Colors.white.withOpacity(0.1),
                          sizeIcon: 50,
                          rudisIcon: 25,
                          onPress: () {
                            controller.forward();
                          },
                        ),
                        Container(),
                      ],
                    ),
                    Expanded(child: Container()),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 5, right: 5),
                          child: Row(
                            children: [
                              StreamBuilder(
                                  stream: Stream.periodic(
                                      const Duration(seconds: 1),
                                      (computationCount) => controller
                                          .model.controller.value.position),
                                  builder: (context, snapshot) {
                                    return McText(
                                      fontSize: 12,
                                      txt: controller.formatDuration(
                                        controller
                                            .model.controller.value.position,
                                      ),
                                      color: Colors.white,
                                    );
                                  }),
                              Expanded(
                                child: GestureDetector(
                                  onHorizontalDragUpdate: (details) {
                                    controller.showProgressBar(true);
                                    final newPosition = controller
                                            .model.controller.value.position +
                                        Duration(
                                            milliseconds:
                                                details.primaryDelta!.toInt());
                                    if (newPosition <
                                        controller
                                            .model.controller.value.duration) {
                                      controller.seekTo(newPosition);
                                    }
                                  },
                                  onHorizontalDragEnd: (_) {
                                    controller.showProgressBar(false);
                                  },
                                  child: VideoProgressIndicator(
                                    controller.model.controller,
                                    allowScrubbing: true,
                                    padding: EdgeInsets.all(8.0),
                                  ),
                                ),
                              ),
                              McText(
                                fontSize: 12,
                                txt: controller.formatDuration(
                                  controller.model.controller.value.duration,
                                ),
                                color: Colors.white,
                              ),
                              McIconTxt(
                                icons: controller.model.showFullScreen
                                    ? Icons.fullscreen_exit
                                    : Icons.fullscreen,
                                bgColor: Colors.white.withOpacity(0.0),
                                sizeIcon: 30,
                                rudisIcon: 15,
                                onPress: () {
                                  if (controller.model.showFullScreen) {
                                    SystemChrome.setPreferredOrientations([]);
                                    controller.colseFullscreen();
                                    Navigator.of(context).pop();
                                  } else {
                                    controller.toggleFullscreen();
                                    _toggleFullscreen(context,
                                        controller.model.showFullScreen);
                                  }
                                },
                              ),
                              // Image.asset(
                              //   "images/1.jpg",
                              //   height: 25,
                              //   width: 25,
                              // ),
                              // const McImageAssets(
                              //   path: "assets/images/speaker.png",
                              //   height: 25,
                              //   width: 25,
                              //   isCircle: false,
                              //   pathImgError: "assets/images/speaker.png",
                              // ),
                              // McIconTxt(
                              //   icons: controller.model.showFullScreen
                              //       ? Icons.speaker
                              //       : Icons.fullscreen,
                              //   bgColor: Colors.white.withOpacity(0.0),
                              //   sizeIcon: 30,
                              //   rudisIcon: 15,
                              //   onPress: () {},
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        );
      }),
    );
  }
}
