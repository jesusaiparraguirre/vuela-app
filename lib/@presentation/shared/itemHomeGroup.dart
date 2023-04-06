import 'package:flutter/material.dart';

class ItemHomeGroup extends StatelessWidget {
  final Widget icon;
  final String title;
  final String number;
  final VoidCallback callback;
  const ItemHomeGroup({
    required this.icon,
    required this.title,
    required this.number,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    return Container(
        width: _size.width,
        height: 60.0,
        decoration: BoxDecoration(
            border: Border.all(color: Color(0xffF28740), width: 0.9),
            borderRadius: BorderRadius.circular(8.0)),
        child: Material(
          color: Color(0xffF5F6F8),
          borderRadius: BorderRadius.circular(7.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: [
                    Container(
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                            color: Color(0xffF28740),
                            border: Border.all(
                                color: Color(0xffF28740), width: 1.0),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0),
                            )),
                        child: icon),
                    SizedBox(
                      width: 8.0,
                    ),
                    SizedBox(
                      width: _size.width - 160.0,
                      child: Text(
                        title,
                        maxLines: 2,
                        style: TextStyle(
                            color: Color(0xff000024),
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700),
                      ),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.videocam, color: Color(0xffF28740)),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text(
                      number,
                      style: TextStyle(
                          color: Color(0xff000024),
                          fontSize: 19.0,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 8.0,
                    )
                  ],
                )
              ],
            ),
            onTap: callback,
          ),
        ));
  }
}
