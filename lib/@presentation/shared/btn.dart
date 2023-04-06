import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BtnCustom extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color color;
  final Color colorSvg;
  final Color border;
  final VoidCallback callback;
  final bool icon;
  final bool svg;
  final String urlIcon;

  const BtnCustom({
    required this.text,
    required this.textColor,
    required this.color,
    required this.colorSvg,
    required this.border,
    required this.callback,
    required this.icon,
    required this.svg,
    required this.urlIcon,
  });
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 50.0,
      margin: EdgeInsets.only(right: 9.0),
      decoration: BoxDecoration(
        border: Border.all(color: border, width: 1.0),
        borderRadius: BorderRadius.circular(9.0),
        // color: color,
      ),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
        child: InkWell(
            borderRadius: BorderRadius.circular(8.0),
            child: (() {
              if (icon) {
                return _withoutIcon(context);
              }
              return _withIcon(context);
            })(),
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
              (() {
                if (!svg) {
                  return Image(
                    image: AssetImage(urlIcon),
                    width: 31.0,
                    height: 31.0,
                  );
                }
                return SvgPicture.asset(
                  urlIcon,
                  width: 31.0,
                  height: 31.0,
                  color: colorSvg,
                );
              })(),
            ],
          ),
          Text(
            text,
            style: TextStyle(
                color: textColor,
                fontFamily: 'Open Sans',
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
          Container(
            width: 25.0,
          ),
        ],
      ),
    );
  }

  Widget _withIcon(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Center(
      child: Text(
        text,
        style: TextStyle(
            color: textColor,
            fontFamily: 'Open Sans',
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
