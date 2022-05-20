import 'package:flutter/material.dart';

import '../../../style/colors.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;

  const RoundedButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 140,
          height: 50,
          margin: EdgeInsets.only(
            top: 40,
          ),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(40))),
          child: Text(
            text,
            style: TextStyle(
                color: white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
