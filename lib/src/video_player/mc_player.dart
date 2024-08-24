import 'dart:io';

import 'package:flutter/material.dart';

import 'mc_video_player.dart';

class McPlayer {
  static Widget network({required String url}) {
    return McVideoPlayer(
      url: url,
      type: 1,
    );
  }

  static Widget file({required File file}) {
    return McVideoPlayer(
      url: file.path,
      type: 2,
    );
  }

  static Widget asset({required String path}) {
    return McVideoPlayer(
      url: path,
      type: 3,
    );
  }
}
