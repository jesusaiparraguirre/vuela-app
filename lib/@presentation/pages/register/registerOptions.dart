import 'package:appvuela/@presentation/pages/register/registerPhone.dart';
import 'package:appvuela/@presentation/shared/btn.dart';
import 'package:flutter/material.dart';
import 'package:appvuela/@presentation/shared/btnForm.dart';
import 'package:appvuela/@presentation/shared/dialog.dart';

class RegisterOptionsPage extends StatefulWidget {
  bool showOptions;
  RegisterOptionsPage({required this.showOptions});

  @override
  State<StatefulWidget> createState() {
    return RegisterOptionsState();
  }
}

class RegisterOptionsState extends State<RegisterOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: <Widget>[
              SliverList(
                  delegate: SliverChildListDelegate([
                _form(context),
              ]))
            ],
            // children: <Widget>[_fondo(context), _form(context)],
          ),
          _footer(context)
        ],
      ),
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
                        colorIcon: Color(0xff000024),
                        title: 'Asistencia',
                        urlIcon: 'assets/images/Icon ionic-logo-whatsapp.svg',
                        message:
                            'TE REDIRIGIREMOS A WHATSAPP PARA AYUDARTE CON UN ASESOR DE ASISTENCIA',
                        btnText: 'SI, QUIERO ASISTENCIA',
                        btnSecond: true,
                        btnSecondText: 'Cancelar',
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
          Text('Regístrate en Vuela',
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Selecciona un método de registro',
            style: TextStyle(
              color: Color(0xff413F60),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          BtnCustom(
              text: 'Registrarme con celular',
              textColor: Color(0xff000024),
              color: Colors.white,
              colorSvg: Color(0xff02a0b2),
              border: Color(0xffF28740),
              callback: () {},
              icon: true,
              svg: true,
              urlIcon: 'assets/images/ICONO CELULAR.svg'),
          SizedBox(
            height: 15.0,
          ),
          (() {
            if (widget.showOptions) {
              return Column(
                children: <Widget>[
                  BtnCustom(
                      text: 'Registrarme con Google',
                      textColor: Color(0xffC2C1C7),
                      color: Colors.white,
                      colorSvg: Color(0xff02a0b2),
                      border: Color(0xffC2C1C7),
                      callback: () {},
                      icon: true,
                      svg: false,
                      urlIcon: 'assets/images/google-logo.png'),
                  SizedBox(
                    height: 15.0,
                  ),
                  BtnCustom(
                      text: 'Registrarme con Facebook',
                      textColor: Color(0xffC2C1C7),
                      color: Colors.white,
                      colorSvg: Color(0xff1B54CF),
                      border: Color(0xffC2C1C7),
                      callback: () {},
                      icon: true,
                      svg: true,
                      urlIcon: 'assets/images/Icon awesome-facebook.svg'),
                ],
              );
            }
            return Container();
          })(),
        ],
      ),
    );
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
              text: 'Continuar',
              color: Color(0xff000024),
              border: Color(0xff000024),
              textColor: Colors.white,
              callback: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            RegisterPhonePage(showOptions: widget.showOptions)))
                  }),
          SizedBox(
            height: 10.0,
          ),
        ]),
      ),
    );
  }
}
