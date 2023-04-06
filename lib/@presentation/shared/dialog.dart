import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DialogCustom extends StatelessWidget {
  final String title;
  final String message;
  final String urlIcon;
  final Color colorIcon;
  final String btnText;
  final bool svg;
  final bool btnSecond;
  final String btnSecondText;
  final int messageLines;
  final VoidCallback callback;

  const DialogCustom({
    required this.title,
    required this.message,
    required this.urlIcon,
    required this.colorIcon,
    required this.btnText,
    required this.svg,
    required this.btnSecond,
    required this.btnSecondText,
    required this.messageLines,
    required this.callback,
  });
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
        width: _size.width * 0.8,
        height: (() {
          if (messageLines == 3 && !btnSecond) {
            return 295.0;
          } else if (messageLines == 3 && btnSecond) {
            return 355.0;
          }
          return 292.0;
        })(),
        padding: EdgeInsets.only(top: 25.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.white,
        ),
        child: Column(children: <Widget>[
          Text(
            title,
            style: TextStyle(
                color: Color(0xff000024),
                fontSize: 26.0,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 25.0,
          ),
          (() {
            if (svg == true) {
              return SvgPicture.asset(
                urlIcon,
                height: 55.0,
                width: 55.0,
                color: colorIcon,
              );
            }
            return Image(
              image: AssetImage(urlIcon),
              height: 74.0,
              width: 74.0,
            );
          })(),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff413F60),
                  fontSize: 14.0,
                  fontFamily: 'Open Sans',
                  fontWeight: FontWeight.w600),
            ),
          ),
          (() {
            if (btnSecond) {
              return Container(
                width: _size.width,
                margin: EdgeInsets.only(top: 14.0),
                height: 60.0,
                child: Material(
                  color: Color(0xffF5F6F8),
                  child: InkWell(
                    child: Container(
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
                          Text(
                            btnSecondText,
                            style: TextStyle(
                                color: Color(0xff000024),
                                fontFamily: 'Open Sans',
                                fontSize: 18,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            width: 25.0,
                          ),
                        ],
                      ),
                    ),
                    onTap: callback,
                    // onTap: callback),
                  ),
                ),
              );
            }
            return Container();
          })(),
          Container(
            width: _size.width,
            margin: (() {
              if (messageLines == 3 && !btnSecond) {
                return EdgeInsets.only(top: 14.0);
              } else if (messageLines == 2 && !btnSecond) {
                return EdgeInsets.only(top: 30.0);
              }
            })(),
            height: 60.0,
            child: Material(
              color: Color(0xffF28740),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(9),
                  bottomLeft: Radius.circular(9)),
              child: InkWell(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(9),
                    bottomLeft: Radius.circular(9)),
                child: Container(
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
                      Text(
                        btnText,
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Open Sans',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Container(
                        width: 25.0,
                      ),
                    ],
                  ),
                ),
                onTap: callback,
                // onTap: callback),
              ),
            ),
          )
        ]));
  }
}
