import 'dart:async';
import 'dart:io';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:get/get.dart';
import 'package:mc_utils/src/controller/video_player_model.dart';

class VideoPlayerController extends GetxController {
  final VideoPlayerModel model;
  Timer? _hideTimer;

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

  void togglePlayPause() {
    if (model.isPlaying) {
      model.controller.pause();
    } else {
      model.controller.play();
    }
    model.isPlaying = !model.isPlaying;
    update();
  }

  void stop() {
    model.controller.pause();
    model.controller.seekTo(Duration.zero);
    model.isPlaying = false;
    update();
  }

  String formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  void forward() {
    final newPosition = model.controller.value.position + Duration(seconds: 5);
    model.showProgressBar = true;
    model.controller.seekTo(newPosition);
    update();
  }

  void rewind() {
    final newPosition = model.controller.value.position - Duration(seconds: 5);
    model.controller.seekTo(newPosition);
    update();
  }

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

  void startVideo() {
    model.isStart = true;
    toggleControls();
    togglePlayPause();
    update();
  }

  void seekTo(Duration position) {
    model.showProgressBar = true;
    model.controller.seekTo(position);
    update();
  }

  void showProgressBar(bool show) {
    model.showProgressBar = show;
    update();
  }

  void toggleFullscreen() {
    model.showControls = false;
    model.showFullScreen = true;
    update();
  }

  void colseFullscreen() {
    model.showControls = false;
    model.showFullScreen = false;
    update();
  }

  void _startHideTimer() {
    _hideTimer?.cancel();
    if (model.isPlaying) {
      _hideTimer = Timer(const Duration(seconds: 4), () {
        model.showControls = false;
        update();
      });
    }
  }

  @override
  void onClose() {
    _hideTimer?.cancel();
    model.dispose();
    super.onClose();
  }
}
