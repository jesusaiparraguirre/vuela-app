import 'package:flutter/material.dart';

class ItemDialogIcon extends StatefulWidget {
  final Widget icon;
  final String name;
  final String description;
  final int position;
  const ItemDialogIcon({
    required this.icon,
    required this.name,
    required this.description,
    required this.position,
  });

  @override
  _ItemDialogIconState createState() => _ItemDialogIconState();
}

class _ItemDialogIconState extends State<ItemDialogIcon> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    final _size = MediaQuery.of(context).size;
    return Container(
      height: 60.0,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xffADACBC), width: 1.0),
          borderRadius: (() {
            if (widget.position == 1) {
              return BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0));
            } else if (widget.position == 3) {
              return BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0));
            }
            return BorderRadius.circular(0.0);
          })()),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 5.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                widget.icon,
                SizedBox(width: 10.0),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        widget.name,
                        style: TextStyle(
                            color: Color(0xff000024),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        widget.description,
                        style: TextStyle(
                            color: Color(0xff707070),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600),
                      ),
                    ]),
              ],
            ),
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
          ],
        ),
      ),
    );
  }
}
