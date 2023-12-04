import 'package:another_quiz/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String audioUrl;

  const AudioPlayerWidget({Key? key, required this.audioUrl}) : super(key: key);

  @override
  State<AudioPlayerWidget> createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer player;
  late Future<void> _initializeFuture;
  bool isPlaying = false;

  @override
  void initState() {
    super.initState();
    // Create the audio player.
    player = AudioPlayer();

    // Initialize the audio player. This will return a Future that completes
    // when the audio file is loaded and ready to play.
    _initializeFuture = player.setSource(AssetSource(widget.audioUrl));
  }

  @override
  void dispose() {
    // Dispose of the player when the widget is disposed.
    player.dispose();
    super.dispose();
  }

  void playAudio() async {
    await _initializeFuture;
    await player.play(AssetSource(widget.audioUrl));
    setState(() {
      isPlaying = true;
    });
  }

  void pauseAudio() async {
    await player.pause();
    setState(() {
      isPlaying = false;
    });
  }

  void resumeAudio() async {
    await player.resume();
    setState(() {
      isPlaying = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                ),
                onPressed: isPlaying ? pauseAudio : playAudio,
                child: isPlaying
                    ? const Icon(Icons.pause)
                    : const Icon(Icons.play_arrow),
              ),
              const SizedBox(width: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                ),
                onPressed: resumeAudio,
                child: const Icon(Icons.repeat),
              ),
              const SizedBox(width: 16.0),
            ],
          );
        }
      },
    );
  }
}
