import 'package:flutter/material.dart';

import '/../../utils/Constants.dart';

class RoundedButton extends StatelessWidget {
  final Widget? title;
  final Function()? onPressed;

  RoundedButton(this.title, {this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: title,
      style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2.0, color: MAIN_COLOR),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          minimumSize: Size(80, 50),
          onPrimary: MAIN_COLOR,
          primary: Colors.white,
          textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      onPressed: onPressed,
    );
  }
}
