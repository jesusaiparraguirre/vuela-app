import 'package:appvuela/@presentation/pages/videoDownload.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class VideoPage extends StatefulWidget {
  String url;
  VideoPage({required this.url});
  @override
  State<StatefulWidget> createState() {
    return VideoState();
  }
}

class VideoState extends State<VideoPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    // _controller = VideoPlayerController.asset('assets/images/dbz.mp4');
    _controller = VideoPlayerController.network(widget.url);
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: _size.width,
            height: _size.height,
            child: Column(
              children: [
                FutureBuilder(
                  future: _initializeVideoPlayerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return Container(
                        width: _size.width,
                        height: _size.height,
                        // aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20.0,
            left: _size.width * 0.44,
            child: Container(
              width: 110.0,
              height: 35.0,
              decoration: BoxDecoration(
                  color: Color(0xffF28740),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Material(
                color: Color(0xffF28740),
                borderRadius: BorderRadius.circular(9.0),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => VideoDownLoadPage(
                            url:
                                'http://147.182.138.100:4000/2021-09-23/video_001/16/16-03-05-16-11-04.mp4')));
                  },
                  borderRadius: BorderRadius.circular(9.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('02:15 hrs',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Open Sans')),
                      Icon(Icons.download, color: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
