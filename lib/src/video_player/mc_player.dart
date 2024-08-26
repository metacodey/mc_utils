import 'dart:io';

import 'package:flutter/material.dart';

import 'mc_video_player.dart';

/// [McPlayer] is a utility class for creating video player widgets from different sources.
///
/// It provides static methods for creating a [McVideoPlayer] widget for:
/// - **Network Videos:** Use the `network` method with a URL to play videos from the network.
/// - **Local Files:** Use the `file` method with a [File] object to play videos stored locally.
/// - **Assets:** Use the `asset` method with a path to play videos bundled with the app.
///
/// Example Usage:
/// ```dart
// // For network video
/// McPlayer.network(url: 'https://example.com/video.mp4');
///
/// // For local file
/// McPlayer.file(file: File('/path/to/video.mp4'));
///
/// // For asset video
/// McPlayer.asset(path: 'assets/videos/video.mp4');
/// ```

class McPlayer {
  /// Creates a [McVideoPlayer] widget for a network video.
  static Widget network({required String url}) {
    return McVideoPlayer(
      url: url,
      type: 1,
    );
  }

  /// Creates a [McVideoPlayer] widget for a local video file.
  static Widget file({required File file}) {
    return McVideoPlayer(
      url: file.path,
      type: 2,
    );
  }

  /// Creates a [McVideoPlayer] widget for an asset video.
  static Widget asset({required String path}) {
    return McVideoPlayer(
      url: path,
      type: 3,
    );
  }
}
