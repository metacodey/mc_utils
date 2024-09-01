import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mc_utils/mc_utils.dart';
import '../controller/video_player_controller.dart';

/// [McVideoPlayer] is a widget that provides a customizable video player
/// with support for fullscreen mode, playback controls, and seeking.
/// It uses [VideoPlayerController] to manage video playback and
/// handles fullscreen toggling and progress display.
class McVideoPlayer extends StatelessWidget {
  final String url;
  final int type;

  /// The [McVideoPlayer] constructor allows you to specify the video URL
  /// and type for the video player.
  ///
  /// [url] is the URL of the video to be played.
  ///
  /// [type] defines the type of video being played.
  const McVideoPlayer({
    Key? key,
    required this.url,
    required this.type,
  }) : super(key: key);

  /// Toggles fullscreen mode and updates device orientation.
  ///
  /// [context] is the build context for navigation.
  ///
  /// [isFullscreen] indicates whether the player is in fullscreen mode.
  void _toggleFullscreen(BuildContext context, bool isFullscreen) {
    // Set device orientation to landscape for fullscreen mode
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
              // Set device orientation back to portrait mode
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
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async => false,
      child: GetBuilder<VideoPlayerController>(
          init: Get.put(VideoPlayerController(url: url, type: type),
              tag: url), // Ensure unique tag for each controller
          tag: url,
          builder: (controller) {
            return GestureDetector(
              onTap: () => controller.toggleControls(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Video player widget
                  controller.model.controller.value.isInitialized
                      // ignore: sized_box_for_whitespace
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
                            child: CachedVideoPlayerPlus(
                                controller.model.controller),
                          ),
                        )
                      : const CircularProgressIndicator.adaptive(),

                  // Progress bar indicator
                  if (controller.model.showProgressBar)
                    const Center(
                      child: CircularProgressIndicator.adaptive(
                        backgroundColor: Colors.red,
                      ),
                    ),

                  // Overlay for video controls and play button
                  Container(
                    color: !controller.model.isStart
                        ? Colors.black.withOpacity(0.5)
                        : controller.model.showControls
                            ? Colors.black.withOpacity(0.5)
                            : null,
                    width: size.width,
                    height: controller.model.showFullScreen
                        ? double.infinity
                        : null,
                  ),

                  // Play button overlay
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

                  // Video controls overlay
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
                                  // Display current video position
                                  StreamBuilder(
                                      stream: Stream.periodic(
                                          const Duration(seconds: 1),
                                          (computationCount) => controller
                                              .model.controller.value.position),
                                      builder: (context, snapshot) {
                                        return McText(
                                          fontSize: 12,
                                          txt: controller.formatDuration(
                                            controller.model.controller.value
                                                .position,
                                          ),
                                          color: Colors.white,
                                        );
                                      }),
                                  Expanded(
                                    child: GestureDetector(
                                      onHorizontalDragUpdate: (details) {
                                        controller.showProgressBar(true);
                                        final newPosition = controller.model
                                                .controller.value.position +
                                            Duration(
                                                milliseconds: details
                                                    .primaryDelta!
                                                    .toInt());
                                        if (newPosition <
                                            controller.model.controller.value
                                                .duration) {
                                          controller.seekTo(newPosition);
                                        }
                                      },
                                      onHorizontalDragEnd: (_) {
                                        controller.showProgressBar(false);
                                      },
                                      child: VideoProgressIndicator(
                                        controller.model.controller,
                                        allowScrubbing: true,
                                        padding: const EdgeInsets.all(8.0),
                                      ),
                                    ),
                                  ),
                                  // Display video duration
                                  McText(
                                    fontSize: 12,
                                    txt: controller.formatDuration(
                                      controller
                                          .model.controller.value.duration,
                                    ),
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  // Toggle speaker icon
                                  InkWell(
                                    onTap: () => controller.runSpeaker(),
                                    child: McImageAssets(
                                      path: controller.model.isSpeaker
                                          ? "packages/mc_utils/assets/images/speaker.png"
                                          : "packages/mc_utils/assets/images/speaker_off.png",
                                      height:
                                          controller.model.isSpeaker ? 21 : 23,
                                      width:
                                          controller.model.isSpeaker ? 21 : 23,
                                      isCircle: false,
                                      pathImgError: controller.model.isSpeaker
                                          ? "packages/mc_utils/assets/images/speaker.png"
                                          : "packages/mc_utils/assets/images/speaker_off.png",
                                    ),
                                  ),
                                  // Fullscreen toggle button
                                  McIconTxt(
                                    icons: controller.model.showFullScreen
                                        ? Icons.fullscreen_exit
                                        : Icons.fullscreen,
                                    bgColor: Colors.white.withOpacity(0.0),
                                    sizeIcon: 30,
                                    rudisIcon: 15,
                                    onPress: () {
                                      if (controller.model.showFullScreen) {
                                        SystemChrome.setPreferredOrientations(
                                            []);
                                        controller.colseFullscreen();
                                        Navigator.of(context).pop();
                                      } else {
                                        controller.toggleFullscreen();
                                        _toggleFullscreen(context,
                                            controller.model.showFullScreen);
                                      }
                                    },
                                  ),
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
