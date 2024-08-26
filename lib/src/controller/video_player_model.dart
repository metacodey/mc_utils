import 'package:cached_video_player_plus/cached_video_player_plus.dart';

/// [VideoPlayerModel] serves as the data model for managing the state of the video player.
/// It holds the controller for the video, as well as various flags to track playback state,
/// UI visibility (such as controls, progress bar, and fullscreen mode), and audio settings.

class VideoPlayerModel {
  late CachedVideoPlayerPlusController controller;

  bool isPlaying = false;
  bool isStart = false;
  bool showControls = false;
  bool showProgressBar = false;
  bool showFullScreen = false;
  bool isSpeaker = true;

  /// Constructor for [VideoPlayerModel], which requires a [CachedVideoPlayerPlusController].
  VideoPlayerModel({required this.controller});

  /// Disposes the video controller when it's no longer needed.
  void dispose() {
    controller.dispose();
  }
}
