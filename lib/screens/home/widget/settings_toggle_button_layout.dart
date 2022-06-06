import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:referal/style/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsToggleButtonLayout extends StatelessWidget {
  final String title;
  final desc;
  final ValueChanged onChanged;
  final bool status;
  final String sharedPrefValue;

  SettingsToggleButtonLayout(
      this.title, this.desc, this.status, this.sharedPrefValue, this.onChanged);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 16.0, color: Colors.grey.shade900),
                ),
                CupertinoSwitch(
                  activeColor: primaryColor,
                  value: status,
                  onChanged: (value) async {
                    onChanged(value);
                    var prefs = await SharedPreferences.getInstance();
                    prefs.setBool(sharedPrefValue, value);
                  },
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              desc,
              style: TextStyle(fontSize: 13.0, color: Colors.grey.shade600),
            ),
          )
        ]));
  }
}
