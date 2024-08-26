import 'dart:async';
import 'dart:io';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:get/get.dart';
import 'package:mc_utils/src/controller/video_player_model.dart';

/// [VideoPlayerController] manages the lifecycle and state of the video player.
/// It handles the initialization of the video, playback controls (play, pause,
/// forward, rewind), display of UI controls, and fullscreen mode. This controller
/// also manages the volume settings and ensures the correct disposal of resources
/// when the controller is no longer needed.

class VideoPlayerController extends GetxController {
  final VideoPlayerModel model;
  Timer? _hideTimer;

  /// Initializes the [VideoPlayerController] with the provided [url] and [type],
  /// which determine the source of the video (network, file, or asset).
  VideoPlayerController({required String url, required int type})
      : model = VideoPlayerModel(
          controller: type == 1
              ? CachedVideoPlayerPlusController.networkUrl(
                  Uri.parse(url),
                  invalidateCacheIfOlderThan: const Duration(minutes: 10),
                )
              : type == 2
                  ? CachedVideoPlayerPlusController.file(
                      File(url),
                    )
                  : CachedVideoPlayerPlusController.asset(
                      url,
                    ),
        ) {
    initialize(url, type);
  }

  /// Initializes the video controller based on the video [url] and [type].
  void initialize(String url, int type) {
    if (type == 1) {
      model.controller = CachedVideoPlayerPlusController.networkUrl(
        Uri.parse(url),
        invalidateCacheIfOlderThan: const Duration(minutes: 10),
      )..initialize().then((_) {
          model.showControls = false;
          model.showProgressBar = false;
          update();
        });
    } else if (type == 2) {
      model.controller = CachedVideoPlayerPlusController.file(File(url))
        ..initialize().then((_) {
          model.showControls = false;
          model.showProgressBar = false;
          update();
        });
    } else {
      model.controller = CachedVideoPlayerPlusController.asset(
        url,
      )..initialize().then((_) {
          model.showControls = false;
          model.showProgressBar = false;
          update();
        });
    }
    model.controller.addListener(
      () {
        if (model.controller.value.isInitialized && model.showProgressBar) {
          model.showProgressBar = false;
          update();
        }
      },
    );
  }

  /// Toggles between play and pause states for the video.
  void togglePlayPause() {
    if (model.isPlaying) {
      model.controller.pause();
    } else {
      model.controller.play();
    }
    model.isPlaying = !model.isPlaying;
    update();
  }

  /// Stops the video and resets it to the beginning.
  void stop() {
    model.controller.pause();
    model.controller.seekTo(Duration.zero);
    model.isPlaying = false;
    update();
  }

  /// Formats the [duration] to a string in 'minutes:seconds' format.
  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  /// Forwards the video by 5 seconds.
  void forward() {
    final newPosition = model.controller.value.position + Duration(seconds: 5);
    model.showProgressBar = true;
    model.controller.seekTo(newPosition);
    update();
  }

  /// Rewinds the video by 5 seconds.
  void rewind() {
    final newPosition = model.controller.value.position - Duration(seconds: 5);
    model.controller.seekTo(newPosition);
    update();
  }

  /// Toggles the visibility of the video player controls.
  void toggleControls() {
    if (model.isStart) {
      model.showControls = !model.showControls;
      if (model.showControls) {
        _startHideTimer();
      } else {
        _hideTimer?.cancel();
      }
    }
    update();
  }

  /// Starts the video playback and shows the controls.
  void startVideo() {
    model.isStart = true;
    toggleControls();
    togglePlayPause();
    update();
  }

  /// Seeks the video to the specified [position].
  void seekTo(Duration position) {
    model.showProgressBar = true;
    model.controller.seekTo(position);
    update();
  }

  /// Shows or hides the progress bar based on the [show] parameter.
  void showProgressBar(bool show) {
    model.showProgressBar = show;
    update();
  }

  /// Toggles fullscreen mode for the video player.
  void toggleFullscreen() {
    model.showControls = false;
    model.showFullScreen = true;
    update();
  }

  /// Exits fullscreen mode for the video player.
  void colseFullscreen() {
    model.showControls = false;
    model.showFullScreen = false;
    update();
  }

  /// Starts a timer to hide the controls after a delay if the video is playing.
  void _startHideTimer() {
    _hideTimer?.cancel();
    if (model.isPlaying) {
      _hideTimer = Timer(const Duration(seconds: 4), () {
        model.showControls = false;
        update();
      });
    }
  }

  /// Toggles the speaker on and off by adjusting the volume.
  void runSpeaker() {
    if (model.isSpeaker) {
      model.controller.setVolume(0.0);
    } else {
      model.controller.setVolume(1.0);
    }
    model.isSpeaker = !model.isSpeaker;
    update();
  }

  /// Cleans up resources by cancelling timers and disposing of the video controller.
  @override
  void onClose() {
    _hideTimer?.cancel();
    model.dispose();
    super.onClose();
  }
}
