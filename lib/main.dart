import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _player = AudioCache(
    fixedPlayer: AudioPlayer(),
  );
  var audioSource;

  Future setSource() async {
    audioSource = await _player.loop('test.mp3', volume: 0.2);
  }

  @override
  void initState() {
    setSource();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FlutterMusicPlayer"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '再生中',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () => audioSource.pause(),
                    icon: const Icon(
                      Icons.pause,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => audioSource.resume(),
                    icon: const Icon(
                      Icons.navigate_next,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () => audioSource.stop(),
                    icon: const Icon(
                      Icons.stop,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
