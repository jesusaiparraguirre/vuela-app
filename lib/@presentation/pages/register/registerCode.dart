import 'package:appvuela/@presentation/pages/register/registerSuccess.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appvuela/@presentation/shared/btnForm.dart';
import 'package:appvuela/@presentation/shared/inputForm.dart';
import 'package:appvuela/@presentation/shared/dialog.dart';
import 'package:pinput/pin_put/pin_put.dart';

class RegisterCodePage extends StatefulWidget {
  bool showOptions;
  RegisterCodePage({required this.showOptions});
  @override
  State<StatefulWidget> createState() {
    return RegisterCodeState();
  }
}

class RegisterCodeState extends State<RegisterCodePage> {
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  validateCode() {
    if (_pinPutController.text.length < 4) {
      showCupertinoDialog(context: context, builder: requeridDialog);
    } else {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              RegisterSuccessPage(showOptions: widget.showOptions)));
    }
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Color(0xffF28740), width: 1.5),
      borderRadius: BorderRadius.circular(8.0),
    );
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
          Text('Código de acceso',
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Ingresa el código que te enviamos',
            style: TextStyle(
              color: Color(0xff413F60),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Container(
            width: _size.width,
            height: 50.0,
            child: PinPut(
              keyboardType: TextInputType.number,
              textStyle: TextStyle(
                fontSize: 22.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w400,
                color: Color(0xffC2C1C7),
              ),
              fieldsCount: 4,
              eachFieldWidth: _size.width * 0.2,
              onSubmit: (String pin) => _pinPutFocusNode.unfocus(),
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(8.0),
                color: Color(0xffFFFFFF),
              ),
              selectedFieldDecoration: _pinPutDecoration,
              followingFieldDecoration: _pinPutDecoration.copyWith(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Color(0xffC2C1C7), width: 1.5),
              ),
            ),
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
          Row(
            children: [
              Text('¿No te ha llegado el código?',
                  style: TextStyle(
                      color: Color(0xff413F60),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400)),
              SizedBox(width: 5.0),
              Text('Solicíta otro',
                  style: TextStyle(
                      color: Color(0xffF28740),
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          BtnCustomForm(
              text: 'Finalizar',
              color: Color(0xff000024),
              border: Color(0xff000024),
              textColor: Colors.white,
              callback: () => {validateCode()}),
          SizedBox(
            height: 10.0,
          ),
        ]),
      ),
    );
  }

  Widget requeridDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text('Por favor'),
        content: Text('Ingrese un código de 4 dígitos'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () => {
              Navigator.pop(context),
            },
          ),
        ],
      );
}
