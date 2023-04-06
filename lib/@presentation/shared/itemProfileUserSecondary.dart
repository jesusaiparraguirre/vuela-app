import 'package:flutter/material.dart';

class ItemProfileUserSecondary extends StatelessWidget {
  final Widget icon;
  final String title;
  final String name;
  final String id;
  final double top;
  final double bottom;
  final double left;
  final double right;
  final double bright;
  final double bleft;
  final double tleft;
  final double tright;
  final bool border;
  final VoidCallback callback;

  const ItemProfileUserSecondary(
      {required this.icon,
      required this.title,
      required this.name,
      required this.id,
      required this.callback,
      required this.top,
      required this.bottom,
      required this.left,
      required this.right,
      required this.bright,
      required this.bleft,
      required this.tleft,
      required this.tright,
      required this.border});
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 95.0,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(
              color: Color(0xff000024),
              width: bottom,
            ),
            top: BorderSide(
              color: Color(0xff000024),
              width: top,
            ),
            left: BorderSide(color: Color(0xff000024), width: left),
            right: BorderSide(color: Color(0xff000024), width: right)),
        borderRadius: (() {
          if (!border) {
            return BorderRadius.only(
                bottomLeft: Radius.circular(bleft),
                bottomRight: Radius.circular(bright),
                topLeft: Radius.circular(tleft),
                topRight: Radius.circular(tright));
          }
        })(),
      ),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(bleft),
            bottomRight: Radius.circular(bright),
            topLeft: Radius.circular(tleft),
            topRight: Radius.circular(tright)),
        child: InkWell(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(bleft),
              bottomRight: Radius.circular(bright),
              topLeft: Radius.circular(tleft),
              topRight: Radius.circular(tright)),
          child: Padding(
            padding: EdgeInsets.only(right: 10.0, left: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    icon,
                    SizedBox(width: 10.0),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            title,
                            style: TextStyle(
                                color: Color(0xff000024),
                                fontFamily: 'Open Sans',
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(name,
                              style: TextStyle(
                                  color: Color(0xff707070),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Open Sans')),
                          Text(
                            id,
                            style: TextStyle(
                                color: Color(0xff707070),
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Open Sans'),
                          )
                        ])
                  ],
                ),
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Color(0xff707070),
                      )
                    ])
              ],
            ),
          ),
          onTap: callback,
        ),
      ),
    );
  }
}
