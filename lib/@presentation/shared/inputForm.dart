import 'package:flutter/material.dart';

class InputFormCustom extends StatefulWidget {
  Widget icon;
  String hintText;
  TextEditingController controller;
  bool obscure;
  TextInputType keyboard;
  InputFormCustom(
      {required this.icon,
      required this.hintText,
      required this.controller,
      required this.obscure,
      required this.keyboard});

  @override
  _InputFormCustomState createState() => _InputFormCustomState();
}

class _InputFormCustomState extends State<InputFormCustom> {
  bool focus = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Focus(
        onFocusChange: (e) {
          setState(() {
            focus = e;
          });
        },
        child: TextField(
          keyboardType: widget.keyboard,
          controller: widget.controller,
          obscureText: widget.obscure,
          decoration: InputDecoration(
            hintText: widget.hintText,
            fillColor: Colors.white,
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Color(0xffF28740), width: 2.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(color: Color(0xffC2C1C7), width: 1.5),
              // borderSide: BorderSide(color: Color(0xffF28740), width: 1.0),
            ),
            prefixIcon: Container(
              margin: EdgeInsets.only(right: 15.0),
              width: 60.0,
              height: 61.0,
              child: ClipRRect(
                child: Container(
                  child: widget.icon,
                  decoration: BoxDecoration(
                    border: Border(
                      right: BorderSide(
                          width: 1.5,
                          color: (() {
                            if (focus) {
                              return Color(0xffF28740);
                            }
                            return Color(0xffC2C1C7);
                          })()),
                      // Color(0xffC2C1C7)),
                    ),
                  ),
                ),
              ),
            ),
            labelStyle: TextStyle(
                fontFamily: 'Roboto', fontSize: 15, color: Colors.black),
            alignLabelWithHint: true,
          ),
        ),
      ),
    );
  }
}
