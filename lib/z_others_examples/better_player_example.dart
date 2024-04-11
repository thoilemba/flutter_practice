import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class VideoPlayerScreen extends StatelessWidget {

  VideoPlayerScreen({super.key});

  final BetterPlayerController _controller = BetterPlayerController(
    const BetterPlayerConfiguration(
      autoPlay: true,

      // looping: true,
      // aspectRatio: 16 / 9,

      fullScreenByDefault: true,
      controlsConfiguration: BetterPlayerControlsConfiguration(
        controlBarColor: Colors.black26,
      ),
    ),
    betterPlayerDataSource: BetterPlayerDataSource.network(
      "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    ),
    betterPlayerPlaylistConfiguration: const BetterPlayerPlaylistConfiguration(

    )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Better Player"),
      ),
      body: AspectRatio(
        aspectRatio: 16 / 9,
        child: BetterPlayer(controller: _controller),
      ),
    );
  }
}


class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          // color: Colors.red,
          child: const Text('Go to video screen'),
          // Navigate to Screen 2
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return VideoPlayerScreen();
            }));
          },
        ),
      ),
    );
  }
}

