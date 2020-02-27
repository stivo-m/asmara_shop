import 'package:flutter/material.dart';

class AddSubtractWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 50,
      child: Row(
        children: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Container(
              width: 50,
              height: 50,
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
          SizedBox(width: 5),
          Text(
            "2",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(width: 5),
          IconButton(
            icon: Container(
              width: 50,
              height: 50,
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
