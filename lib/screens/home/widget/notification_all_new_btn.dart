import 'package:flutter/material.dart';
import 'package:referal/style/colors.dart';

class NotificationAllNewButton extends StatelessWidget {
  final Function onPress;
  final String adType;
  final String type;
  final String icon;
  final double fontSize;
  final double iconSize;
  final String text;
  final Color textColor;
  final int padding;
  const NotificationAllNewButton(
      {@required this.onPress,
      @required this.adType,
      @required this.type,
      this.icon,
      this.textColor,
      this.padding = 14,
      this.fontSize = 15,
      this.iconSize = 14,
      this.text});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null)
              Padding(
                  padding: EdgeInsets.only(right: 0.0),
                  child: Image.asset(
                    icon,
                    width: iconSize,
                    height: iconSize,
                  )),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(text,
                  style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: FontWeight.w800)),
            ),
          ],
        ),
      ),
    );
  }
}
