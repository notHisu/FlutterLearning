import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final String videoUrl;

  const VideoPlayerWidget({Key? key, required this.videoUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return VideoPlayerWidgetWidget(
              videoPlayerController: snapshot.data as VideoPlayerController);
        }
      },
    );
  }

  Future<VideoPlayerController> _initializeVideoPlayerFuture() async {
    //final videoPlayerController = VideoPlayerController.network(videoUrl);
    final videoPlayerController = VideoPlayerController.asset(videoUrl);

    await videoPlayerController.initialize();
    return videoPlayerController;
  }
}

class VideoPlayerWidgetWidget extends StatefulWidget {
  final VideoPlayerController videoPlayerController;

  const VideoPlayerWidgetWidget({Key? key, required this.videoPlayerController})
      : super(key: key);

  @override
  State<VideoPlayerWidgetWidget> createState() =>
      _VideoPlayerWidgetWidgetState();
}

class _VideoPlayerWidgetWidgetState extends State<VideoPlayerWidgetWidget> {
  @override
  void initState() {
    super.initState();
    widget.videoPlayerController.play();
  }

  @override
  void dispose() {
    widget.videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.videoPlayerController.value.aspectRatio,
      child: VideoPlayer(widget.videoPlayerController),
    );
  }
}
