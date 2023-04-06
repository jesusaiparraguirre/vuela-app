import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnCustomProfile extends StatelessWidget {
  final Text text;
  final Color color;
  final Color border;
  final Color textColor;
  final VoidCallback callback;

  const BtnCustomProfile({
    required this.text,
    required this.color,
    required this.border,
    required this.textColor,
    required this.callback,
  });
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 55.0,
      decoration: BoxDecoration(
        border: Border.all(color: border, width: 2.0),
        borderRadius: BorderRadius.circular(10.0),
        // color: color,
      ),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            child: _withoutIcon(context),
            onTap: callback),
      ),
    );
  }

  Widget _withoutIcon(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
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
          text,
          Container(
            width: 25.0,
          ),
        ],
      ),
    );
  }

  Widget _withIcon(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Center(child: text);
  }
}
