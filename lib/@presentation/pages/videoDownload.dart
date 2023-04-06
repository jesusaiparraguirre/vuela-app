import 'package:appvuela/@presentation/pages/home.dart';
import 'package:appvuela/@presentation/shared/dialog.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';
import 'dart:math' as math;

class VideoDownLoadPage extends StatefulWidget {
  String url;
  VideoDownLoadPage({required this.url});
  @override
  State<StatefulWidget> createState() {
    return VideoDownloadState();
  }
}

class VideoDownloadState extends State<VideoDownLoadPage> {
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
      body: CustomScrollView(slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate([
            Row(
              children: [
                Container(
                  width: _size.width * 0.5,
                  height: _size.height,
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          GestureDetector(
                            child: Icon(
                              Icons.keyboard_backspace,
                              size: 35.0,
                            ),
                            onTap: () {
                              // setState(() {
                              //   infoTechnical = false;
                              // });
                            },
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'DESCARGAR',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color(0xff000024),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        'Lunes, 01 de Noviembre',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color(0xff000024),
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Container(
                            height: 45.0,
                            width: _size.width * 0.1 - 10.0,
                            child: Icon(Icons.keyboard_backspace),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffADACBC)),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(5.0),
                                    bottomLeft: Radius.circular(5.0))),
                          ),
                          Container(
                              height: 45.0,
                              width: _size.width * 0.3 - 20,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F6F8),
                                border: Border(
                                    top: BorderSide(color: Color(0xffADACBC)),
                                    bottom:
                                        BorderSide(color: Color(0xffADACBC))),
                              ),
                              child: Center(
                                child: Text(
                                  '02:00 - 03:00 hrs',
                                  style: TextStyle(
                                      color: Color(0xff413F60),
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: 'Open Sans'),
                                ),
                              )),
                          Container(
                            height: 45.0,
                            width: _size.width * 0.1 - 10.0,
                            child: Transform.rotate(
                                angle: 180 * math.pi / 180,
                                child: Icon(Icons.keyboard_backspace)),
                            decoration: BoxDecoration(
                                border: Border.all(color: Color(0xffADACBC)),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(5.0),
                                    bottomRight: Radius.circular(5.0))),
                          )
                        ],
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Selecciona los bloques a descargar',
                        style: TextStyle(
                            color: Color(0xff413F60),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Open Sans'),
                      ),
                      SizedBox(height: 10.0),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 45.0,
                                    width: _size.width * 0.25 - 25,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF5F6F8),
                                        border: Border.all(
                                            color: Color(0xffADACBC)),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                      child: Text(
                                        '02:00 - 02:10',
                                        style: TextStyle(
                                            color: Color(0xff413F60),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Open Sans'),
                                      ),
                                    )),
                                Container(
                                    height: 45.0,
                                    width: _size.width * 0.25 - 25,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF28740),
                                        border: Border.all(
                                            color: Color(0xffF28740)),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                      child: Text(
                                        '02:10 - 02:20',
                                        style: TextStyle(
                                            color: Color(0xFFFFFFFF),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Open Sans'),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 45.0,
                                    width: _size.width * 0.25 - 25,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF5F6F8),
                                        border: Border.all(
                                            color: Color(0xffADACBC)),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                      child: Text(
                                        '02:20 - 02:30',
                                        style: TextStyle(
                                            color: Color(0xff413F60),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Open Sans'),
                                      ),
                                    )),
                                Container(
                                    height: 45.0,
                                    width: _size.width * 0.25 - 25,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF5F6F8),
                                        border: Border.all(
                                            color: Color(0xffADACBC)),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                      child: Text(
                                        '02:30 - 02:40',
                                        style: TextStyle(
                                            color: Color(0xff413F60),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Open Sans'),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(height: 5.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    height: 45.0,
                                    width: _size.width * 0.25 - 25,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF5F6F8),
                                        border: Border.all(
                                            color: Color(0xffADACBC)),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                      child: Text(
                                        '02:40 - 02:50',
                                        style: TextStyle(
                                            color: Color(0xff413F60),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Open Sans'),
                                      ),
                                    )),
                                Container(
                                    height: 45.0,
                                    width: _size.width * 0.25 - 25,
                                    decoration: BoxDecoration(
                                        color: Color(0xffF5F6F8),
                                        border: Border.all(
                                            color: Color(0xffADACBC)),
                                        borderRadius:
                                            BorderRadius.circular(5.0)),
                                    child: Center(
                                      child: Text(
                                        '02:50 - 03:00',
                                        style: TextStyle(
                                            color: Color(0xff413F60),
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Open Sans'),
                                      ),
                                    )),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            Container(
                                height: 45.0,
                                width: _size.width,
                                decoration: BoxDecoration(
                                    color: Color(0xffF28740),
                                    border:
                                        Border.all(color: Color(0xffF28740)),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Material(
                                  color: Color(0xffF28740),
                                  borderRadius: BorderRadius.circular(5.0),
                                  child: InkWell(
                                    onTap: () {
                                      showDialog<String>(
                                          context: context,
                                          builder:
                                              (BuildContext context) => Dialog(
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                    child: Container(
                                                      height: 289.0,
                                                      width: _size.width * 0.51,
                                                      child: Column(
                                                        children: <Widget>[
                                                          SizedBox(
                                                              height: 25.0),
                                                          Text(
                                                            'Solicitar Descarga',
                                                            textAlign:
                                                                TextAlign.left,
                                                            style: TextStyle(
                                                                color: Color(
                                                                    0xff000024),
                                                                fontSize: 24.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                              height: 25.0),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        25.0),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                    height:
                                                                        45.0,
                                                                    width: _size.width *
                                                                            0.25 -
                                                                        25,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(
                                                                            0xffF5F6F8),
                                                                        border: Border.all(
                                                                            color: Color(
                                                                                0xffADACBC)),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5.0)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        '02:40 - 02:50',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff413F60),
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontFamily: 'Open Sans'),
                                                                      ),
                                                                    )),
                                                                Container(
                                                                    height:
                                                                        45.0,
                                                                    width: _size.width *
                                                                            0.25 -
                                                                        25,
                                                                    decoration: BoxDecoration(
                                                                        color: Color(
                                                                            0xffF5F6F8),
                                                                        border: Border.all(
                                                                            color: Color(
                                                                                0xffADACBC)),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                                5.0)),
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        '02:50 - 03:00',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff413F60),
                                                                            fontSize:
                                                                                16.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontFamily: 'Open Sans'),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: 35.0),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        25.0),
                                                            child: Text(
                                                              'Obtén una copia en tu Gmail de las grabaciones que has descargado.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff413F60),
                                                                  fontSize:
                                                                      14.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontFamily:
                                                                      'Open Sans'),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              height: 25.0),
                                                          Row(
                                                            children: <Widget>[
                                                              Container(
                                                                height: 60.0,
                                                                width:
                                                                    _size.width *
                                                                            0.25 +
                                                                        3.5,
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        0xffF5F6F8),
                                                                    borderRadius:
                                                                        BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(9.0))),
                                                                child: Material(
                                                                  borderRadius:
                                                                      BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(9.0)),
                                                                  child:
                                                                      InkWell(
                                                                    borderRadius:
                                                                        BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(9.0)),
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        'Cancelar',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xff000024),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            fontFamily: 'Open Sans'),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                height: 60.0,
                                                                width:
                                                                    _size.width *
                                                                            0.25 +
                                                                        3.5,
                                                                decoration: BoxDecoration(
                                                                    color: Color(
                                                                        0xffF28740),
                                                                    borderRadius:
                                                                        BorderRadius.only(
                                                                            bottomRight:
                                                                                Radius.circular(9.0))),
                                                                child: Material(
                                                                  borderRadius:
                                                                      BorderRadius.only(
                                                                          bottomRight:
                                                                              Radius.circular(9.0)),
                                                                  color: Color(
                                                                      0xffF28740),
                                                                  child:
                                                                      InkWell(
                                                                    borderRadius:
                                                                        BorderRadius.only(
                                                                            bottomRight:
                                                                                Radius.circular(9.0)),
                                                                    onTap: () {
                                                                      Navigator.pop(
                                                                          context);
                                                                      showDialog<
                                                                          String>(
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (BuildContext context) =>
                                                                                Dialog(
                                                                          insetPadding:
                                                                              EdgeInsets.symmetric(horizontal: 200.0),
                                                                          shape:
                                                                              RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                                          child:
                                                                              DialogCustom(
                                                                            colorIcon:
                                                                                Color(0xff000024),
                                                                            title:
                                                                                'Solicitud Enviada',
                                                                            urlIcon:
                                                                                'assets/images/Icon simple-minutemailer.svg',
                                                                            message:
                                                                                'Tu solicitud ha sido enviada con éxito. Recibirás un Gmail para la confirmación del registro de tu cuenta. ',
                                                                            btnText:
                                                                                'ENTENDIDO',
                                                                            btnSecond:
                                                                                false,
                                                                            btnSecondText:
                                                                                '',
                                                                            svg:
                                                                                true,
                                                                            messageLines:
                                                                                3,
                                                                            callback: () =>
                                                                                {
                                                                              SystemChrome.setPreferredOrientations([
                                                                                DeviceOrientation.landscapeRight,
                                                                                DeviceOrientation.landscapeLeft,
                                                                                DeviceOrientation.portraitUp,
                                                                                DeviceOrientation.portraitDown,
                                                                              ]),
                                                                              _controller.dispose(),
                                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage(userPrimary: true))),

                                                                              // Navigator.of(context).push(MaterialPageRoute(
                                                                              //     builder: (context) =>
                                                                              //         LoginPage(showOptions: true)))
                                                                            },
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child:
                                                                        Center(
                                                                      child:
                                                                          Text(
                                                                        'Enviar Solicitud',
                                                                        style: TextStyle(
                                                                            color: Color(
                                                                                0xffFFFFFF),
                                                                            fontSize:
                                                                                18.0,
                                                                            fontWeight:
                                                                                FontWeight.w700,
                                                                            fontFamily: 'Open Sans'),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                    },
                                    borderRadius: BorderRadius.circular(5.0),
                                    child: Center(
                                      child: Text(
                                        'Solicitar descarga',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Open Sans'),
                                      ),
                                    ),
                                  ),
                                )),
                          ])
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      width: _size.width * 0.5,
                      height: _size.height,
                      child: Column(
                        children: [
                          FutureBuilder(
                            future: _initializeVideoPlayerFuture,
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.done) {
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
                  ],
                ),
              ],
            ),
          ]),
        )
      ]),
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
