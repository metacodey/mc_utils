import 'package:cached_video_player_plus/cached_video_player_plus.dart';

class VideoPlayerModel {
  late CachedVideoPlayerPlusController controller;

  bool isPlaying = false;
  bool isStart = false;
  bool showControls = false;
  bool showProgressBar = false; // Add this property
  bool showFullScreen = false;

  VideoPlayerModel({required this.controller});

  void dispose() {
    controller.dispose();
  }
}
