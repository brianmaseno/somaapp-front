import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VideoPlayerScreen extends StatefulWidget {
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> with SingleTickerProviderStateMixin {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;
  late AnimationController _animationController;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset('assets/video2.mp4');
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      looping: true,
      showControls: false, // Hide the video controls
      showControlsOnInitialize: false, // Don't show controls on initialization
      allowFullScreen: false, // Disable full-screen mode
      allowPlaybackSpeedChanging: false, // Disable playback speed changing
      allowMuting: false, // Disable muting
    );

    _animationController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 1),
      // end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

    _animationController.forward();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Chewie(
          controller: _chewieController,
        ),
        // SlideTransition(
        //   position: _animation,
        //   child: Container(
        //     color: Colors.black54,
        //     // child: Center(
        //     //   child: Text(
        //     //     'Welcome to Soma App!',
        //     //     style: TextStyle(
        //     //       fontSize: 24,
        //     //       fontWeight: FontWeight.bold,
        //     //       color: Colors.white,
        //     //     ),
        //     //   ),
        //     // ),
        //   ),
        // ),
      ],
    );
  }
}