import 'dart:convert';
import 'dart:developer';
import 'package:appvuela/@data/model/register/verify.dart';
import 'package:appvuela/@presentation/pages/register/registerCode.dart';
import 'package:flutter/material.dart';
import 'package:appvuela/@presentation/shared/btnForm.dart';
import 'package:appvuela/@presentation/shared/inputForm.dart';
import 'package:appvuela/@presentation/shared/dialog.dart';
import 'package:http/http.dart' as http;
import 'package:appvuela/@presentation/env.dart' as env;
import 'package:flutter/cupertino.dart';

class RegisterPhonePage extends StatefulWidget {
  bool showOptions;
  RegisterPhonePage({required this.showOptions});
  @override
  State<StatefulWidget> createState() {
    return RegisterPhoneState();
  }
}

class RegisterPhoneState extends State<RegisterPhonePage> {
  TextEditingController _phoneController = TextEditingController();

  Future<Verify> sendCode() async {
    var url = env.ip + 'api/tusers/signup_1_verify/';
    var petition = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'cellphone': _phoneController.text,
      }),
    );
    log(petition.statusCode.toString());
    var json = jsonDecode(petition.body);
    var response = Verify.fromMap(json);
    log(response.token);
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            RegisterCodePage(showOptions: widget.showOptions)));
    // showCupertinoDialog(context: context, builder: successDialog);
    // if (response.access != '') {
    //   showCupertinoDialog(context: context, builder: successDialog);
    // } else {
    //   showCupertinoDialog(context: context, builder: errorDialog);
    // }
    return response;
  }

  validatePhone() {
    String patterPhone = r'^(?:[+0]9)?[0-9]{6}$';
    RegExp regex = new RegExp(patterPhone);
    if (_phoneController.text == ''
        // || !regex.hasMatch(_phoneController.text)
        ) {
      showCupertinoDialog(context: context, builder: requeridDialog);
    } else {
      sendCode();
    }
  }

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
          Text('Regístra tu celular',
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Ingresa tu móvil',
            style: TextStyle(
              color: Color(0xff413F60),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          InputFormCustom(
            keyboard: TextInputType.number,
            hintText: '000 000 000',
            icon: Icon(Icons.phone_iphone),
            controller: _phoneController,
            obscure: false,
          ),
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
          Text(
              'Si continúas, se enviará un SMS para verificar la cuenta. Es posible que se apliquen los precios de mensajes y datos.',
              style: TextStyle(
                  color: Color(0xff413F60),
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400)),
          SizedBox(
            height: 20.0,
          ),
          BtnCustomForm(
              text: 'Continuar',
              color: Color(0xff000024),
              border: Color(0xff000024),
              textColor: Colors.white,
              callback: () => {
                    // validatePhone(),
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            RegisterCodePage(showOptions: widget.showOptions))),
                  }),
          SizedBox(
            height: 10.0,
          ),
        ]),
      ),
    );
  }

  Widget requeridDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text('Por favor'),
        content: Text('Ingrese un número de teléfono válido'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
        ],
      );

  Widget successDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text('Correcto'),
        content: Text('Se envío el código vía SMS a su teléfono'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () => {
              Navigator.pop(context),
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      RegisterCodePage(showOptions: widget.showOptions)))
            },
          )
        ],
      );
}
