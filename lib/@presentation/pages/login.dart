import 'dart:convert';
import 'package:appvuela/@data/model/login.dart';
import 'package:appvuela/@presentation/pages/home.dart';
import 'package:appvuela/@presentation/pages/register/registerOptions.dart';
import 'package:flutter/material.dart';
import 'package:appvuela/@presentation/shared/btnForm.dart';
import 'package:appvuela/@presentation/shared/inputForm.dart';
import 'package:appvuela/@presentation/shared/dialog.dart';
import 'dart:developer';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:appvuela/@presentation/env.dart' as env;

class LoginPage extends StatefulWidget {
  bool showOptions;
  LoginPage({required this.showOptions});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<LoginPage> {
  bool exampleFocus = false;
  bool showOptions = false;
  String dropdownValue = '+51';
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  login() {
    if (_userController.text == '' || _passwordController.text == '') {
      showCupertinoDialog(context: context, builder: requeridDialog);
    } else {
      postLogin();
    }
  }

  Future<Login> postLogin() async {
    var url = env.ip + 'api/auth/login/';
    var petition = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'cellphone': _userController.text,
        'password': _passwordController.text,
      }),
    );
    var json = jsonDecode(petition.body);
    var response = Login.fromMap(json);
    log(response.access);
    if (response.access != '') {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => HomePage(userPrimary: showOptions)));
      // showCupertinoDialog(context: context, builder: successDialog);
    } else {
      showCupertinoDialog(context: context, builder: errorDialog);
    }
    return response;
  }

  @override
  Widget build(BuildContext context) {
    showOptions = widget.showOptions;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverList(delegate: SliverChildListDelegate([_form(context)]))
          ],
        ),
        _footer(context)
      ]),
    );
  }

  Widget _form(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      height: _size.height,
      width: _size.width,
      color: Colors.white,
      padding: EdgeInsets.only(
          top: 50.0, left: _size.width * 0.05, right: _size.width * 0.05),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: _size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                GestureDetector(
                  onTap: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
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
                  ),
                  child: Text('¿Asistencia?',
                      textAlign: TextAlign.end,
                      style:
                          TextStyle(color: Color(0xffADACBC), fontSize: 16.0)),
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          _mail(context),
        ],
      ),
    );
  }

  Widget _mail(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Iniciar Sesión',
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Ingresa tus datos para iniciar sesión',
            style: TextStyle(
                color: Color(0xff413F60),
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 35.0,
          ),
          InputFormCustom(
            keyboard: TextInputType.number,
            hintText: 'Ingresar número celular',
            icon: Icon(Icons.person),
            controller: _userController,
            obscure: false,
          ),
          SizedBox(
            height: 10.0,
          ),
          InputFormCustom(
            keyboard: TextInputType.text,
            hintText: 'Ingresar clave',
            icon: Icon(Icons.lock),
            controller: _passwordController,
            obscure: true,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Text(
                '¿Olvidaste tu contraseña?',
                style: TextStyle(color: Color(0xff000024), fontSize: 14.0),
              ),
              GestureDetector(
                onTap: () => {Navigator.pushNamed(context, 'password')},
                child: Text(
                  'Recupérala',
                  style: TextStyle(
                      color: Color(0xff000024),
                      fontSize: 14.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
          // _footer(context)
        ]);
  }

  Widget _footer(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 15.0,
      child: Container(
        width: _size.width,
        padding: EdgeInsets.only(
            left: _size.width * 0.05, right: _size.width * 0.05),
        child: Column(children: <Widget>[
          BtnCustomForm(
              text: 'Soy Nuevo',
              color: Colors.white,
              border: Color(0xff000024),
              textColor: Color(0xff000024),
              callback: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        RegisterOptionsPage(showOptions: showOptions)));
              }),
          SizedBox(
            height: 10.0,
          ),
          BtnCustomForm(
              text: 'Ingresar',
              color: Color(0xffF28740),
              border: Color(0xffF28740),
              textColor: Colors.white,
              callback: () {
                // login();
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(userPrimary: showOptions)));
              }),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: _size.width * 0.4,
                height: 1.0,
                color: Color(0xffADACBC),
              ),
              Text(
                'o',
                style: TextStyle(
                  color: Color(0xffADACBC),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                width: _size.width * 0.4,
                height: 1.0,
                color: Color(0xffADACBC),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text(
              'Ingresar con ',
              style: TextStyle(
                  color: Color(0xff707070),
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(width: 10.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffC2C1C7), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 50.0,
              width: 50.0,
              child: Material(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                child: InkWell(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            HomePage(userPrimary: showOptions))),
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: DialogCustom(
                                  title: 'Sesión iniciada',
                                  message: 'Iniciaste sesión con Google',
                                  urlIcon: 'assets/images/google-logox2.png',
                                  btnText: 'Entendido',
                                  btnSecond: false,
                                  btnSecondText: '',
                                  colorIcon: Color(0xff000024),
                                  svg: false,
                                  messageLines: 2,
                                  callback: () {
                                    Navigator.pop(context);
                                  }),
                            ))
                  },
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image(
                    image: AssetImage('assets/images/google-logo.png'),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffC2C1C7), width: 1.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 50.0,
              width: 50.0,
              child: Material(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                child: InkWell(
                  onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            HomePage(userPrimary: showOptions))),
                    showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0))),
                              child: DialogCustom(
                                  colorIcon: Color(0xff1B54CF),
                                  title: 'Sesión iniciada',
                                  message: 'Iniciaste sesión con Facebook \n',
                                  urlIcon:
                                      'assets/images/Icon awesome-facebook.svg',
                                  btnText: 'Entendido',
                                  btnSecond: false,
                                  btnSecondText: '',
                                  svg: true,
                                  messageLines: 2,
                                  callback: () {
                                    Navigator.pop(context);
                                  }),
                            ))
                  },
                  borderRadius: BorderRadius.circular(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/images/Icon awesome-facebook.svg",
                        width: 32.0,
                        height: 32.0,
                        color: Color(0xff1b54cf),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ])
        ]),
      ),
    );
  }

  Widget requeridDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text('Por favor'),
        content: Text('Complete todos los campos requeridos'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () => {Navigator.pop(context)},
          )
        ],
      );

  Widget successDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text('Correcto'),
        content: Text('Bienvenido'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () =>
                {Navigator.pop(context), Navigator.pushNamed(context, 'home')},
          )
        ],
      );
  Widget errorDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text('Error'),
        content: Text('No se encontró una cuenta activa'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () => {Navigator.pop(context)},
          )
        ],
      );
}
