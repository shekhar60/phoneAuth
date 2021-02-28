import 'package:flutter/material.dart';

class BTNWay extends StatelessWidget {
  final Function onTap;
  final String label;
  final IconData iconData;

  const BTNWay({Key key, this.onTap, this.label, this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Color(0xff8f93ea),
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Icon(iconData, color: Colors.white, size: 18),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 200,
                  child: Text(
                    label,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
