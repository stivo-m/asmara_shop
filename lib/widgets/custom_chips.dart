import 'package:asmara_shop/consts/text_styles.dart';
import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String categoryName;
  final String categoryImage;
  final int index;

  const CustomChip({
    Key key,
    this.categoryName,
    this.categoryImage,
    this.index,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Chip(
        clipBehavior: Clip.hardEdge,
        backgroundColor: index == 0 ? Colors.blue : Colors.grey[300],
        padding: EdgeInsets.all(9),
        avatar: Image.asset(
          categoryImage,
          fit: BoxFit.contain,
        ),
        label: Text(
          categoryName,
          style: normalText.copyWith(
            color: index == 0 ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
