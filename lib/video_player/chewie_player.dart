// import 'package:chewie/chewie.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:video_player/video_player.dart';
//
//
//
// const videoAspectRatio = 16 / 9;
//
// class ChewiePlayerScreen extends StatefulWidget {
//   const ChewiePlayerScreen({
//     super.key,
//     required this.videoUrl,
//   });
//
//   final String videoUrl;
//
//   @override
//   State<ChewiePlayerScreen> createState() => _CourseVideoState();
// }
//
// class _CourseVideoState extends State<ChewiePlayerScreen> {
//   late VideoPlayerController _controller;
//   late ChewieController _chewieController;
//
//   void _initPlayer() async {
//     _controller = VideoPlayerController.networkUrl(
//       Uri.parse(widget.videoUrl),
//     );
//
//     _chewieController = ChewieController(
//       // aspectRatio: videoAspectRatio,
//       videoPlayerController: _controller,
//       autoInitialize: true,
//       deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
//       allowPlaybackSpeedChanging: false,
//       showOptions: false,
//       allowMuting: false,
//       autoPlay: true,
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _initPlayer();
//
//     // return AspectRatio(
//     //   aspectRatio: _chewieController.aspectRatio ?? videoAspectRatio,
//     //   child: Chewie(controller: _chewieController),
//     // );
//
//     return Scaffold(
//       backgroundColor: Colors.grey,
//       appBar: AppBar(
//         title: const Text("Better Player"),
//       ),
//       body: AspectRatio(
//         aspectRatio: 16 / 9,
//         child: Chewie(controller: _chewieController),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     _chewieController.dispose();
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeLeft,
//     ]);
//     super.dispose();
//   }
// }
//
// // Call this class in the main screen
//
// class FirstScreen extends StatelessWidget {
//   const FirstScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('First Screen'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           // color: Colors.red,
//           child: const Text('Go to video screen'),
//           // Navigate to Screen 2
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context){
//               return const ChewiePlayerScreen(
//                 videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
//               );
//             }));
//           },
//         ),
//       ),
//     );
//   }
// }
//
