import 'package:flutter/material.dart';
import 'package:referal/common_utils.dart';
import 'package:referal/injection.dart';
import 'package:referal/screens/home/widget/settings_toggle_button_layout.dart';
import 'package:referal/screens/notifications/notifications.dart';
import 'package:referal/screens/profile/profile.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  SharedPreferences prefs;
  var vibrate = false;
  var beep = false;
  var saveHistory = true;
  var defaultScanScreen = true;

  @override
  void initState() {
    loadSharedPreferences();
    super.initState();
  }

  void loadSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      if (prefs.containsKey(injection.get<CommonUtils>().beep)) {
        beep = prefs.getBool(injection.get<CommonUtils>().beep);
      }
      if (prefs.containsKey(injection.get<CommonUtils>().vibrate)) {
        vibrate = prefs.getBool(injection.get<CommonUtils>().vibrate);
      }
      if (prefs.containsKey(injection.get<CommonUtils>().saveHistory)) {
        saveHistory = prefs.getBool(injection.get<CommonUtils>().saveHistory);
      }
      if (prefs.containsKey(injection.get<CommonUtils>().defaultScanScreen)) {
        defaultScanScreen =
            prefs.getBool(injection.get<CommonUtils>().defaultScanScreen);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _getAppBar() {
      return CustomAppBar(
        title: 'Template',
        isleading: true,
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Notifications(),
                    ),
                  );
                },
                child:
                    Image.asset('assets/bell.png', width: 25.0, height: 25.0),
              )),
          Padding(
              padding: EdgeInsets.only(right: 25.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                },
                child: Image.asset('assets/m-user-profile1.png',
                    width: 28.0, height: 28.0),
              )),
        ],
        onPress: () {
          Navigator.pop(context);
        },
      );
    }

    return Scaffold(
      appBar: _getAppBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Notification Configuration',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                      color: primaryColor),
                ),
              ),
              SettingsToggleButtonLayout(
                  '5 min',
                  'Received alert before 5 min of session.',
                  vibrate,
                  injection.get<CommonUtils>().vibrate, (value) {
                setState(() {
                  vibrate = value;
                });
              }),
              SettingsToggleButtonLayout(
                  '2 hours',
                  'Received alert before 2 hours of session.',
                  beep,
                  injection.get<CommonUtils>().beep, (value) {
                setState(() {
                  beep = value;
                });
              }),
              SettingsToggleButtonLayout(
                  'After session',
                  'Received alert after the session.',
                  saveHistory,
                  injection.get<CommonUtils>().saveHistory, (value) {
                setState(() {
                  saveHistory = value;
                });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
