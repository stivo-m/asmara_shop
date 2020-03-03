import 'package:asmara_shop/consts/text_styles.dart';
import 'package:flutter/material.dart';

class SplashButton extends StatelessWidget {
  final String label;
  final bool elevated;
  final Function onPressed;

  const SplashButton({
    Key key,
    this.label,
    this.elevated,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: MediaQuery.of(context).size.width * 0.95,
      elevation: elevated ? 8 : 0,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      color: Colors.blue,
      child: Text(
        label.toUpperCase(),
        style: headingsBold.copyWith(color: Colors.white),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
