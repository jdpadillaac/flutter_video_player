import 'package:flutter/material.dart';
import 'package:flutter_video/pages/video_payer.dart';
import 'package:flutter_video/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: homeDrawer,
      appBar: AppBar(
        title: Text('Listado de video'),
      ),
      body: Container(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(80),
            child: Column(
              children: [
                _botonUno(
                    'Video 1',
                    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_5mb.mp4',
                    context),
                SizedBox(height: 20),
                _botonUno(
                    'Video 2',
                    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4',
                    context),
                SizedBox(height: 20),
                _botonUno(
                    'Video 3',
                    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
                    context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  InkWell _botonUno(String title, String link, context) {
    return InkWell(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue)),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.play_arrow,
              color: Colors.blue,
            ),
            SizedBox(width: 10),
            Text(title),
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return VideoPlayerPage(
              link: link,
            );
          },
        ));
      },
    );
  }
}
