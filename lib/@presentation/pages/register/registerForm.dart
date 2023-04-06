import 'package:appvuela/@presentation/shared/inputForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:appvuela/@presentation/shared/btnForm.dart';
import 'package:appvuela/@presentation/shared/dialog.dart';

class RegisterFormPage extends StatefulWidget {
  bool showOptions;
  RegisterFormPage({required this.showOptions});
  @override
  State<StatefulWidget> createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterFormPage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  bool isChecked = false;

  validate() {
    if (widget.showOptions) {
      if (_nameController.text == '' ||
          _phoneController.text == '' ||
          _addressController.text == '') {
        showCupertinoDialog(context: context, builder: requeridDialog);
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: DialogCustom(
              colorIcon: Color(0xff000024),
              title: 'Solicitud Enviada',
              urlIcon: 'assets/images/Icon simple-minutemailer.svg',
              message:
                  'Tu solicitud ha sido enviada con éxito. Recibirás un Gmail para la confirmación del registro de tu cuenta.',
              btnText: 'ENTENDIDO',
              btnSecond: false,
              btnSecondText: '',
              svg: true,
              messageLines: 3,
              callback: () => {
                Navigator.pushNamed(context, 'main')
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>
                //         LoginPage(showOptions: true)))
              },
            ),
          ),
        );
      }
    } else {
      if (_nameController.text == '' ||
          _phoneController.text == '' ||
          _mailController.text == '' ||
          _codeController.text == '') {
        showCupertinoDialog(context: context, builder: requeridDialog);
      } else {
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => Dialog(
            child: DialogCustom(
              colorIcon: Color(0xff000024),
              title: 'Solicitud Enviada',
              urlIcon: 'assets/images/Icon simple-minutemailer.svg',
              message:
                  'Tu solicitud ha sido enviada con éxito. Recibirás un Gmail para la confirmación del registro de tu cuenta.',
              btnText: 'ENTENDIDO',
              btnSecond: false,
              btnSecondText: '',
              svg: true,
              messageLines: 3,
              callback: () => {
                Navigator.pushNamed(context, 'main')
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) =>
                //         LoginPage(showOptions: true)))
              },
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Text('Activar mi cuenta',
              style: TextStyle(
                  color: Color(0xff000024),
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700)),
          SizedBox(
            height: 5.0,
          ),
          Text(
            'Por favor ingresa los datos solicitados',
            style: TextStyle(
              color: Color(0xff413F60),
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          (() {
            if (widget.showOptions) {
              return Column(
                children: <Widget>[
                  InputFormCustom(
                    keyboard: TextInputType.text,
                    hintText: 'Nombre completo',
                    icon: Icon(Icons.person),
                    controller: _nameController,
                    obscure: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InputFormCustom(
                    keyboard: TextInputType.number,
                    hintText: 'Teléfono',
                    icon: Icon(Icons.phone),
                    controller: _phoneController,
                    obscure: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  InputFormCustom(
                    keyboard: TextInputType.text,
                    hintText: 'Dirección',
                    icon: Icon(Icons.home),
                    controller: _addressController,
                    obscure: false,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                ],
              );
            }
            return Column(
              children: <Widget>[
                InputFormCustom(
                  keyboard: TextInputType.text,
                  hintText: 'Nombre completo',
                  icon: Icon(Icons.person),
                  controller: _nameController,
                  obscure: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                InputFormCustom(
                  keyboard: TextInputType.number,
                  hintText: 'Teléfono',
                  icon: Icon(Icons.phone),
                  controller: _phoneController,
                  obscure: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                InputFormCustom(
                  keyboard: TextInputType.text,
                  hintText: 'Correo',
                  icon: Icon(Icons.mail),
                  controller: _mailController,
                  obscure: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
                InputFormCustom(
                  keyboard: TextInputType.number,
                  hintText: 'Código de usuario principal',
                  icon: Icon(Icons.person_add),
                  controller: _codeController,
                  obscure: false,
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            );
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Checkbox(
                    hoverColor: Color(0xffF28740),
                    activeColor: Color(0xffF28740),
                    side: BorderSide(
                        width: 1.5,
                        style: BorderStyle.solid,
                        color: Color(0xffADACBC)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                    checkColor: Colors.white,
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    }),
              ),
              Container(
                  width: _size.width * 0.7,
                  child: RichText(
                      text: TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: 'Acepto las ',
                        style: TextStyle(
                            color: Color(0xff413F60),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => Dialog(
                                    insetPadding:
                                        EdgeInsets.symmetric(horizontal: 25.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0))),
                                    child: Container(
                                      width: _size.width,
                                      height: 550.0,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15.0,
                                                left: 8.0,
                                                right: 8.0,
                                                bottom: 10.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Términos y Condiciones',
                                                  style: TextStyle(
                                                      color: Color(0xff000024),
                                                      fontSize: 22.5,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10.0,
                                                          left: 8.0,
                                                          right: 8.0,
                                                          bottom: 5.0),
                                                  height: 431.0,
                                                  child: ListView(
                                                    padding:
                                                        EdgeInsets.all(0.0),
                                                    children: <Widget>[
                                                      Text(
                                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus varius nibh, sed porta ante pharetra a. Phasellus et ligula dictum, pretium tellus venenatis, feugiat mauris. Nulla tristique varius ligula, a sagittis nunc tristique at. In hac habitasse platea dictumst. Mauris mattis urna vitae enim dapibus, a congue turpis tincidunt. Curabitur eu bibendum augue. Curabitur arcu nisi, luctus id neque ut, pretium egestas augue.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tempus varius nibh, sed porta ante pharetra a. Phasellus et ligula dictum, pretium tellus venenatis, feugiat mauris. Nulla tristique varius ligula, a sagittis nunc tristique at. In hac habitasse platea dictumst. Mauris mattis urna vitae enim dapibus, a congue turpis tincidunt. Curabitur eu bibendum augue. Curabitur arcu nisi, luctus id neque ut, pretium egestas augue.',
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                              width: _size.width,
                                              height: 60.0,
                                              child: Material(
                                                color: Color(0xffF28740),
                                                borderRadius: BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(9.0),
                                                    bottomRight:
                                                        Radius.circular(9.0)),
                                                child: InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Center(
                                                    child: Text(
                                                      'Entendido',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20.0,
                                                          fontFamily:
                                                              'Open Sans',
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                        ],
                                      ),
                                    ),
                                  )),
                        text: 'Condiciones de servicio',
                        style: TextStyle(
                            color: Color(0xffF28740),
                            fontSize: 15.0,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: ' y la ',
                        style: TextStyle(
                            color: Color(0xff413F60),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400)),
                    TextSpan(
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () => showDialog<String>(
                        //       context: context,
                        //       builder: (BuildContext context) => Dialog(
                        //             shape: RoundedRectangleBorder(
                        //                 borderRadius: BorderRadius.all(
                        //                     Radius.circular(10.0))),
                        //             child: Container(
                        //               width: _size.width,
                        //               height: 500.0,
                        //               decoration: BoxDecoration(
                        //                   borderRadius:
                        //                       BorderRadius.circular(10.0)),
                        //             ),
                        //           )),
                        text: 'Política de privacidad',
                        style: TextStyle(
                            color: Color(0xffF28740),
                            fontSize: 15.0,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500)),
                    TextSpan(
                        text: ' de Vuela.',
                        style: TextStyle(
                            color: Color(0xff413F60),
                            fontSize: 15.0,
                            fontWeight: FontWeight.w400)),
                  ]))),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          BtnCustomForm(
              text: 'Solicitar activación',
              color: Color(0xff000024),
              border: Color(0xff000024),
              textColor: Colors.white,
              callback: () => {validate()}),
          SizedBox(
            height: 10.0,
          ),
        ]),
      ),
    );
  }

  Widget requeridDialog(BuildContext context) => CupertinoAlertDialog(
        title: Text('Por favor'),
        content: Text('Ingrese todos los campos solicitados'),
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
