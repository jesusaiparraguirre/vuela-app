import 'package:appvuela/@presentation/pages/video.dart';
import 'package:flutter/material.dart';

class ItemHome extends StatelessWidget {
  final String title;
  final String urlImage;
  final String urlVideo;
  final VoidCallback callback;
  const ItemHome({
    required this.title,
    required this.urlImage,
    required this.urlVideo,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: 220.0,
      width: _size.width,
      child: Stack(children: <Widget>[
        Container(
          height: 220.0,
          width: _size.width,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.0)),
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(9.0)),
            height: 175.0,
            child: InkWell(
              onTap: callback,
              child: Image(
                image: AssetImage(urlImage),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0.0,
            child: Container(
              height: 45.0,
              child: Row(children: <Widget>[
                Container(
                    width: 40.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                        color: Color(0xff000024),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(9.0),
                        )),
                    child: Icon(
                      Icons.video_camera_back_sharp,
                      color: Colors.white,
                    )),
                InkWell(
                  onTap: callback,
                  child: Container(
                    width: _size.width - 80.0,
                    height: 45.0,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: Color(0xffF28740),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(9.0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                )
              ]),
            )),
        Positioned(
          bottom: 22.0,
          right: 20.0,
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            onPressed: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => VideoPage(url: urlVideo)))
            },
            child: Icon(
              Icons.play_arrow,
              size: 35.0,
              color: Color(0xffF28740),
            ),
          ),
        ),
      ]),
    );
  }
}
