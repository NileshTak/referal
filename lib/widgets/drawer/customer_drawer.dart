import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:referal/screens/home/Home.dart';
import 'package:referal/screens/myreferals/myreferals.dart';
import 'package:referal/screens/notifications/notifications.dart';
import 'package:referal/screens/profile/profile.dart';
import 'package:referal/screens/template/Template.dart';
import 'package:referal/widgets/logo/logo.dart';

class MyWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return new IconButton(
        // Use the MdiIcons class for the IconData
        icon: new Icon(MdiIcons.sword),
        onPressed: () {
          print('Using the sword');
        });
  }
}

class CustomDrawer extends StatelessWidget {
  final Function onHome;

  const CustomDrawer({@required this.onHome});

  ListTile getListTile({String icon, String title, Function() onPress}) {
    return ListTile(
      onTap: onPress,
      contentPadding: EdgeInsets.symmetric(horizontal: 26, vertical: 8),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey.shade600,
          fontWeight: FontWeight.w900,
        ),
      ),
      leading: Image.asset(
        icon,
        width: 25,
        height: 25,
        color: const Color(0xFF000000),
      ),
      trailing: Icon(
        MdiIcons.chevronRight,
        size: 0,
        color: const Color(0xFF86A0C2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        children: [
          const Logo(),
          const Divider(),
          getListTile(
              icon: 'assets/Home.png',
              title: 'Home',
              onPress: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }),
          getListTile(
              icon: 'assets/ME.png',
              title: 'My Earnings',
              onPress: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Template()));
              }),
          getListTile(
              icon: 'assets/RE.png',
              title: 'Refer & Earn',
              onPress: () {
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ViewWebview(
                //       url: 'https://truckbazi.com/home/_gallery',
                //       title: getTranslated(context, 'Gallery'),
                //     ),
                //   ),
                // );
              }),
          getListTile(
              icon: 'assets/MR.png',
              title: 'My Referals',
              onPress: () {
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyReferal()));
              }),
          getListTile(
              icon: 'assets/temp.png',
              title: 'Template',
              onPress: () {
                // Navigator.pop(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => ViewWebview(
                //       url: 'https://truckbazi.com/home/_faq',
                //       title: getTranslated(context, 'FAQ'),
                //     ),
                //   ),
                // );
                Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Template()));
              }),
          getListTile(
              icon: 'assets/Nti.png',
              title: 'Notification',
              onPress: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notifications(),
                  ),
                );
              }),
          getListTile(
              icon: 'assets/pro.png',
              title: 'Profile',
              onPress: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(),
                  ),
                );
              }),
          getListTile(
              icon: 'assets/clo.png', title: 'Rate our app', onPress: () {}),
          getListTile(
            icon: 'assets/LO.png',
            title: 'LogOut',
          )
        ],
      ),
    );
  }
}
