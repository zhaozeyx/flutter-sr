import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayPage extends StatefulWidget {
  @override
  _VideoPlayPageState createState() => _VideoPlayPageState();
}

class _VideoPlayPageState extends State<VideoPlayPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  Future<void> initPlayer() async {
    _videoPlayerController = VideoPlayerController.network(
        "https://kvideo01.youju.sohu.com/7f40ba50-c8a8-487a-b1d0-8017d2081f7c2_0_0.mp4");
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        autoPlay: true,
        looping: true);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
    _chewieController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.transparent,
        child: Center(
          child: _chewieController != null &&
                  _chewieController!.videoPlayerController.value.initialized
              ? Chewie(
                  controller: _chewieController,
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
