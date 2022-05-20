import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:referal/screens/notifications/notifications.dart';
import 'package:referal/screens/profile/profile.dart';
import 'package:referal/style/colors.dart';

class CustomAppBar extends PreferredSize {
  final String title;
  final double height;
  final List<Widget> actions;
  final bool centerTitle;
  final PreferredSizeWidget bottom;
  final double elevation;
  final bool isleading;
  final Function onPress;
  const CustomAppBar(
      {this.onPress,
      this.isleading = false,
      this.elevation,
      this.bottom,
      this.centerTitle = true,
      this.height = kToolbarHeight,
      @required this.title,
      this.actions});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: elevation,
      backgroundColor: white,
      leading: isleading
          ? title == 'Home'
              ? IconButton(
                  icon:
                      Image.asset('assets/menu.png', width: 25.0, height: 25.0),
                  onPressed: onPress)
              : IconButton(
                  icon: Image.asset('assets/back1.png',
                      width: 25.0, height: 25.0),
                  onPressed: onPress)
          : IconButton(
              icon: Image.asset('assets/back1.png', width: 25.0, height: 25.0),
              onPressed: onPress),
      centerTitle: centerTitle,
      title: FittedBox(
        fit: BoxFit.fitWidth,
        child: Image.asset('assets/logo1.png', width: 106, height: 46),

        // Text(
        //   title,
        //   style: TextStyle(
        //       fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: .8),
        // ),
      ),
      actions: actions,
      bottom: bottom,
    );
  }
}
