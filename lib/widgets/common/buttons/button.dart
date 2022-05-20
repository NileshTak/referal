import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:referal/style/colors.dart';

class Button extends StatelessWidget {
  final Function() onPressed;
  final String title;
  final Color color;
  final Color textColors;
  final double radius;
  final double textsize;
  final IconData icon;
  final bool isMargin;
  final double padding;
  final bool outline;
  final bool swipeColor;
  const Button(
      {this.onPressed,
      @required this.title,
      this.outline = false,
      this.swipeColor = false,
      this.isMargin = false,
      this.radius = 10,
      this.textsize = 16,
      this.padding = 20,
      this.icon,
      this.textColors = white,
      this.color = darkPrimaryColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: MaterialButton(
        onPressed: onPressed,
        disabledColor: Colors.grey,
        elevation: 0,
        padding: EdgeInsets.all(10),
        height: 54,
        color: !outline && !swipeColor ? color : white,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: outline || swipeColor ? color : white),
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Icon(
                  MdiIcons.download,
                  color: outline || swipeColor ? color : white,
                ),
              ),
            Text(
              title,
              style: TextStyle(
                  color: outline || swipeColor ? color : textColors,
                  fontSize: textsize,
                  fontWeight: FontWeight.w700,
                  letterSpacing: .4),
            ),
          ],
        ),
      ),
    );
  }
}
