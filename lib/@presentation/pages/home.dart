import 'dart:developer';
import 'package:appvuela/@presentation/pages/video.dart';
import 'package:appvuela/@presentation/shared/dialog.dart';
import 'package:appvuela/@presentation/shared/itemDialog.dart';
import 'package:appvuela/@presentation/shared/itemDialogIcon.dart';
import 'package:appvuela/@presentation/shared/itemHome.dart';
import 'package:appvuela/@presentation/shared/itemHomeGroup.dart';
import 'package:appvuela/@presentation/shared/itemProfileUserSecondary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:appvuela/@presentation/shared/btnForm.dart';
import 'package:appvuela/@presentation/shared/btnProfile.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  final bool userPrimary;
  const HomePage({
    required this.userPrimary,
  });
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomePage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool _switchValue = false;
  int _selectedIndex = 0;
  bool showGroupHome = false;
  bool showGroupHomeDetail = false;
  bool showDetailHistory = false;
  bool showRecords = false;
  bool infoTechnical = false;
  bool showUserInfo = false;
  bool showUserSecondary = false;
  bool showUserHelp = false;
  bool showUserAboutUs = false;
  bool showUserPay = false;
  bool showUserSecondaryDetail = false;
  bool showUserDoc = false;
  bool showUserDocDetail = false;

  @override
  void initState() {
    // final File file = File('assets/images/dbz.mp4');
    _controller = VideoPlayerController.asset('assets/images/dbz.mp4');

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    // _controller.play();

    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      _home(context),
      _camera(context),
      _profile(context)
    ];

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate(
                [_widgetOptions.elementAt(_selectedIndex)]),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: 'Cámaras',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            label: 'Yo',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }

  Widget _home(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: (() {
        if (showGroupHome && !showGroupHomeDetail) {
          return _homeGroup(context);
        } else if (showGroupHome && showGroupHomeDetail) {
          return _homeGroupDetail(context);
        }
        return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Text(
                'INICIO',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff000024),
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15.0, top: 35.0),
                    hintText: '¿Buscas algo?',
                    fillColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Color(0xffF28740), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Color(0xffC2C1C7), width: 1.5),
                    ),
                    suffixIcon: Icon(Icons.search),
                    labelStyle: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        color: Colors.black),
                    alignLabelWithHint: true,
                  ),
                ),
              ),
              Row(children: <Widget>[
                Container(
                  height: 40.0,
                  width: _size.width * 0.5 - 20.0,
                  child: Material(
                    color: Color(0xffF28740),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0)),
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.white),
                          SizedBox(
                            width: 5.0,
                          ),
                          Text(
                            'Favoritas',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      onTap: () {
                        setState(() {
                          showGroupHome = false;
                        });
                      },
                    ),
                  ),
                ),
                Row(children: <Widget>[
                  Container(
                    height: 40.0,
                    width: _size.width * 0.5 - 20.0,
                    child: Material(
                      color: Color(0xffF0EBE8),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      child: InkWell(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.grain_outlined,
                                color: Color(0xffADACBC)),
                            SizedBox(
                              width: 5.0,
                            ),
                            Text(
                              'Grupos',
                              style: TextStyle(
                                  color: Color(0xffADACBC),
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        onTap: () {
                          setState(() {
                            showGroupHome = true;
                          });
                        },
                      ),
                    ),
                  )
                ])
              ]),
              SizedBox(height: 20.0),
              ItemHome(
                callback: () {
                  _onItemTapped(1);
                  setState(() {
                    showDetailHistory = true;
                  });
                },
                title: 'Sala principal',
                urlImage: 'assets/images/imagevideo.jpg',
                urlVideo:
                    'http://147.182.138.100:4000/2021-09-23/video_001/15/15-07-07-15-15-00.mp4',
              ),
              SizedBox(height: 20.0),
              ItemHome(
                callback: () {
                  _onItemTapped(1);
                  setState(() {
                    showDetailHistory = true;
                  });
                },
                title: 'Oficina',
                urlImage: 'assets/images/home2.png',
                urlVideo:
                    'http://147.182.138.100:4000/2021-09-23/video_001/16/16-03-05-16-11-04.mp4',
              ),
              SizedBox(height: 20.0),
              ItemHome(
                  callback: () {
                    _onItemTapped(1);
                    setState(() {
                      showDetailHistory = true;
                    });
                  },
                  title: 'Parqueadero',
                  urlImage: 'assets/images/home3.png',
                  urlVideo:
                      'http://147.182.138.100:4000/2021-09-23/video_001/16/16-03-05-16-11-04.mp4'),
            ]);
      }()),
    );
  }

  Widget _homeGroup(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Text(
          'INICIO',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color(0xff000024),
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 25.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15.0, top: 35.0),
              hintText: '¿Buscas algo?',
              fillColor: Colors.white,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xffF28740), width: 2.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide(color: Color(0xffC2C1C7), width: 1.5),
              ),
              suffixIcon: Icon(Icons.search),
              labelStyle: TextStyle(
                  fontFamily: 'Roboto', fontSize: 15, color: Colors.black),
              alignLabelWithHint: true,
            ),
          ),
        ),
        Row(children: <Widget>[
          Container(
            height: 40.0,
            width: _size.width * 0.5 - 20.0,
            child: Material(
              color: Color(0xffF0EBE8),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0)),
              child: InkWell(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.star, color: Color(0xffADACBC)),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      'Favoritas',
                      style: TextStyle(
                          color: Color(0xffADACBC),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                onTap: () {
                  setState(() {
                    showGroupHome = false;
                  });
                },
              ),
            ),
          ),
          Row(children: <Widget>[
            Container(
              height: 40.0,
              width: _size.width * 0.5 - 20.0,
              child: Material(
                color: Color(0xffF28740),
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                child: InkWell(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.grain_outlined, color: Colors.white),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        'Grupos',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      showGroupHome = true;
                    });
                  },
                ),
              ),
            )
          ])
        ]),
        SizedBox(height: 30.0),
        ItemHomeGroup(
          icon: SvgPicture.asset(
            'assets/images/Icon awesome-toilet.svg',
            fit: BoxFit.values[5],
            color: Colors.white,
          ),
          title: 'Casa Ciudad',
          number: '3',
          callback: () {
            setState(() {
              showGroupHomeDetail = true;
            });
          },
        ),
        SizedBox(height: 10.0),
        ItemHomeGroup(
          icon: SvgPicture.asset(
            'assets/images/Icon metro-video-camera.svg',
            fit: BoxFit.values[5],
            color: Colors.white,
          ),
          title: 'Congeladores del 3er piso de carnes rojas',
          number: '2',
          callback: () {
            setState(() {
              showGroupHomeDetail = true;
            });
          },
        ),
        SizedBox(height: 10.0),
        ItemHomeGroup(
          icon: SvgPicture.asset(
            'assets/images/Icon awesome-toilet.svg',
            fit: BoxFit.values[5],
            color: Colors.white,
          ),
          title: 'Almacén de la bodega principal',
          number: '3',
          callback: () {
            setState(() {
              showGroupHomeDetail = true;
            });
          },
        ),
        SizedBox(height: 10.0),
        ItemHomeGroup(
          icon: SvgPicture.asset(
            'assets/images/Icon metro-video-camera.svg',
            fit: BoxFit.values[5],
            color: Colors.white,
          ),
          title: 'Congeladores del 3er piso de carnes rojas',
          number: '2',
          callback: () {
            setState(() {
              showGroupHomeDetail = true;
            });
          },
        ),
        SizedBox(height: 15.0),
        Container(
          width: _size.width,
          height: 75.0,
          decoration: BoxDecoration(
            color: Color(0xffADACBC),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Material(
              color: Color(0xffADACBC),
              borderRadius: BorderRadius.circular(10.0),
              child: InkWell(
                  child: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.add, color: Colors.white),
                          Text(
                            'Crear Grupo',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.5,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Container(
                              width: _size.width,
                              height: 310.0,
                              padding: EdgeInsets.only(top: 25.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                color: Colors.white,
                              ),
                              child: Column(children: <Widget>[
                                Text(
                                  'Crear Grupo',
                                  style: TextStyle(
                                      color: Color(0xff000024),
                                      fontSize: 26.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Text(
                                  'INGRESA UN NOMBRE A TU GRUPO',
                                  style: TextStyle(
                                      color: Color(0xff413F60),
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 5.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0,
                                      bottom: 25.0,
                                      left: 15.0,
                                      right: 15.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 15.0, top: 35.0),
                                      hintText: 'Escribir aquí',
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xffF28740),
                                            width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xffC2C1C7),
                                            width: 1.5),
                                      ),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 15,
                                          color: Colors.black),
                                      alignLabelWithHint: true,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: _size.width,
                                  height: 60.0,
                                  child: Material(
                                    color: Color(0xffF5F6F8),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(3.9),
                                        bottomLeft: Radius.circular(3.9)),
                                    child: InkWell(
                                        child: Container(
                                          width: _size.width,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 15.0,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Cancelar',
                                                style: TextStyle(
                                                    color: Color(0xff000024),
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Container(
                                                width: 25.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        }),
                                  ),
                                ),
                                Container(
                                  width: _size.width,
                                  height: 60.0,
                                  child: Material(
                                    color: Color(0xff000024),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10)),
                                    child: InkWell(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(10),
                                            bottomLeft: Radius.circular(10)),
                                        child: Container(
                                          width: _size.width,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 15.0,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Siguiente (1/3)',
                                                style: TextStyle(
                                                    color: Color(0xffFFFFFF),
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Container(
                                                width: 25.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                          showDialog<String>(
                                              context: context,
                                              builder:
                                                  (BuildContext context) =>
                                                      Dialog(
                                                        insetPadding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    20.0),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        10.0))),
                                                        child: Container(
                                                            width: _size.width,
                                                            height: 485.0,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 25.0),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15.0),
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                  'Crear Grupo',
                                                                  style: TextStyle(
                                                                      color: Color(
                                                                          0xff000024),
                                                                      fontSize:
                                                                          26.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                ),
                                                                SizedBox(
                                                                  height: 5.0,
                                                                ),
                                                                Text(
                                                                  'SELECCIONA LAS CÁMARAS PARA AGRUPAR',
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
                                                                              .w500),
                                                                ),
                                                                SizedBox(
                                                                  height: 15.0,
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          15.0),
                                                                  child: Column(
                                                                    children: [
                                                                      ItemDialog(
                                                                          name:
                                                                              'Lorem Ipsum Jipsum',
                                                                          description:
                                                                              'Cámara 04',
                                                                          position:
                                                                              1),
                                                                      ItemDialog(
                                                                          name:
                                                                              'Lorem Ipsum Jipsum',
                                                                          description:
                                                                              'Cámara 04',
                                                                          position:
                                                                              2),
                                                                      ItemDialog(
                                                                          name:
                                                                              'Lorem Ipsum Jipsum',
                                                                          description:
                                                                              'Cámara 04',
                                                                          position:
                                                                              2),
                                                                      ItemDialog(
                                                                          name:
                                                                              'Lorem Ipsum Jipsum',
                                                                          description:
                                                                              'Cámara 04',
                                                                          position:
                                                                              3),
                                                                    ],
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height: 20.0,
                                                                ),
                                                                Container(
                                                                  width: _size
                                                                      .width,
                                                                  height: 60.0,
                                                                  child:
                                                                      Material(
                                                                    color: Color(
                                                                        0xffF5F6F8),
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                3.9),
                                                                        bottomLeft:
                                                                            Radius.circular(3.9)),
                                                                    child: InkWell(
                                                                        child: Container(
                                                                          width:
                                                                              _size.width,
                                                                          child:
                                                                              Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Container(
                                                                                    width: 15.0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                'Volver',
                                                                                style: TextStyle(color: Color(0xff000024), fontFamily: 'Open Sans', fontSize: 18, fontWeight: FontWeight.w700),
                                                                              ),
                                                                              Container(
                                                                                width: 25.0,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        onTap: () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        }),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: _size
                                                                      .width,
                                                                  height: 60.0,
                                                                  child:
                                                                      Material(
                                                                    color: Color(
                                                                        0xff000024),
                                                                    borderRadius: BorderRadius.only(
                                                                        bottomRight:
                                                                            Radius.circular(
                                                                                10),
                                                                        bottomLeft:
                                                                            Radius.circular(10)),
                                                                    child: InkWell(
                                                                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                                                        child: Container(
                                                                          width:
                                                                              _size.width,
                                                                          child:
                                                                              Row(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.center,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: <Widget>[
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: <Widget>[
                                                                                  Container(
                                                                                    width: 15.0,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                'Siguiente (2/3)',
                                                                                style: TextStyle(color: Color(0xffFFFFFF), fontFamily: 'Open Sans', fontSize: 18, fontWeight: FontWeight.w700),
                                                                              ),
                                                                              Container(
                                                                                width: 25.0,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        onTap: () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          showDialog<String>(
                                                                              context: context,
                                                                              builder: (BuildContext context) => Dialog(
                                                                                    insetPadding: EdgeInsets.symmetric(horizontal: 20.0),
                                                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                                                    child: Container(
                                                                                      width: _size.width,
                                                                                      height: 470.0,
                                                                                      padding: EdgeInsets.only(top: 25.0),
                                                                                      decoration: BoxDecoration(
                                                                                        borderRadius: BorderRadius.circular(15.0),
                                                                                        color: Colors.white,
                                                                                      ),
                                                                                      child: Column(
                                                                                        children: <Widget>[
                                                                                          Text(
                                                                                            'Crear Grupo',
                                                                                            style: TextStyle(color: Color(0xff000024), fontSize: 26.0, fontWeight: FontWeight.w600),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: 5.0,
                                                                                          ),
                                                                                          Text(
                                                                                            'ELIGE UN ICONO PARA DIFERENCIAR TU NUEVO GRUPO',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: TextStyle(color: Color(0xff413F60), fontSize: 14.0, fontWeight: FontWeight.w500),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: 15.0,
                                                                                          ),
                                                                                          Container(
                                                                                            margin: EdgeInsets.symmetric(horizontal: 15.0),
                                                                                            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                                                                                            height: 200.0,
                                                                                            decoration: BoxDecoration(
                                                                                              border: Border.all(color: Color(0xffADACBC)),
                                                                                              borderRadius: BorderRadius.circular(15.0),
                                                                                              color: Colors.white,
                                                                                            ),
                                                                                            child: Row(
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: <Widget>[
                                                                                                Column(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: <Widget>[
                                                                                                    Icon(Icons.emoji_people_outlined),
                                                                                                    Icon(Icons.emoji_people_outlined),
                                                                                                    Icon(Icons.emoji_people_outlined),
                                                                                                    Icon(Icons.emoji_people_outlined)
                                                                                                  ],
                                                                                                ),
                                                                                                Column(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: <Widget>[
                                                                                                    Icon(Icons.baby_changing_station),
                                                                                                    Icon(Icons.baby_changing_station),
                                                                                                    Icon(Icons.baby_changing_station),
                                                                                                    Icon(Icons.baby_changing_station)
                                                                                                  ],
                                                                                                ),
                                                                                                Column(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: <Widget>[
                                                                                                    Icon(Icons.tv),
                                                                                                    Icon(Icons.tv),
                                                                                                    Icon(Icons.tv),
                                                                                                    Icon(Icons.tv)
                                                                                                  ],
                                                                                                ),
                                                                                                Column(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: <Widget>[
                                                                                                    Icon(Icons.nature_people_outlined),
                                                                                                    Icon(Icons.nature_people_outlined),
                                                                                                    Icon(Icons.nature_people_outlined),
                                                                                                    Icon(Icons.nature_people_outlined)
                                                                                                  ],
                                                                                                ),
                                                                                                Column(
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  children: <Widget>[
                                                                                                    Icon(Icons.person),
                                                                                                    Icon(Icons.person),
                                                                                                    Icon(Icons.person),
                                                                                                    Icon(Icons.person)
                                                                                                  ],
                                                                                                )
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          SizedBox(
                                                                                            height: 24.0,
                                                                                          ),
                                                                                          Container(
                                                                                            width: _size.width,
                                                                                            height: 60.0,
                                                                                            child: Material(
                                                                                              color: Color(0xffF5F6F8),
                                                                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(3.9), bottomLeft: Radius.circular(3.9)),
                                                                                              child: InkWell(
                                                                                                  child: Container(
                                                                                                    width: _size.width,
                                                                                                    child: Row(
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: <Widget>[
                                                                                                        Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: <Widget>[
                                                                                                            Container(
                                                                                                              width: 15.0,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'Volver',
                                                                                                          style: TextStyle(color: Color(0xff000024), fontFamily: 'Open Sans', fontSize: 18, fontWeight: FontWeight.w700),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 25.0,
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  onTap: () {
                                                                                                    Navigator.pop(context);
                                                                                                  }),
                                                                                            ),
                                                                                          ),
                                                                                          Container(
                                                                                            width: _size.width,
                                                                                            height: 60.0,
                                                                                            child: Material(
                                                                                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                                                                              color: Color(0xffF28740),
                                                                                              child: InkWell(
                                                                                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                                                                                  child: Container(
                                                                                                    width: _size.width,
                                                                                                    child: Row(
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: <Widget>[
                                                                                                        Row(
                                                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                                                          children: <Widget>[
                                                                                                            Container(
                                                                                                              width: 15.0,
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'FINALIZAR (3/3)',
                                                                                                          style: TextStyle(color: Color(0xffFFFFFF), fontFamily: 'Open Sans', fontSize: 18, fontWeight: FontWeight.w700),
                                                                                                        ),
                                                                                                        Container(
                                                                                                          width: 25.0,
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  onTap: () {
                                                                                                    Navigator.pop(context);
                                                                                                    setState(() {
                                                                                                      showGroupHomeDetail = true;
                                                                                                    });
                                                                                                  }),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ));
                                                                        }),
                                                                  ),
                                                                ),
                                                              ],
                                                            )),
                                                      ));
                                        }),
                                  ),
                                ),
                              ])))))),
        )
      ],
    );
  }

  Widget _homeGroupDetail(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.keyboard_backspace,
                      size: 35.0,
                    ),
                    onTap: () {
                      setState(() {
                        showGroupHomeDetail = false;
                      });
                    },
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'GRUPO',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff000024),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              GestureDetector(
                child: Icon(
                  Icons.settings_outlined,
                  size: 35.0,
                ),
                onTap: () {
                  showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                          insetPadding: EdgeInsets.symmetric(horizontal: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: Container(
                            width: _size.width,
                            height: 250.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0)),
                            child: Column(children: <Widget>[
                              SizedBox(height: 21.0),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 11.5),
                                child: Text(
                                  'Configuración del grupo',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      height: 1.0,
                                      color: Color(0xff000024),
                                      fontSize: 28.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                width: _size.width,
                                height: 65,
                                child: Material(
                                  color: Color(0xffF5F6F8),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog<String>(
                                          context: context,
                                          builder:
                                              (BuildContext context) => Dialog(
                                                    insetPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.0),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                    child: Container(
                                                      width: _size.width,
                                                      height: 600.0,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0)),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        20.0),
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                SizedBox(
                                                                    height:
                                                                        30.0),
                                                                Center(
                                                                  child: Text(
                                                                    'Modificar Grupo',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        height:
                                                                            1.0,
                                                                        color: Color(
                                                                            0xff000024),
                                                                        fontSize:
                                                                            28.0,
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    height:
                                                                        20.0),
                                                                Text(
                                                                    'NOMBRE DE GRUPO',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff413F60),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        fontWeight:
                                                                            FontWeight.w600)),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      top: 5.0,
                                                                      bottom:
                                                                          25.0),
                                                                  child:
                                                                      TextField(
                                                                    decoration:
                                                                        InputDecoration(
                                                                      contentPadding: EdgeInsets.only(
                                                                          left:
                                                                              15.0,
                                                                          top:
                                                                              35.0),
                                                                      hintText:
                                                                          'Lorem ipsum dolor',
                                                                      fillColor:
                                                                          Colors
                                                                              .white,
                                                                      filled:
                                                                          true,
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                Color(0xffF28740),
                                                                            width: 2.0),
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                        borderSide: BorderSide(
                                                                            color:
                                                                                Color(0xffC2C1C7),
                                                                            width: 1.5),
                                                                      ),
                                                                      labelStyle: TextStyle(
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              Colors.black),
                                                                      alignLabelWithHint:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Text(
                                                                    'AÑADE O ELIMINA CÁMARAS DEL GRUPO',
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff413F60),
                                                                        fontSize:
                                                                            14.0,
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        fontWeight:
                                                                            FontWeight.w600)),
                                                                SizedBox(
                                                                    height:
                                                                        5.0),
                                                                ItemDialog(
                                                                    name:
                                                                        'Lorem Ipsum Jipsum',
                                                                    description:
                                                                        'Cámara 04',
                                                                    position:
                                                                        1),
                                                                ItemDialog(
                                                                    name:
                                                                        'Lorem Ipsum Jipsum',
                                                                    description:
                                                                        'Cámara 04',
                                                                    position:
                                                                        2),
                                                                ItemDialog(
                                                                    name:
                                                                        'Lorem Ipsum Jipsum',
                                                                    description:
                                                                        'Cámara 04',
                                                                    position:
                                                                        2),
                                                                ItemDialog(
                                                                    name:
                                                                        'Lorem Ipsum Jipsum',
                                                                    description:
                                                                        'Cámara 04',
                                                                    position:
                                                                        3),
                                                                SizedBox(
                                                                    height:
                                                                        20.0),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: _size.width,
                                                            height: 65,
                                                            child: Material(
                                                              color: Color(
                                                                  0xffF5F6F8),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                    'Cancelar',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xff000024),
                                                                        fontSize:
                                                                            21.0,
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: _size.width,
                                                            height: 65,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          9.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          9.0)),
                                                            ),
                                                            child: Material(
                                                              borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          9.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          9.0)),
                                                              color: Color(
                                                                  0xff000024),
                                                              child: InkWell(
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            9.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            9.0)),
                                                                onTap: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                child: Center(
                                                                  child: Text(
                                                                    'Aceptar',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: TextStyle(
                                                                        color: Color(
                                                                            0xffFFFFFF),
                                                                        fontSize:
                                                                            21.0,
                                                                        fontFamily:
                                                                            'Open Sans',
                                                                        fontWeight:
                                                                            FontWeight.w700),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ));
                                    },
                                    child: Center(
                                      child: Text(
                                        'Modificar',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xff000024),
                                            fontSize: 21.0,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                width: _size.width,
                                height: 65,
                                child: Material(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(9.0),
                                      bottomRight: Radius.circular(9.0)),
                                  color: Color(0xffADACBC),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog<String>(
                                          context: context,
                                          builder:
                                              (BuildContext context) => Dialog(
                                                    insetPadding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.0),
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10.0))),
                                                    child: Container(
                                                        width: _size.width,
                                                        height: 337.0,
                                                        padding:
                                                            EdgeInsets.only(
                                                                top: 25.0),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          color: Colors.white,
                                                        ),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Text(
                                                              '¿Estás seguro?',
                                                              style: TextStyle(
                                                                  color: Color(
                                                                      0xff000024),
                                                                  fontSize:
                                                                      26.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            SizedBox(
                                                              height: 15.0,
                                                            ),
                                                            SvgPicture.asset(
                                                              'assets/images/Icon awesome-exclamation-circle.svg',
                                                              height: 55.0,
                                                              width: 55.0,
                                                              color: Color(
                                                                  0xff000024),
                                                            ),
                                                            SizedBox(
                                                              height: 20.0,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20.0),
                                                              child: Text(
                                                                'ESTÁS POR ELIMINAR UN GRUPO DE CÁMARAS Y NO PODRÁS RECUPERARLO',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff413F60),
                                                                    fontSize:
                                                                        14.0,
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                height: 15.0),
                                                            Container(
                                                              width:
                                                                  _size.width,
                                                              height: 65,
                                                              child: Material(
                                                                color: Color(
                                                                    0xffF5F6F8),
                                                                child: InkWell(
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Cancelar',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xff000024),
                                                                          fontSize:
                                                                              21.0,
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width:
                                                                  _size.width,
                                                              height: 65,
                                                              child: Material(
                                                                borderRadius: BorderRadius.only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            9.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            9.0)),
                                                                color: Color(
                                                                    0xff000024),
                                                                child: InkWell(
                                                                  borderRadius: BorderRadius.only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              9.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              9.0)),
                                                                  onTap: () {
                                                                    Navigator.pop(
                                                                        context);
                                                                    showDialog<
                                                                            String>(
                                                                        context:
                                                                            context,
                                                                        builder: (BuildContext
                                                                                context) =>
                                                                            Dialog(
                                                                              insetPadding: EdgeInsets.symmetric(horizontal: 20.0),
                                                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                                                              child: Container(
                                                                                height: 237.0,
                                                                                width: _size.width,
                                                                                child: Column(
                                                                                  children: <Widget>[
                                                                                    SizedBox(height: 21.0),
                                                                                    Padding(
                                                                                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 11.5),
                                                                                      child: Text(
                                                                                        'Grupo eliminado',
                                                                                        textAlign: TextAlign.center,
                                                                                        style: TextStyle(height: 1.0, color: Color(0xff000024), fontSize: 28.0, fontWeight: FontWeight.w600),
                                                                                      ),
                                                                                    ),
                                                                                    SizedBox(height: 15.0),
                                                                                    Container(
                                                                                        height: 55.0,
                                                                                        width: 55.0,
                                                                                        child: Icon(
                                                                                          Icons.check,
                                                                                          color: Colors.white,
                                                                                          size: 35.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(
                                                                                          borderRadius: BorderRadius.circular(30.0),
                                                                                          color: Color(0xff000024),
                                                                                        )),
                                                                                    SizedBox(height: 30.0),
                                                                                    Container(
                                                                                      width: _size.width,
                                                                                      height: 65,
                                                                                      child: Material(
                                                                                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(9.0), bottomRight: Radius.circular(9.0)),
                                                                                        color: Color(0xff000024),
                                                                                        child: InkWell(
                                                                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(9.0), bottomRight: Radius.circular(9.0)),
                                                                                          onTap: () {
                                                                                            Navigator.pop(context);
                                                                                          },
                                                                                          child: Center(
                                                                                            child: Text(
                                                                                              'Entendido',
                                                                                              textAlign: TextAlign.center,
                                                                                              style: TextStyle(color: Color(0xffffffff), fontSize: 21.0, fontFamily: 'Open Sans', fontWeight: FontWeight.w700),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ));
                                                                  },
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Estoy seguro',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Color(
                                                                              0xffFFFFFF),
                                                                          fontSize:
                                                                              21.0,
                                                                          fontFamily:
                                                                              'Open Sans',
                                                                          fontWeight:
                                                                              FontWeight.w700),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        )),
                                                  ));
                                    },
                                    child: Center(
                                      child: Text(
                                        'Eliminar',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Color(0xff000024),
                                            fontSize: 21.0,
                                            fontFamily: 'Open Sans',
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                          )));
                },
              ),
            ],
          ),
          SizedBox(height: 20.0),
          Row(children: <Widget>[
            Container(
              height: 60.0,
              width: 60.0,
              decoration: BoxDecoration(
                color: Color(0xffF28740),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SvgPicture.asset(
                'assets/images/Icon awesome-toilet.svg',
                fit: BoxFit.values[5],
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8.0),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Casa Ciudad',
                      style: TextStyle(
                          color: Color(0xff010028),
                          fontSize: 25.0,
                          fontWeight: FontWeight.w600)),
                  Text('Cámaras agrupadas (3)',
                      style: TextStyle(
                          color: Color(0xff413F60),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500))
                ])
          ]),
          SizedBox(height: 10.0),
          ItemHome(
            callback: () {
              _onItemTapped(1);
              setState(() {
                showDetailHistory = true;
              });
            },
            title: 'Sala principal',
            urlImage: 'assets/images/imagevideo.jpg',
            urlVideo:
                'http://147.182.138.100:4000/2021-09-23/video_001/15/15-07-07-15-15-00.mp4',
          ),
          SizedBox(height: 20.0),
          ItemHome(
            callback: () {
              _onItemTapped(1);
              setState(() {
                showDetailHistory = true;
              });
            },
            title: 'Oficina',
            urlImage: 'assets/images/home2.png',
            urlVideo:
                'http://147.182.138.100:4000/2021-09-23/video_001/16/16-03-05-16-11-04.mp4',
          ),
          SizedBox(height: 20.0),
          ItemHome(
              callback: () {
                _onItemTapped(1);
                setState(() {
                  showDetailHistory = true;
                });
              },
              title: 'Parqueadero',
              urlImage: 'assets/images/home3.png',
              urlVideo:
                  'http://147.182.138.100:4000/2021-09-23/video_001/16/16-03-05-16-11-04.mp4'),
        ]);
  }

  Widget _camera(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
        width: _size.width,
        // padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: (() {
          if (showDetailHistory && !showRecords && !infoTechnical) {
            return _detail(context);
          } else if (showDetailHistory && showRecords && !infoTechnical) {
            return _cameraRecords(context);
          } else if (showDetailHistory && !showRecords && infoTechnical) {
            return _cameraInfoTechnical(context);
          }
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    'CÁMARAS',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff000024),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  SizedBox(height: 10.0),
                  _optionList(
                      context,
                      'Nombre de la cámara',
                      Icon(Icons.videocam, color: Color(0xffF28740)),
                      1.0,
                      1.0,
                      9.0,
                      9.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      false, () {
                    setState(() {
                      showDetailHistory = true;
                    });
                  }),
                  _optionList(
                      context,
                      'Nombre de la cámara',
                      Icon(Icons.videocam, color: Color(0xffF28740)),
                      9.0,
                      9.0,
                      9.0,
                      9.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      true, () {
                    setState(() {
                      showDetailHistory = true;
                    });
                  }),
                  _optionList(
                      context,
                      'Nombre de la cámara',
                      Icon(Icons.videocam, color: Color(0xffF28740)),
                      9.0,
                      9.0,
                      9.0,
                      9.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      true, () {
                    setState(() {
                      showDetailHistory = true;
                    });
                  }),
                  _optionList(
                      context,
                      'Nombre de la cámara',
                      Icon(Icons.videocam, color: Color(0xffF28740)),
                      9.0,
                      9.0,
                      9.0,
                      9.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      true, () {
                    setState(() {
                      showDetailHistory = true;
                    });
                  }),
                  _optionList(
                      context,
                      'Nombre de la cámara',
                      Icon(Icons.videocam, color: Color(0xffF28740)),
                      9.0,
                      9.0,
                      9.0,
                      9.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      true, () {
                    setState(() {
                      showDetailHistory = true;
                    });
                  }),
                  _optionList(
                      context,
                      'Nombre de la cámara',
                      Icon(Icons.videocam, color: Color(0xffF28740)),
                      9.0,
                      9.0,
                      9.0,
                      9.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      true, () {
                    setState(() {
                      showDetailHistory = true;
                    });
                  }),
                  _optionList(
                      context,
                      'Nombre de la cámara',
                      Icon(Icons.videocam, color: Color(0xffF28740)),
                      9.0,
                      9.0,
                      9.0,
                      9.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      true, () {
                    setState(() {
                      showDetailHistory = true;
                    });
                  }),
                  _optionList(
                      context,
                      'Nombre de la cámara',
                      Icon(Icons.videocam, color: Color(0xffF28740)),
                      9.0,
                      9.0,
                      9.0,
                      9.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      true, () {
                    setState(() {
                      showDetailHistory = true;
                    });
                  }),
                  _optionList(
                      context,
                      'Nombre de la cámara',
                      Icon(Icons.videocam, color: Color(0xffF28740)),
                      9.0,
                      9.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      1.0,
                      false, () {
                    setState(() {
                      showDetailHistory = true;
                    });
                  }),
                  SizedBox(height: 20.0),
                ]),
          );
        }()));
  }

  Widget _cameraInfoTechnical(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      Icons.keyboard_backspace,
                      size: 35.0,
                    ),
                    onTap: () {
                      setState(() {
                        infoTechnical = false;
                      });
                    },
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    'INFORMACIÓN TÉCNICA',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff000024),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'Nombre de cámara',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff000024),
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'ESTADO DE CÁMARA',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff413F60),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Open Sans'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                  height: 131.0,
                  width: _size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9.0),
                      border: Border.all(color: Color(0xffADACBC))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 10.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Creación',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff000024),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '16 de Jul. 2021',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff000024),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ]),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 2.0),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  'Activa desde',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff000024),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  '14 de Sep. 2021',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff000024),
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600),
                                ),
                              ]),
                        ),
                        SizedBox(height: 8.0),
                        Container(
                            height: 55.0,
                            width: _size.width,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 2.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      'ESTADO',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xff000024),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    Text(
                                      'ACTIVO',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Color(0xffF28740),
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ]),
                            ),
                            decoration: BoxDecoration(
                                color: Color(0xffF5F6F8),
                                border: Border.all(color: Color(0xffADACBC)),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(9.0),
                                  bottomRight: Radius.circular(9.0),
                                )))
                      ])),
              SizedBox(
                height: 15.0,
              ),
              Text(
                'MARCA',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xffADACBC),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Open Sans'),
              ),
              Text(
                'OIW-07 OIW-07',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff000024),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Open Sans'),
              ),
              SizedBox(height: 15.0),
              Text(
                'MODELO',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xffADACBC),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Open Sans'),
              ),
              Text(
                '1265YT13',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff000024),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Open Sans'),
              ),
              SizedBox(height: 15.0),
              Text(
                'SERIE',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xffADACBC),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Open Sans'),
              ),
              Text(
                'OIW-07-UY-1265YT13',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff000024),
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Open Sans'),
              ),
              SizedBox(height: 25.0),
              Text(
                'DIRECCIÓN',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Color(0xff413F60),
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Open Sans'),
              ),
              SizedBox(
                height: 5.0,
              ),
              Container(
                  width: _size.width,
                  height: 150.0,
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Color(0xffADACBC)),
                      color: Color(0xffF5F6F8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'MUNICIPIO',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff413F60),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Open Sans'),
                              ),
                              Text(
                                'Lorem Ipsum',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Open Sans'),
                              ),
                            ]),
                        SizedBox(width: 50.0),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'CIUDAD',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff413F60),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Open Sans'),
                              ),
                              Text(
                                'La Paz',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Open Sans'),
                              ),
                            ])
                      ]),
                      SizedBox(height: 25.0),
                      Row(children: <Widget>[
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'ZONA',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff413F60),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Open Sans'),
                              ),
                              Text(
                                'Lorem Ipsum',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Open Sans'),
                              ),
                            ]),
                        SizedBox(width: 50.0),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'CALLE',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff413F60),
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Open Sans'),
                              ),
                              Text(
                                'Lorem Ipsum',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Open Sans'),
                              ),
                            ])
                      ])
                    ],
                  ))
            ]));
  }

  Widget _cameraRecords(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0),
            Row(
              children: [
                GestureDetector(
                  child: Icon(
                    Icons.keyboard_backspace,
                    size: 35.0,
                  ),
                  onTap: () {
                    setState(() {
                      showRecords = false;
                    });
                  },
                ),
                SizedBox(width: 10.0),
                Text(
                  'GRABACIONES',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff000024),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'Nombre de la cámara',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Buscar la fecha de grabación',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff413F60),
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 15.0, top: 35.0),
                  hintText: 'dd/mm/aaaa',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        BorderSide(color: Color(0xffF28740), width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide:
                        BorderSide(color: Color(0xffC2C1C7), width: 1.5),
                  ),
                  prefixIcon: Container(
                      margin: EdgeInsets.only(
                          left: _size.width * 0.24, right: 15.0),
                      child: Icon(Icons.search)),
                  labelStyle: TextStyle(
                      fontFamily: 'Roboto', fontSize: 15, color: Colors.black),
                  alignLabelWithHint: true,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Fecha',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff413F60),
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  'Reprod',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff413F60),
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(
              'SETIEMBRE',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff413F60),
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Row(
              children: [
                Container(
                  height: 60.0,
                  width: _size.width - 100.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10.0)),
                      border: Border.all(color: Color(0xffADACBC))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Lun, 01 Noviembre',
                            style: TextStyle(
                                color: Color(0xff000024),
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600)),
                        Icon(Icons.keyboard_arrow_up, color: Color(0xff000024))
                      ],
                    ),
                  ),
                ),
                Container(
                    height: 60.0,
                    width: 60.0,
                    decoration: BoxDecoration(
                        color: Color(0xffF28740),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10.0),
                            bottomRight: Radius.circular(10.0))),
                    child: Icon(Icons.play_circle,
                        color: Colors.white, size: 35.0)),
              ],
            ),
            SizedBox(
              height: 15.0,
            ),
            Column(
              children: <Widget>[
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('00:00 - 01:00 hrs')),
                      ),
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('01:00 - 02:00 hrs')),
                      )
                    ]),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('02:00 - 03:00 hrs')),
                      ),
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('03:00 - 04:00 hrs')),
                      )
                    ]),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('04:00 - 05:00 hrs')),
                      ),
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('05:00 - 06:00 hrs')),
                      )
                    ]),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('06:00 - 07:00 hrs')),
                      ),
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('07:00 - 08:00 hrs')),
                      )
                    ]),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('04:00 - 05:00 hrs')),
                      ),
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('05:00 - 06:00 hrs')),
                      )
                    ]),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('06:00 - 07:00 hrs')),
                      ),
                      Container(
                        height: 45.0,
                        width: _size.width * 0.44,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(color: Color(0xffADACBC))),
                        child: Center(child: Text('07:00 - 08:00 hrs')),
                      )
                    ]),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Container(
                      height: 60.0,
                      width: _size.width - 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                          border: Border.all(color: Color(0xffADACBC))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Mar, 02 Noviembre',
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600)),
                            Icon(Icons.keyboard_arrow_down,
                                color: Color(0xff000024))
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            color: Color(0xffF28740),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        child: Icon(Icons.play_circle,
                            color: Colors.white, size: 35.0)),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Container(
                      height: 60.0,
                      width: _size.width - 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                          border: Border.all(color: Color(0xffADACBC))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Mie, 03 Noviembre',
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600)),
                            Icon(Icons.keyboard_arrow_down,
                                color: Color(0xff000024))
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            color: Color(0xffF28740),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        child: Icon(Icons.play_circle,
                            color: Colors.white, size: 35.0)),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Container(
                      height: 60.0,
                      width: _size.width - 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                          border: Border.all(color: Color(0xffADACBC))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Jue, 04 Noviembre',
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600)),
                            Icon(Icons.keyboard_arrow_down,
                                color: Color(0xff000024))
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            color: Color(0xffF28740),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        child: Icon(Icons.play_circle,
                            color: Colors.white, size: 35.0)),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: [
                    Container(
                      height: 60.0,
                      width: _size.width - 100.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0)),
                          border: Border.all(color: Color(0xffADACBC))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Vie, 05 Noviembre',
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600)),
                            Icon(Icons.keyboard_arrow_down,
                                color: Color(0xff000024))
                          ],
                        ),
                      ),
                    ),
                    Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            color: Color(0xffF28740),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        child: Icon(Icons.play_circle,
                            color: Colors.white, size: 35.0)),
                  ],
                ),
              ],
            )
          ]),
    );
  }

  Widget _profile(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
        width: _size.width,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: (() {
          if (showUserInfo &&
              !showUserSecondary &&
              !showUserAboutUs &&
              !showUserHelp &&
              !showUserPay &&
              !showUserSecondaryDetail &&
              !showUserDoc &&
              !showUserDocDetail) {
            return _profileUserInfo(context);
          } else if (!showUserInfo &&
              !showUserAboutUs &&
              showUserSecondary &&
              !showUserHelp &&
              !showUserPay &&
              !showUserSecondaryDetail &&
              !showUserDoc &&
              !showUserDocDetail) {
            return _profileUserSecondary(context);
          } else if (!showUserInfo &&
              !showUserAboutUs &&
              showUserSecondary &&
              !showUserHelp &&
              !showUserPay &&
              showUserSecondaryDetail &&
              !showUserDoc &&
              !showUserDocDetail) {
            return _profileUserSecondaryDetail(context);
          } else if (!showUserInfo &&
              showUserAboutUs &&
              !showUserSecondary &&
              !showUserHelp &&
              !showUserPay &&
              !showUserSecondaryDetail &&
              !showUserDoc &&
              !showUserDocDetail) {
            return _profileAboutUs(context);
          } else if (!showUserInfo &&
              !showUserAboutUs &&
              !showUserSecondary &&
              showUserHelp &&
              !showUserPay &&
              !showUserSecondaryDetail &&
              !showUserDoc &&
              !showUserDocDetail) {
            return _profileHelpUsers(context);
          } else if (!showUserInfo &&
              !showUserAboutUs &&
              !showUserSecondary &&
              showUserHelp &&
              !showUserPay &&
              !showUserSecondaryDetail &&
              showUserDoc &&
              !showUserDocDetail) {
            return _profileDoc(context);
          } else if (!showUserInfo &&
              !showUserAboutUs &&
              !showUserSecondary &&
              showUserHelp &&
              !showUserPay &&
              !showUserSecondaryDetail &&
              showUserDoc &&
              showUserDocDetail) {
            return _profileDocDetail(context);
          } else if (showUserInfo &&
              !showUserAboutUs &&
              !showUserSecondary &&
              !showUserHelp &&
              showUserPay &&
              !showUserSecondaryDetail &&
              !showUserDoc &&
              !showUserDocDetail) {
            return _profilePay(context);
          }
          return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20.0),
                Text(
                  'MI CUENTA',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Color(0xff000024),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(children: <Widget>[
                        Image(
                          image: AssetImage((() {
                            if (widget.userPrimary) {
                              return 'assets/images/Elipse 10.png';
                            }
                            return 'assets/images/Elipse 12.png';
                          })()),
                        ),
                        SizedBox(height: 10.0),
                        Text('¡Hola París!',
                            style: TextStyle(
                                color: Color(0xff000024),
                                fontSize: 30.0,
                                fontWeight: FontWeight.w700))
                      ])
                    ]),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: BtnCustomProfile(
                      text: Text(
                        'Conectar vía Facebook',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      color: Color(0xffF28740),
                      border: Color(0xffF28740),
                      textColor: Colors.white,
                      callback: () {}),
                ),
                SizedBox(height: 20.0),
                Text(
                  'PERSONAL',
                  style: TextStyle(
                      color: Color(0xff413F60),
                      fontSize: 16.0,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5.0),
                _option(
                  context,
                  'Información de Cuenta',
                  Icon(Icons.person),
                  1.0,
                  1.0,
                  9.0,
                  9.0,
                  1.0,
                  1.0,
                  1.0,
                  1.0,
                  false,
                  () {
                    setState(() {
                      showUserInfo = true;
                    });
                  },
                ),
                _option(
                  context,
                  (() {
                    if (widget.userPrimary) {
                      return 'Usuarios Secundarios';
                    }
                    return 'Usuario Principal';
                  })(),
                  Icon(Icons.group),
                  9.0,
                  9.0,
                  9.0,
                  9.0,
                  1.0,
                  1.0,
                  1.0,
                  1.0,
                  true,
                  () {
                    setState(() {
                      showUserSecondary = true;
                    });
                  },
                ),
                _option(context, 'Ayuda para Usuarios', Icon(Icons.help), 9.0,
                    9.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, false, () {
                  setState(() {
                    showUserHelp = true;
                  });
                }),
                SizedBox(height: 20.0),
                Text(
                  'MÁS INFORMACIÓN',
                  style: TextStyle(
                      color: Color(0xff413F60),
                      fontSize: 16.0,
                      fontFamily: 'Open Sans',
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5.0),
                _option(context, 'Acerca de', Icon(Icons.settings), 9.0, 9.0,
                    9.0, 9.0, 1.0, 1.0, 1.0, 1.0, false, () {
                  setState(() {
                    showUserAboutUs = true;
                  });
                }),
                SizedBox(height: 20.0),
                BtnCustomProfile(
                    text: Text(
                      'Cerrar sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Color(0xff000024),
                    border: Color(0xff000024),
                    textColor: Colors.white,
                    callback: () => {
                          // Navigator.pushNamed(context, 'main')
                          showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => Dialog(
                                insetPadding:
                                    EdgeInsets.symmetric(horizontal: 30.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0))),
                                child: Container(
                                    width: _size.width,
                                    height: 380.0,
                                    child: Column(
                                      children: <Widget>[
                                        SizedBox(height: 20.0),
                                        Text(
                                          '¿Estás seguro?',
                                          style: TextStyle(
                                              color: Color(0xff000024),
                                              fontSize: 26.0,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Icon(Icons.login_outlined, size: 65.0),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Text(
                                            'ESTÁS POR CERRAR LA SESIÓN DE TU CUENTA, SI LO HACES NO PODRÁS VER TUS CÁMARAS HASTA INICIAR SESIÓN NUEVAMENTE',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Color(0xff413F60),
                                                fontSize: 14.0,
                                                fontFamily: 'Open Sans',
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 20.0,
                                        ),
                                        Container(
                                          width: _size.width,
                                          height: 60.0,
                                          child: Material(
                                            color: Color(0xffF5F6F8),
                                            child: InkWell(
                                                child: Container(
                                                  width: _size.width,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Container(
                                                            width: 15.0,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        'Cancelar',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xff000024),
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      Container(
                                                        width: 25.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.pop(context);
                                                }),
                                          ),
                                        ),
                                        Container(
                                          width: _size.width,
                                          height: 60.0,
                                          child: Material(
                                            color: Color(0xff000024),
                                            borderRadius: BorderRadius.only(
                                                bottomRight: Radius.circular(9),
                                                bottomLeft: Radius.circular(9)),
                                            child: InkWell(
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(9),
                                                    bottomLeft:
                                                        Radius.circular(9)),
                                                child: Container(
                                                  width: _size.width,
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: <Widget>[
                                                          Container(
                                                            width: 15.0,
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        'Cerrar sesión',
                                                        style: TextStyle(
                                                            color: Color(
                                                                0xffFFFFFF),
                                                            fontFamily:
                                                                'Open Sans',
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                      Container(
                                                        width: 25.0,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, 'main');
                                                }),
                                          ),
                                        ),
                                      ],
                                    ))),
                          ),
                        }),
              ]);
        })());
  }

  Widget _profileDocDetail(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.keyboard_backspace,
                size: 35.0,
              ),
              onTap: () {
                setState(() {
                  showUserDocDetail = false;
                });
              },
            ),
            SizedBox(width: 10.0),
            Text(
              'DOCUMENTACIÓN',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 20.0),
          Text(
            'Términos y Condiciones',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 22.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.0),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus varius nibh, sed porta ante pharetra a. Phasellus et ligula dictum, pretium tellus venenatis, feugiat mauris. Nulla tristique varius ligula, a sagittis nunc tristique at. In hac habitasse platea dictumst. Mauris mattis urna vitae enim dapibus, a congue turpis tincidunt. Curabitur eu bibendum augue. Curabitur arcu nisi, luctus id neque ut, pretium egestas augue.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus varius nibh, sed porta ante pharetra a. Phasellus et ligula dictum, pretium tellus venenatis, feugiat mauris. Nulla tristique varius ligula, a sagittis nunc tristique at. In hac habitasse platea dictumst. Mauris mattis urna vitae enim dapibus, a congue turpis tincidunt. Curabitur eu bibendum augue. Curabitur arcu nisi, luctus id neque ut, pretium egestas augue.',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 18.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600),
          ),
        ]);
  }

  Widget _profileDoc(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.keyboard_backspace,
                size: 35.0,
              ),
              onTap: () {
                setState(() {
                  showUserDoc = false;
                });
              },
            ),
            SizedBox(width: 10.0),
            Text(
              'DOCUMENTACIÓN',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 30.0),
          Text(
              'Digital Work ha sido creado para brindarte seguridad y la mejor atención. A continuación, te informamos sobre nuestros términos y condiciones.',
              style: TextStyle(
                color: Color(0xff707070),
                fontSize: 16.0,
                fontFamily: 'Open Sans',
              )),
          SizedBox(height: 20.0),
          _option(
            context,
            'Términos y Condiciones',
            Icon(Icons.insert_drive_file),
            1.0,
            1.0,
            9.0,
            9.0,
            1.0,
            1.0,
            1.0,
            1.0,
            false,
            () {
              setState(() {
                showUserDocDetail = true;
              });
            },
          ),
          _option(
            context,
            'Términos y Condiciones',
            Icon(Icons.insert_drive_file),
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            true,
            () {
              setState(() {
                showUserDocDetail = true;
              });
            },
          ),
          _option(
            context,
            'Términos y Condiciones',
            Icon(Icons.insert_drive_file),
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            false,
            () {
              setState(() {
                showUserDocDetail = true;
              });
            },
          ),
          _option(
            context,
            'Términos y Condiciones',
            Icon(Icons.insert_drive_file),
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            1.0,
            true,
            () {
              setState(() {
                showUserDocDetail = true;
              });
            },
          ),
          _option(
              context,
              'Términos y Condiciones',
              Icon(Icons.insert_drive_file),
              9.0,
              9.0,
              1.0,
              1.0,
              1.0,
              1.0,
              1.0,
              1.0,
              false, () {
            setState(() {
              showUserDocDetail = true;
            });
          }),
        ]);
  }

  Widget _profileUserSecondaryDetail(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.keyboard_backspace,
                size: 35.0,
              ),
              onTap: () {
                setState(() {
                  showUserSecondaryDetail = false;
                });
              },
            ),
            SizedBox(width: 10.0),
            Text(
              'INFORMACIÓN DE CUENTA',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ana Valverde',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Color(0xff000024),
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Hermana',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xffADACBC),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Open Sans'),
                    ),
                  ]),
              Image(image: AssetImage('assets/images/Elipse 12.png'))
            ],
          ),
          SizedBox(height: 20.0),
          Text(
            'NOMBRES',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xffADACBC),
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Open Sans'),
          ),
          Text(
            'Ana María',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xff000024),
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'APELLIDOS',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xffADACBC),
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Open Sans'),
          ),
          Text(
            'Valverde Buenaventura',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xff000024),
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'ID DE USUARIO',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xffADACBC),
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Open Sans'),
          ),
          Text(
            '#UP01016789',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xff000024),
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'CORREO',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xffADACBC),
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Open Sans'),
          ),
          Text(
            'paval@gmail.com',
            textAlign: TextAlign.left,
            style: TextStyle(
              color: Color(0xff000024),
              fontSize: 17.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 25.0),
          Container(height: 1.0, width: _size.width, color: Color(0xffBDBDBF)),
          SizedBox(height: 25.0),
          Text('CÁMARAS COMPARTIDAS',
              style: TextStyle(
                color: Color(0xff413F60),
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'Open Sans',
              )),
          SizedBox(height: 5.0),
          _optionList(
              context,
              'Nombre de la cámara',
              Icon(Icons.videocam, color: Color(0xffF28740)),
              1.0,
              1.0,
              9.0,
              9.0,
              1.0,
              1.0,
              1.0,
              1.0,
              false, () {
            setState(() {
              showDetailHistory = true;
            });
          }),
          _optionList(
              context,
              'Nombre de la cámara',
              Icon(Icons.videocam, color: Color(0xffF28740)),
              9.0,
              9.0,
              9.0,
              9.0,
              1.0,
              1.0,
              1.0,
              1.0,
              true, () {
            setState(() {
              showDetailHistory = true;
            });
          }),
          _optionList(
              context,
              'Nombre de la cámara',
              Icon(Icons.videocam, color: Color(0xffF28740)),
              9.0,
              9.0,
              9.0,
              9.0,
              1.0,
              1.0,
              1.0,
              1.0,
              true, () {
            setState(() {
              showDetailHistory = true;
            });
          }),
          _optionList(
              context,
              'Nombre de la cámara',
              Icon(Icons.videocam, color: Color(0xffF28740)),
              9.0,
              9.0,
              1.0,
              1.0,
              1.0,
              1.0,
              1.0,
              1.0,
              false, () {
            setState(() {
              showDetailHistory = true;
            });
          }),
        ]);
  }

  Widget _profilePay(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.0),
          Row(children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.keyboard_backspace,
                size: 35.0,
              ),
              onTap: () {
                setState(() {
                  showUserPay = false;
                });
              },
            ),
            SizedBox(width: 10.0),
            Text(
              'MÉTODOS DE PAGO',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 20.0),
          Row(children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.money,
                size: 35.0,
              ),
              onTap: () {},
            ),
            SizedBox(width: 10.0),
            Text(
              'Pago en efectivo',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 20.0),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi imperdiet nisl lobortis nisi ultricies cursus. Donec pharetra ullamcorper laoreet. Maecenas ac risus vitae tellus maximus efficitur. Mauris pharetra mollis lacus, ut posuere augue mattis ac. In odio velit, tempus at velit a, condimentum varius dolor. Sed ornare eleifend diam a accumsan.',
              style: TextStyle(
                  color: Color(0xffADACBC),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Open Sans')),
          SizedBox(height: 15.0),
          Row(children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.credit_card,
                size: 35.0,
              ),
              onTap: () {},
            ),
            SizedBox(width: 10.0),
            Text(
              'Pago con tarjeta',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 20.0),
          Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi imperdiet nisl lobortis nisi ultricies cursus. Donec pharetra ullamcorper laoreet. Maecenas ac risus vitae tellus maximus efficitur. Mauris pharetra mollis lacus, ut posuere augue mattis ac. In odio velit, tempus at velit a, condimentum varius dolor. Sed ornare eleifend diam a accumsan.',
              style: TextStyle(
                  color: Color(0xffADACBC),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Open Sans')),
          SizedBox(height: 20.0),
          Text('Tarjetas aceptadas:\n\nBancoBancomás\nBaPerú\nBancamía',
              style: TextStyle(
                  color: Color(0xffADACBC),
                  fontSize: 14.0,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Open Sans')),
        ]);
  }

  Widget _profileUserInfo(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 20.0),
        Row(children: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.keyboard_backspace,
              size: 35.0,
            ),
            onTap: () {
              setState(() {
                showUserInfo = false;
              });
            },
          ),
          SizedBox(width: 10.0),
          Text(
            'INFORMACIÓN DE CUENTA',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
        ]),
        SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('PARIS VALVERDE',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xff000024),
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700)),
                  Text('Sesión iniciada con Google',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Color(0xffADACBC),
                          fontSize: 14.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600)),
                ]),
            Image(
              image: AssetImage('assets/images/Elipse 10.png'),
              width: 65.0,
            ),
          ],
        ),
        SizedBox(height: 20.0),
        (() {
          if (widget.userPrimary) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('FACTURACIÓN',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Color(0xff413F60),
                        fontSize: 17.0,
                        fontFamily: 'Open Sans',
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 5.0),
                Container(
                  width: _size.width,
                  height: 164.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      border: Border.all(color: Color(0xffADACBC))),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10.0),
                        child: Column(
                          children: [
                            SizedBox(height: 3.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Última facturación',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xff000024),
                                        fontSize: 17.0,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600)),
                                Text('16 de Jul. 2021',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xff000024),
                                        fontSize: 17.0,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Próxima facturación',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xff000024),
                                        fontSize: 17.0,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600)),
                                Text('14 de Sep. 2021',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xff000024),
                                        fontSize: 17.0,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('PAGO',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xff000024),
                                        fontSize: 17.0,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w600)),
                                Text('EFECTUADO',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xffF28740),
                                        fontSize: 18.0,
                                        fontFamily: 'Open Sans',
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: _size.width,
                        height: 52.0,
                        decoration: BoxDecoration(
                            color: Color(0xffF5F6F8),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0))),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(' EFECTIVO',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff000024),
                                      fontSize: 17.0,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700)),
                              Text('USD 290.00',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Color(0xff000024),
                                      fontSize: 17.0,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
              ],
            );
          }
          return Container();
        })(),
        Text('NOMBRES',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xffADACBC),
                fontSize: 14.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600)),
        Text('Paris Angel Lucas',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 18.0,
                fontWeight: FontWeight.w600)),
        SizedBox(height: 15.0),
        Text('APELLIDOS',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xffADACBC),
                fontSize: 14.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600)),
        Text('Valverde Buenaventura',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 18.0,
                fontWeight: FontWeight.w600)),
        SizedBox(height: 15.0),
        Text('ID DE USUARIO',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xffADACBC),
                fontSize: 14.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600)),
        Text('#UP01012345',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 18.0,
                fontWeight: FontWeight.w600)),
        SizedBox(height: 15.0),
        Text('CORREO',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xffADACBC),
                fontSize: 14.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600)),
        Text('paval@gmail.com',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 18.0,
                fontWeight: FontWeight.w600)),
        SizedBox(height: 15.0),
        Text('CARNET DE IDENTIDAD',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xffADACBC),
                fontSize: 14.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600)),
        Text('E987261232',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 18.0,
                fontWeight: FontWeight.w600)),
        SizedBox(height: 15.0),
        Container(
          width: _size.width,
          height: 1.0,
          color: Color(0xffC2C1C7),
        ),
        SizedBox(height: 15.0),
        Text('DIRECCIÓN',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff413F60),
                fontSize: 17.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600)),
        SizedBox(height: 5.0),
        Container(
          width: _size.width,
          height: 255.0,
          decoration: BoxDecoration(
              color: Color(0xffF5F6F8),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Color(0xffADACBC))),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 3.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('MUNICIPIO',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xffADACBC),
                                    fontSize: 16.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                            Text('Lorem Ipsus',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 17.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        SizedBox(width: 60.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CIUDAD',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xffADACBC),
                                    fontSize: 16.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                            Text('La Paz',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 17.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ZONA',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xffADACBC),
                                    fontSize: 16.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                            Text('Lorem Ipsus',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 17.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        SizedBox(width: 60.0),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CALLE',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xffADACBC),
                                    fontSize: 16.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                            Text('Lorem Ipsus',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 17.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('NÚMERO',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xffADACBC),
                                    fontSize: 16.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                            Text('167 - B',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 17.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('TIPO DE RESIDENCIA',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xffADACBC),
                                    fontSize: 16.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                            Text('Departamento',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 17.0,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15.0),
        Text('OPCIONES DE CUENTA',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff413F60),
                fontSize: 17.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600)),
        SizedBox(height: 5.0),
        _option(
          context,
          'Recuperar contraseña',
          Icon(Icons.lock_rounded),
          1.0,
          1.0,
          9.0,
          9.0,
          1.0,
          1.0,
          1.0,
          1.0,
          false,
          () {
            showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog(
                    insetPadding: EdgeInsets.symmetric(horizontal: 30.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Container(
                      height: 498.0,
                      width: _size.width,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(
                                'RECUPERAR CONTRASEÑA',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus varius nibh, sed porta ante pharetra. Phasellus et ligula dictum, pretium tellus venenatis, feugiat mauris. Urna vitae enim dapibus a congue turpis tincidunt. ',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Color(0xff707070),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                'CONTRASEÑA ACTUAL',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Color(0xff000024),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 5.0),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.only(left: 15.0, top: 35.0),
                                  hintText: '',
                                  fillColor: Colors.white,
                                  filled: true,
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: Color(0xffF28740), width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                    borderSide: BorderSide(
                                        color: Color(0xffC2C1C7), width: 1.5),
                                  ),
                                  labelStyle: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 15,
                                      color: Colors.black),
                                  alignLabelWithHint: true,
                                ),
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Container(
                              width: _size.width,
                              height: 65.0,
                              child: Material(
                                color: Color(0xffF5F6F8),
                                child: InkWell(
                                    child: Container(
                                      width: _size.width,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 15.0,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Cancelar',
                                            style: TextStyle(
                                                color: Color(0xff000024),
                                                fontFamily: 'Open Sans',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Container(
                                            width: 25.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    }),
                              ),
                            ),
                            Container(
                              width: _size.width,
                              height: 65.0,
                              child: Material(
                                color: Color(0xffF28740),
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(9),
                                    bottomLeft: Radius.circular(9)),
                                child: InkWell(
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(9),
                                        bottomLeft: Radius.circular(9)),
                                    child: Container(
                                      width: _size.width,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 15.0,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'SOLICITAR CONTRASEÑA',
                                            style: TextStyle(
                                                color: Color(0xffFFFFFF),
                                                fontFamily: 'Open Sans',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          Container(
                                            width: 25.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                      showDialog<String>(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            Dialog(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0))),
                                          child: DialogCustom(
                                            colorIcon: Color(0xff000024),
                                            title: 'Solicitud Enviada',
                                            urlIcon:
                                                'assets/images/Icon simple-minutemailer.svg',
                                            message:
                                                'Tu solicitud ha sido enviada con éxito. Recibirás un Gmail para la confirmación del registro de tu cuenta.',
                                            btnText: 'ENTENDIDO',
                                            btnSecond: false,
                                            btnSecondText: '',
                                            svg: true,
                                            messageLines: 3,
                                            callback: () =>
                                                {Navigator.pop(context)},
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ]),
                    )));
          },
        ),
        _option(
          context,
          'Método de pago',
          Icon(Icons.attach_money),
          9.0,
          9.0,
          9.0,
          9.0,
          1.0,
          1.0,
          1.0,
          1.0,
          true,
          () {
            setState(() {
              showUserPay = true;
            });
          },
        ),
        _option(context, 'Modificar mi información', Icon(Icons.person), 9.0,
            9.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, false, () {
          showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                  insetPadding: EdgeInsets.symmetric(horizontal: 30.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: Container(
                    height: 510.0,
                    width: _size.width,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 20.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              'MODIFICAR MI INFORMACIÓN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color(0xff000024),
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Center(
                              child: Icon(Icons.contact_mail_outlined,
                                  size: 65.0)),
                          SizedBox(height: 20.0),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus varius nibh, sed porta ante pharetra.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  color: Color(0xff707070),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(height: 20.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text(
                              'INGRESA CONTRASEÑA',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Color(0xff000024),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.only(left: 15.0, top: 35.0),
                                hintText: '',
                                fillColor: Colors.white,
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xffF28740), width: 2.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  borderSide: BorderSide(
                                      color: Color(0xffC2C1C7), width: 1.5),
                                ),
                                labelStyle: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: 15,
                                    color: Colors.black),
                                alignLabelWithHint: true,
                              ),
                            ),
                          ),
                          SizedBox(height: 25.0),
                          Container(
                            width: _size.width,
                            height: 65.0,
                            child: Material(
                              color: Color(0xffF5F6F8),
                              child: InkWell(
                                  child: Container(
                                    width: _size.width,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 15.0,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'Cancelar',
                                          style: TextStyle(
                                              color: Color(0xff000024),
                                              fontFamily: 'Open Sans',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Container(
                                          width: 25.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                  }),
                            ),
                          ),
                          Container(
                            width: _size.width,
                            height: 65.0,
                            child: Material(
                              color: Color(0xffF28740),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(9),
                                  bottomLeft: Radius.circular(9)),
                              child: InkWell(
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(9),
                                      bottomLeft: Radius.circular(9)),
                                  child: Container(
                                    width: _size.width,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Container(
                                              width: 15.0,
                                            ),
                                          ],
                                        ),
                                        Text(
                                          'ENVIAR SOLICITUD',
                                          style: TextStyle(
                                              color: Color(0xffFFFFFF),
                                              fontFamily: 'Open Sans',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Container(
                                          width: 25.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) => Dialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        child: DialogCustom(
                                          colorIcon: Color(0xff000024),
                                          title: 'Solicitud Enviada',
                                          urlIcon:
                                              'assets/images/Icon simple-minutemailer.svg',
                                          message:
                                              'Tu solicitud ha sido enviada con éxito. Recibirás un Gmail para la confirmación del registro de tu cuenta.',
                                          btnText: 'ENTENDIDO',
                                          btnSecond: false,
                                          btnSecondText: '',
                                          svg: true,
                                          messageLines: 3,
                                          callback: () =>
                                              {Navigator.pop(context)},
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ]),
                  )));
        }),
      ],
    );
  }

  Widget _profileUserSecondary(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Row(children: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.keyboard_backspace,
              size: 35.0,
            ),
            onTap: () {
              setState(() {
                showUserSecondary = false;
              });
            },
          ),
          SizedBox(width: 10.0),
          Text(
            'USUARIOS SECUNDARIOS',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
        ]),
        SizedBox(height: 15.0),
        Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus varius nibh, ',
          style: TextStyle(
              color: Color(0xff707070),
              fontSize: 15.0,
              fontFamily: 'Open Sans'),
        ),
        SizedBox(height: 20.0),
        ItemProfileUserSecondary(
            icon: Image(
              image: AssetImage('assets/images/Elipse 14.png'),
            ),
            title: 'Lorem Ipsum Jipsum',
            name: 'Hermano',
            id: 'ID: #US9871OP',
            callback: () {
              setState(() {
                showUserSecondaryDetail = true;
              });
            },
            top: 1,
            bottom: 1,
            left: 1,
            right: 1,
            bright: 0,
            bleft: 0,
            tleft: 9,
            tright: 9,
            border: false),
        ItemProfileUserSecondary(
            icon: Image(
              image: AssetImage('assets/images/Elipse 14.png'),
            ),
            title: 'Lorem Ipsum Jipsum',
            name: 'Hermano',
            id: 'ID: #US9871OP',
            callback: () {
              setState(() {
                showUserSecondaryDetail = true;
              });
            },
            top: 1,
            bottom: 1,
            left: 1,
            right: 1,
            bright: 0,
            bleft: 0,
            tleft: 0,
            tright: 0,
            border: true),
        ItemProfileUserSecondary(
            icon: Image(
              image: AssetImage('assets/images/Elipse 14.png'),
            ),
            title: 'Lorem Ipsum Jipsum',
            name: 'Hermano',
            id: 'ID: #US9871OP',
            callback: () {
              setState(() {
                showUserSecondaryDetail = true;
              });
            },
            top: 1,
            bottom: 1,
            left: 1,
            right: 1,
            bright: 0,
            bleft: 0,
            tleft: 0,
            tright: 0,
            border: true),
        ItemProfileUserSecondary(
            icon: Image(
              image: AssetImage('assets/images/Elipse 14.png'),
            ),
            title: 'Lorem Ipsum Jipsum',
            name: 'Hermano',
            id: 'ID: #US9871OP',
            callback: () {
              setState(() {
                showUserSecondaryDetail = true;
              });
            },
            top: 1,
            bottom: 1,
            left: 1,
            right: 1,
            bright: 0,
            bleft: 0,
            tleft: 0,
            tright: 0,
            border: true),
        ItemProfileUserSecondary(
            icon: Image(
              image: AssetImage('assets/images/Elipse 14.png'),
            ),
            title: 'Lorem Ipsum Jipsum',
            name: 'Hermano',
            id: 'ID: #US9871OP',
            callback: () {
              setState(() {
                showUserSecondaryDetail = true;
              });
            },
            top: 1,
            bottom: 1,
            left: 1,
            right: 1,
            bright: 9,
            bleft: 9,
            tleft: 0,
            tright: 0,
            border: false),
        SizedBox(height: 25.0),
        Text('AGREGAR USUARIO SECUNDARIO',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff413F60),
                fontSize: 17.0,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600)),
        SizedBox(height: 3.0),
        Container(
          width: _size.width,
          height: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.0),
              border: Border.all(
                color: Color(0xff000024),
                width: 1.0,
              )),
          child: Material(
            borderRadius: BorderRadius.circular(9.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(9.0),
              onTap: () {
                showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                        insetPadding: EdgeInsets.symmetric(horizontal: 30.0),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        child: Container(
                          height: 504.0,
                          width: _size.width,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 25.0),
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(
                                      'AÑADIR USUARIO SEC.',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff000024),
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 15.0),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus varius nibh, sed porta ante pharetra. ',
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        color: Color(0xff707070),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    'ID DE USUARIO SECUNDARIO',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xff000024),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 15.0, top: 35.0),
                                      hintText: '',
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xffF28740),
                                            width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xffC2C1C7),
                                            width: 1.5),
                                      ),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 15,
                                          color: Colors.black),
                                      alignLabelWithHint: true,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: Text(
                                    'RELACION CON EL USUARIO',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Color(0xff000024),
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                SizedBox(height: 5.0),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(
                                          left: 15.0, top: 35.0),
                                      hintText: '',
                                      fillColor: Colors.white,
                                      filled: true,
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xffF28740),
                                            width: 2.0),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: BorderSide(
                                            color: Color(0xffC2C1C7),
                                            width: 1.5),
                                      ),
                                      labelStyle: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontSize: 15,
                                          color: Colors.black),
                                      alignLabelWithHint: true,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25.0),
                                Container(
                                  width: _size.width,
                                  height: 65.0,
                                  child: Material(
                                    color: Color(0xffF5F6F8),
                                    child: InkWell(
                                        child: Container(
                                          width: _size.width,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 15.0,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'Cancelar',
                                                style: TextStyle(
                                                    color: Color(0xff000024),
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Container(
                                                width: 25.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        }),
                                  ),
                                ),
                                Container(
                                  width: _size.width,
                                  height: 65.0,
                                  child: Material(
                                    color: Color(0xffF28740),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(9),
                                        bottomLeft: Radius.circular(9)),
                                    child: InkWell(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(9),
                                            bottomLeft: Radius.circular(9)),
                                        child: Container(
                                          width: _size.width,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Container(
                                                    width: 15.0,
                                                  ),
                                                ],
                                              ),
                                              Text(
                                                'AÑADIR USUARIO',
                                                style: TextStyle(
                                                    color: Color(0xffFFFFFF),
                                                    fontFamily: 'Open Sans',
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Container(
                                                width: 25.0,
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Navigator.pop(context);
                                        }),
                                  ),
                                ),
                              ]),
                        )));
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(children: <Widget>[
                      Icon(Icons.group, color: Color(0xffBDBDBF)),
                      SizedBox(width: 10.0),
                      Text(
                        'Añadir ID de Usuario Secundario',
                        style: TextStyle(
                            color: Color(0xffBDBDBF),
                            fontFamily: 'Open Sans',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600),
                      )
                    ]),
                    Row(children: <Widget>[
                      Icon(Icons.add, color: Color(0xffBDBDBF))
                    ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _profileHelpUsers(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 30.0,
        ),
        Row(children: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.keyboard_backspace,
              size: 35.0,
            ),
            onTap: () {
              setState(() {
                showUserHelp = false;
              });
            },
          ),
          SizedBox(width: 10.0),
          Text(
            'AYUDA PARA USUARIOS',
            textAlign: TextAlign.left,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 22.0,
                fontWeight: FontWeight.bold),
          ),
        ]),
        SizedBox(height: 20.0),
        Text('REPORTA UN PROBLEMA',
            style: TextStyle(
              color: Color(0xff413F60),
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Open Sans',
            )),
        SizedBox(height: 5.0),
        _option(
          context,
          'Asistencia por Whatsapp',
          Icon(Icons.check_sharp),
          1.0,
          1.0,
          9.0,
          9.0,
          1.0,
          1.0,
          1.0,
          1.0,
          false,
          () {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: DialogCustom(
                  title: 'Asistencia',
                  urlIcon: 'assets/images/Icon ionic-logo-whatsapp.svg',
                  message:
                      'TE REDIRIGIREMOS A WHATSAPP PARA AYUDARTE CON UN ASESOR DE ASISTENCIA',
                  btnText: 'SI, QUIERO ASISTENCIA',
                  btnSecond: true,
                  btnSecondText: 'Cancelar',
                  colorIcon: Color(0xff000024),
                  svg: true,
                  messageLines: 3,
                  callback: () => {Navigator.pop(context)},
                ),
              ),
            );
          },
        ),
        _option(context, 'Documentación', Icon(Icons.insert_drive_file), 9.0,
            9.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, false, () {
          setState(() {
            showUserDoc = true;
          });
        }),
        SizedBox(height: 30.0),
        Text('PREGUNTAS FRECUENTES',
            style: TextStyle(
              color: Color(0xff413F60),
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              fontFamily: 'Open Sans',
            )),
        SizedBox(height: 5.0),
        _option(
          context,
          'Categoría 1',
          Icon(Icons.health_and_safety),
          1.0,
          1.0,
          9.0,
          9.0,
          1.0,
          1.0,
          1.0,
          1.0,
          false,
          () {},
        ),
        _option(
          context,
          'Categoría 2',
          Icon(Icons.work),
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          true,
          () {},
        ),
        _option(
          context,
          'Categoría 3',
          Icon(Icons.people),
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          false,
          () {},
        ),
        _option(
          context,
          'Categoría 4',
          Icon(Icons.videocam),
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          true,
          () {},
        ),
        _option(
          context,
          'Categoría 5',
          Icon(Icons.video_library_rounded),
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          false,
          () {},
        ),
        _option(
          context,
          'Categoría 6',
          Icon(Icons.personal_video_sharp),
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          1.0,
          true,
          () {},
        ),
        _option(context, 'Categoría 7', Icon(Icons.insert_drive_file), 9.0, 9.0,
            1.0, 1.0, 1.0, 1.0, 1.0, 1.0, false, () {}),
      ],
    );
  }

  Widget _profileAboutUs(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 30.0,
          ),
          Row(children: <Widget>[
            GestureDetector(
              child: Icon(
                Icons.keyboard_backspace,
                size: 35.0,
              ),
              onTap: () {
                setState(() {
                  showUserAboutUs = false;
                });
              },
            ),
            SizedBox(width: 10.0),
            Text(
              'ACERCA DE',
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
            ),
          ]),
          SizedBox(height: 20.0),
          _option(
            context,
            'Acerca del aplicativo',
            Icon(Icons.info),
            1.0,
            1.0,
            9.0,
            9.0,
            1.0,
            1.0,
            1.0,
            1.0,
            false,
            () {},
          ),
          _option(context, 'Tutorial  de uso', Icon(Icons.insert_drive_file),
              9.0, 9.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, false, () {}),
        ]);
  }

  Widget _detail(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: _size.height,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                width: _size.width,
                color: Colors.black,
                child: Image(
                  image: AssetImage('assets/images/home3.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 3,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                height: 80.0,
                width: _size.width,
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              showDetailHistory = false;
                            });
                          },
                          child: Icon(Icons.arrow_back_sharp)),
                      Column(children: <Widget>[
                        Text(
                          'Sala Principal',
                          style: TextStyle(
                              color: Color(0xff000024),
                              fontSize: 23.0,
                              fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 0.0,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'ESTADO',
                              style: TextStyle(
                                  color: Color(0xff000024),
                                  fontSize: 15.0,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(width: 6.0),
                            Text(
                              'ACTIVO',
                              style: TextStyle(
                                  color: Color(0xffF28740),
                                  fontSize: 18.0,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ]),
                      GestureDetector(
                        child: Icon(Icons.edit),
                        onTap: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => Dialog(
                              insetPadding:
                                  EdgeInsets.symmetric(horizontal: 20.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: Container(
                                  width: _size.width,
                                  height: 327.0,
                                  padding: EdgeInsets.only(top: 25.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15.0),
                                    color: Colors.white,
                                  ),
                                  child: Column(children: <Widget>[
                                    Text(
                                      'Nombre de Cámara',
                                      style: TextStyle(
                                          color: Color(0xff000024),
                                          fontSize: 26.0,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      'EDITAR NOMBRE A TU CÁMARA',
                                      style: TextStyle(
                                          color: Color(0xff413F60),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 12.0,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0,
                                          bottom: 25.0,
                                          left: 15.0,
                                          right: 15.0),
                                      child: TextField(
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.only(
                                              left: 15.0, top: 35.0),
                                          hintText: 'Escribir aquí',
                                          fillColor: Colors.white,
                                          filled: true,
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Color(0xffF28740),
                                                width: 2.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            borderSide: BorderSide(
                                                color: Color(0xffC2C1C7),
                                                width: 1.5),
                                          ),
                                          labelStyle: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 15,
                                              color: Colors.black),
                                          alignLabelWithHint: true,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: _size.width,
                                      height: 65.0,
                                      child: Material(
                                        color: Color(0xffF5F6F8),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(3.9),
                                            bottomLeft: Radius.circular(3.9)),
                                        child: InkWell(
                                            child: Container(
                                              width: _size.width,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 15.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'Cancelar',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xff000024),
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Container(
                                                    width: 25.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                            }),
                                      ),
                                    ),
                                    Container(
                                      width: _size.width,
                                      height: 65.0,
                                      child: Material(
                                        color: Color(0xffF28740),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(9),
                                            bottomLeft: Radius.circular(9)),
                                        child: InkWell(
                                            child: Container(
                                              width: _size.width,
                                              child: Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: <Widget>[
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: <Widget>[
                                                      Container(
                                                        width: 15.0,
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    'GUARDAR CAMBIO',
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xffFFFFFF),
                                                        fontFamily: 'Open Sans',
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Container(
                                                    width: 25.0,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            onTap: () {
                                              Navigator.pop(context);
                                            }),
                                      ),
                                    ),
                                  ]))),
                        ),
                      )
                      // SvgPicture.asset(
                      //   'assets/images/Grupo 168.svg',
                      //   width: 31.0,
                      //   height: 31.0,
                      //   color: Color(0xff000024),
                      // ),
                    ]),
              ),
              Expanded(
                  child: Container(
                child: new ListView(
                  padding: EdgeInsets.only(
                      top: 20.0,
                      left: _size.width * 0.05,
                      right: _size.width * 0.05,
                      bottom: 80.0),
                  shrinkWrap: true,
                  children: <Widget>[
                    Container(
                      width: _size.width,
                      height: 220.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          border:
                              Border.all(color: Color(0xffBDBDBF), width: 1.5)),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Icon(Icons.group),
                                    SizedBox(
                                      width: 12.0,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Compartido con Secundarios (3)',
                                          overflow: TextOverflow.clip,
                                          style: TextStyle(
                                              color: Color(0xff000024),
                                              fontSize: 17.0,
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w700),
                                        ),
                                        SizedBox(
                                          height: 2.0,
                                        ),
                                        Text(
                                          'Comparte cámara con Usuarios',
                                          style: TextStyle(
                                              color: Color(0xffBDBDBF),
                                              fontSize: 15.0,
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                        image: AssetImage(
                                            'assets/images/Elipse 12.png')),
                                    SizedBox(width: 8.0),
                                    Image(
                                        image: AssetImage(
                                            'assets/images/Elipse 13.png')),
                                    SizedBox(width: 8.0),
                                    Image(
                                        image: AssetImage(
                                            'assets/images/Elipse 14.png'))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 54.7,
                            width: _size.width,
                            child: Material(
                              color: Color(0xffF5F6F8),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(7.0),
                                bottomRight: Radius.circular(6.0),
                              ),
                              child: InkWell(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(
                                      Icons.add,
                                      size: 28.0,
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Text(
                                      'Editar usuarios secundarios',
                                      style: TextStyle(
                                          color: Color(0xff000024),
                                          fontSize: 17.0,
                                          fontFamily: 'Open Sans',
                                          fontWeight: FontWeight.w700),
                                    )
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(7.0),
                                  bottomRight: Radius.circular(6.0),
                                ),
                                onTap: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) => Dialog(
                                        insetPadding: EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0))),
                                        child: Container(
                                          width: _size.width,
                                          height: 495.0,
                                          padding: EdgeInsets.only(top: 25.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15.0),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'Compartir Cámara',
                                                  style: TextStyle(
                                                      color: Color(0xff000024),
                                                      fontSize: 26.0,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                SizedBox(
                                                  height: 5.0,
                                                ),
                                                Text(
                                                  'AGREGA O QUITA USUARIOS SECUNDARIOS',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Color(0xff413F60),
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 15.0,
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 15.0),
                                                  child: Column(
                                                    children: [
                                                      ItemDialogIcon(
                                                          icon: Image(
                                                              image: AssetImage(
                                                                  'assets/images/Elipse 31.png')),
                                                          name:
                                                              'Lorem Ipsum Jipsum',
                                                          description:
                                                              'Hermano',
                                                          position: 1),
                                                      ItemDialogIcon(
                                                          icon: Image(
                                                              image: AssetImage(
                                                                  'assets/images/Elipse 32.png')),
                                                          name:
                                                              'Lorem Ipsum Jipsum',
                                                          description: 'Nuera',
                                                          position: 2),
                                                      ItemDialogIcon(
                                                          icon: Image(
                                                              image: AssetImage(
                                                                  'assets/images/Elipse 31.png')),
                                                          name:
                                                              'Lorem Ipsum Jipsum',
                                                          description:
                                                              'Hermano',
                                                          position: 2),
                                                      ItemDialogIcon(
                                                          icon: Image(
                                                              image: AssetImage(
                                                                  'assets/images/Elipse 32.png')),
                                                          name:
                                                              'Lorem Ipsum Jipsum',
                                                          description: 'Nuera',
                                                          position: 3),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 20.0,
                                                ),
                                                Container(
                                                  width: _size.width,
                                                  height: 65.0,
                                                  child: Material(
                                                    color: Color(0xffF5F6F8),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight:
                                                                Radius.circular(
                                                                    3.9),
                                                            bottomLeft: Radius
                                                                .circular(3.9)),
                                                    child: InkWell(
                                                        child: Container(
                                                          width: _size.width,
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    width: 15.0,
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                'Cancelar',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xff000024),
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Container(
                                                                width: 25.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                  ),
                                                ),
                                                Container(
                                                  width: _size.width,
                                                  height: 65.0,
                                                  child: Material(
                                                    color: Color(0xffF28740),
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            bottomRight: Radius
                                                                .circular(9),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    9)),
                                                    child: InkWell(
                                                        child: Container(
                                                          width: _size.width,
                                                          child: Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: <Widget>[
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: <
                                                                    Widget>[
                                                                  Container(
                                                                    width: 15.0,
                                                                  ),
                                                                ],
                                                              ),
                                                              Text(
                                                                'GUARDAR CAMBIOS',
                                                                style: TextStyle(
                                                                    color: Color(
                                                                        0xffFFFFFF),
                                                                    fontFamily:
                                                                        'Open Sans',
                                                                    fontSize:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700),
                                                              ),
                                                              Container(
                                                                width: 25.0,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        }),
                                                  ),
                                                ),
                                              ]),
                                        ))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'OPCIONES DE CÁMARA',
                      style: TextStyle(
                          color: Color(0xff413F60),
                          fontSize: 16.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                        width: _size.width,
                        height: 67.0,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffBDBDBF)),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(9.0),
                                topRight: Radius.circular(9.0))),
                        child: Material(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(9.0),
                              topRight: Radius.circular(9.0)),
                          child: InkWell(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(9.0),
                                topRight: Radius.circular(9.0)),
                            child: Container(
                              width: _size.width,
                              padding: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(Icons.star),
                                      SizedBox(
                                        width: 15.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Agregar a Favoritos',
                                            style: TextStyle(
                                              color: Color(0xff000024),
                                              fontSize: 19.0,
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            'Cámara guardada en favoritos',
                                            style: TextStyle(
                                              color: Color(0xffBDBDBF),
                                              fontSize: 15.5,
                                              fontFamily: 'Open Sans',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                      width: 20.0,
                                      child: CupertinoSwitch(
                                        value: _switchValue,
                                        activeColor: Color(0xffF28740),
                                        onChanged: (value) {
                                          setState(() {
                                            _switchValue = value;
                                          });
                                        },
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )),
                    _optionCamera(
                        context,
                        'Historial de Grabaciones',
                        Icon(Icons.video_collection_sharp),
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        false, () {
                      setState(() {
                        showRecords = true;
                      });
                    }),
                    _optionCamera(
                        context,
                        'Grupos de cámaras',
                        Icon(Icons.featured_video),
                        9.0,
                        9.0,
                        9.0,
                        9.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        true, () {
                      showGroupHome = true;
                      showGroupHomeDetail = false;
                      _onItemTapped(0);
                    }),
                    _optionCamera(
                        context,
                        'Información Técnica',
                        Icon(Icons.info),
                        9.0,
                        9.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        false, () {
                      setState(() {
                        infoTechnical = true;
                      });
                    }),
                    SizedBox(height: 20.0),
                    Text(
                      'REPORTA UN PROBLEMA',
                      style: TextStyle(
                          color: Color(0xff413F60),
                          fontSize: 16.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 5.0),
                    _optionCamera(
                        context,
                        'Asistencia vía Whatsapp',
                        Icon(Icons.message),
                        1.0,
                        1.0,
                        9.0,
                        9.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        false, () {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          child: DialogCustom(
                            title: 'Asistencia',
                            urlIcon:
                                'assets/images/Icon ionic-logo-whatsapp.svg',
                            message:
                                'TE REDIRIGIREMOS A WHATSAPP PARA AYUDARTE CON UN ASESOR DE ASISTENCIA',
                            btnText: 'SI, QUIERO ASISTENCIA',
                            btnSecond: true,
                            btnSecondText: 'Cancelar',
                            colorIcon: Color(0xff000024),
                            svg: true,
                            messageLines: 3,
                            callback: () => {Navigator.pop(context)},
                          ),
                        ),
                      );
                    }),
                    _optionCamera(
                        context,
                        'Preguntas Frecuentes',
                        Icon(Icons.help),
                        9.0,
                        9.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        1.0,
                        false, () {
                      showUserHelp = true;
                      _onItemTapped(2);
                    }),
                  ],
                ),
              ))
            ],
          ),
          Positioned(
              top: 100.0,
              left: _size.width * 0.45,
              child: Container(
                width: 50.0,
                height: 50.0,
                padding: EdgeInsets.all(0.0),
                margin: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => VideoPage(
                              url:
                                  'http://147.182.138.100:4000/2021-09-23/video_001/15/15-07-07-15-15-00.mp4')));
                    },
                    borderRadius: BorderRadius.circular(30.0),
                    child: Icon(Icons.play_arrow,
                        color: Color(0xffF28740), size: 45.0),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Widget _optionCamera(
    BuildContext context,
    String text,
    Icon icon,
    double bleft,
    double bright,
    double tleft,
    double tright,
    double top,
    double bottom,
    double left,
    double right,
    bool border,
    VoidCallback callback,
  ) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 57.0,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
              color: Color(0xffBDBDBF),
              width: (() {
                if (!border) {
                  return bottom;
                }
                return 0.0;
              })(),
            ),
            top: BorderSide(
              color: Color(0xffBDBDBF),
              width: (() {
                if (!border) {
                  return top;
                }
                return 0.0;
              })(),
            ),
            left: BorderSide(color: Color(0xffBDBDBF), width: left),
            right: BorderSide(color: Color(0xffBDBDBF), width: right)),
        borderRadius: (() {
          if (!border) {
            return BorderRadius.only(
                bottomLeft: Radius.circular(bleft),
                bottomRight: Radius.circular(bright),
                topLeft: Radius.circular(tleft),
                topRight: Radius.circular(tright));
          }
        })(),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bleft),
            bottomRight: Radius.circular(bright),
            topLeft: Radius.circular(tleft),
            topRight: Radius.circular(tright)),
        child: InkWell(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(bleft),
                bottomRight: Radius.circular(bright),
                topLeft: Radius.circular(tleft),
                topRight: Radius.circular(tright)),
            child: Container(
              width: _size.width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      icon,
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          color: Color(0xff000024),
                          fontSize: 19.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 20.0,
                    child: Icon(
                      Icons.chevron_right,
                      color: Color(0xffC2C1C7),
                    ),
                  )
                ],
              ),
            ),
            onTap: callback),
      ),
    );
  }

  Widget _option(
    BuildContext context,
    String text,
    Icon icon,
    double bleft,
    double bright,
    double tleft,
    double tright,
    double top,
    double bottom,
    double left,
    double right,
    bool border,
    VoidCallback callback,
  ) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 57.0,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
              color: Color(0xff000024),
              width: (() {
                if (!border) {
                  return bottom;
                }
                return 0.0;
              })(),
            ),
            top: BorderSide(
              color: Color(0xff000024),
              width: (() {
                if (!border) {
                  return top;
                }
                return 0.0;
              })(),
            ),
            left: BorderSide(color: Color(0xff000024), width: left),
            right: BorderSide(color: Color(0xff000024), width: right)),
        borderRadius: (() {
          if (!border) {
            return BorderRadius.only(
                bottomLeft: Radius.circular(bleft),
                bottomRight: Radius.circular(bright),
                topLeft: Radius.circular(tleft),
                topRight: Radius.circular(tright));
          }
        })(),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bleft),
            bottomRight: Radius.circular(bright),
            topLeft: Radius.circular(tleft),
            topRight: Radius.circular(tright)),
        child: InkWell(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(bleft),
                bottomRight: Radius.circular(bright),
                topLeft: Radius.circular(tleft),
                topRight: Radius.circular(tright)),
            child: Container(
              width: _size.width,
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      icon,
                      SizedBox(
                        width: 15.0,
                      ),
                      Text(
                        text,
                        style: TextStyle(
                          color: Color(0xff000024),
                          fontSize: 19.0,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 20.0,
                    child: Icon(
                      Icons.chevron_right,
                      color: Color(0xffC2C1C7),
                    ),
                  )
                ],
              ),
            ),
            onTap: callback),
      ),
    );
  }

  Widget _optionList(
    BuildContext context,
    String text,
    Icon icon,
    double bleft,
    double bright,
    double tleft,
    double tright,
    double top,
    double bottom,
    double left,
    double right,
    bool border,
    VoidCallback callback,
  ) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 80.0,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
              color: Color(0xff000024),
              width: bottom,
            ),
            top: BorderSide(
              color: Color(0xff000024),
              width: top,
            ),
            left: BorderSide(color: Color(0xff000024), width: left),
            right: BorderSide(color: Color(0xff000024), width: right)),
        borderRadius: (() {
          if (!border) {
            return BorderRadius.only(
                bottomLeft: Radius.circular(bleft),
                bottomRight: Radius.circular(bright),
                topLeft: Radius.circular(tleft),
                topRight: Radius.circular(tright));
          }
        })(),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bleft),
            bottomRight: Radius.circular(bright),
            topLeft: Radius.circular(tleft),
            topRight: Radius.circular(tright)),
        child: InkWell(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(bleft),
                bottomRight: Radius.circular(bright),
                topLeft: Radius.circular(tleft),
                topRight: Radius.circular(tright)),
            child: Container(
              width: _size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      icon,
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            text,
                            style: TextStyle(
                              color: Color(0xff000024),
                              fontSize: 17.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Cámara 04',
                            style: TextStyle(
                              color: Color(0xff707070),
                              fontSize: 16.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'ESTADO',
                            style: TextStyle(
                              color: Color(0xff707070),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            'Activo',
                            style: TextStyle(
                              color: Color(0xffF28740),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 20.0,
                        child: Icon(
                          Icons.chevron_right,
                          color: Color(0xffC2C1C7),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: callback),
      ),
    );
  }
}
