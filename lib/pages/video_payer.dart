import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerPage extends StatefulWidget {
  VideoPlayerPage({Key key, this.link}) : super(key: key);
  final String link;

  @override
  _VideoPlayerPageState createState() => _VideoPlayerPageState(url: link);
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  _VideoPlayerPageState({this.url});
  final String url;
  VideoPlayerController _controller;

  Future<void> _initializeVideoPlayer;

  @override
  void initState() {
    _controller = VideoPlayerController.network(url);
    _initializeVideoPlayer = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reproductor'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: FutureBuilder(
                future: _initializeVideoPlayer,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    );
                  } else {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 20),
          FloatingActionButton(
            mini: true,
            heroTag: 'stop',
            child: Icon(Icons.stop),
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                }
              });
            },
          ),
          FloatingActionButton(
            heroTag: 'play',
            tooltip: 'Play',
            child: Icon(Icons.play_arrow),
            onPressed: () {
              setState(() {
                _controller.play();
              });
            },
          ),
          FloatingActionButton(
            mini: true,
            heroTag: 'pause',
            child: Icon(Icons.pause),
            onPressed: () {
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
