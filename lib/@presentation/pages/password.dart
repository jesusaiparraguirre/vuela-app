import 'package:flutter/material.dart';
import 'package:appvuela/@presentation/shared/dialog.dart';
import 'package:appvuela/@presentation/shared/inputForm.dart';
import 'package:appvuela/@presentation/shared/btnForm.dart';

class PasswordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PasswordState();
  }
}

class PasswordState extends State<PasswordPage> {
  TextEditingController _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
          Text('Recuperar contraseña',
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 6.0,
          ),
          Text(
            'Ingresa tu número de celular',
            style: TextStyle(
                color: Color(0xff413F60),
                fontSize: 16.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 35.0,
          ),
          InputFormCustom(
            keyboard: TextInputType.text,
            hintText: 'Ingresar número celular',
            icon: Icon(Icons.phone_android),
            controller: _phoneController,
            obscure: false,
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget _footer(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Positioned(
      bottom: 25.0,
      child: Container(
        width: _size.width,
        padding: EdgeInsets.only(
            left: _size.width * 0.05, right: _size.width * 0.05),
        child: Column(children: <Widget>[
          BtnCustomForm(
            text: 'Enviar',
            color: Color(0xff000024),
            border: Color(0xff000024),
            textColor: Colors.white,
            callback: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: DialogCustom(
                  btnSecond: false,
                  btnSecondText: '',
                  colorIcon: Color(0xff000024),
                  title: 'Recuperación',
                  urlIcon: 'assets/images/Icon material-sms.svg',
                  message:
                      'RECIBIRÁS UN MENSAJE EN TU CELULAR CON LA CONTRASEÑA PARA ACCEDER',
                  btnText: 'Entendido',
                  svg: true,
                  messageLines: 2,
                  callback: () => {
                    Navigator.pop(context),
                    Navigator.pushNamed(context, 'main')
                  },
                ),
              ),
            ),
            // ),
            // SizedBox(
            //   height: 10.0,
            // ),
          ),
        ]),
      ),
    );
  }
}
