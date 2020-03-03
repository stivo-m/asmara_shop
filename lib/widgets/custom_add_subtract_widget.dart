import 'package:asmara_shop/consts/text_styles.dart';
import 'package:flutter/material.dart';

class AddSubtractWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const double boxSize = 30;
    return Container(
      width: 90,
      height: 30,
      child: Column(
        children: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              child: Icon(
                Icons.add,
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(height: 3),
          Text(
            "2",
            style: boldNormalText,
          ),
          SizedBox(height: 3),
          IconButton(
            icon: Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              child: Icon(
                Icons.remove,
                color: Colors.white,
              ),
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
