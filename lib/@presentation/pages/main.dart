import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:appvuela/@presentation/shared/btn.dart';
import 'package:appvuela/@presentation/pages/login.dart';
import 'dart:developer';

void main() => runApp(MainPage());

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainState();
  }
}

class MainState extends State<MainPage> {
  bool showOptions = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _fondo(context),
          _logo(context),
          _form(context),
          _footer(context)
        ],
      ),
    );
  }

  Widget _fondo(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height,
      width: _size.width,
      color: Colors.white,
    );
  }

  Widget _logo(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.40,
      width: _size.width,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          SvgPicture.asset(
            "assets/images/Grupo 26.svg",
            height: 88.0,
            width: 142.0,
            color: Color(0xfff28740),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Bienvenidos a Vuela',
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 30.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5.0),
          Text('Disfruta con seguridad y alegría',
              style: TextStyle(color: Color(0xff707070), fontSize: 16))
        ],
      ),
    );
  }

  Widget _form(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height * 0.45,
      width: _size.width,
      margin: EdgeInsets.only(top: _size.height * 0.45),
      child: _buttonUsers(context),
    );
  }

  Widget _buttonUsers(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _size.width * 0.07),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Selecciona el tipo de usuario',
            style: TextStyle(color: Color(0xff000024), fontSize: 14.0),
          ),
          SizedBox(height: 10.0),
          BtnCustom(
            text: 'Usuario Principal',
            textColor: Colors.white,
            color: Color(0xffF28740),
            colorSvg: Colors.white,
            border: Color(0xffF28740),
            icon: false,
            svg: false,
            urlIcon: '',
            callback: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(showOptions: true)))
            },
          ),
          SizedBox(height: 10.0),
          BtnCustom(
            text: 'Usuario Secundario',
            textColor: Colors.white,
            color: Color(0xff000024),
            colorSvg: Colors.white,
            border: Color(0xff000024),
            icon: false,
            svg: false,
            urlIcon: '',
            callback: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => LoginPage(showOptions: false)))
            },
          ),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: _size.height * 0.85),
      width: _size.width * 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            "assets/images/Grupo 25.svg",
            height: 34.0,
            width: 127.0,
            color: Color(0xff8C8C8C),
          ),
          SizedBox(height: 12.0),
          Text(
            'v. 2.4155',
            style: TextStyle(
              fontSize: 14.0,
              color: Color(0xff8C8C8C),
              fontFamily: 'Open Sans',
            ),
          )
        ],
      ),
    );
  }
}
