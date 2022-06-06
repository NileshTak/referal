import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referal/controller/button_click.dart';
import 'package:referal/screens/home/widget/social_media_icons.dart';
import 'package:referal/screens/notifications/notifications.dart';
import 'package:referal/screens/profile/edit_profile.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/buttons/button.dart';
import 'package:referal/widgets/common/buttons/rounded_button.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';
import 'package:referal/widgets/drawer/customer_drawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

/// The hove page which hosts the calendar
class Profile extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  const Profile({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Profile> {
  int _currentIndex = 0;

  Future<bool> onWillPop() async {
    // if (_currentIndex == 0) {
    //   return showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return AlertDialogBox(
    //         title: 'Confirm Exit',
    //         subtitle: 'Are you sure you want to exit?',
    //         onPress: () {
    //           SystemNavigator.pop();
    //         },
    //       );
    //     },
    //   );
    // } else {
    //   setState(() {
    //     _currentIndex = 0;
    //   });
    //   return false;
    // }
  }

  _getAppBar() {
    return CustomAppBar(
      title: 'Profile',
      isleading: false,
      onPress: () {
        Navigator.pop(context);
      },
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Notifications(),
                  ),
                );
              },
              child: Image.asset('assets/bell.png', width: 25.0, height: 25.0),
            )),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _getAppBar(),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.fromLTRB(10, 14, 10, 10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              elevation: 5,
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(4),
                      child: Image.asset(
                        'assets/m-user-profile1.png',
                        width: 100,
                        height: 100,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(4),
                      child: Text('Nilesh Tak',
                          style: TextStyle(
                              color: primaryColor,
                              fontSize: 20,
                              fontWeight: FontWeight.w800)),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(10),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              color: Colors.white,
              elevation: 5,
              child: Container(
                margin: EdgeInsets.fromLTRB(12, 10, 10, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(14),
                      child: Stack(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name',
                                  style: TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                child: Text('Nilesh Tak',
                                    style: TextStyle(
                                        color: primaryColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w800)),
                              ),
                            ],
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditProfile(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/edit1.png',
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 18, 14, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                            child: Text('Nilesh.t@moonpreneur.com',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 18, 14, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Date of Birth',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                            child: Text('13-Aug-1997',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 18, 14, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Password',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                            child: Text('***********',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 18, 14, 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Location',
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                            child: Text('New Delhi, India',
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
