import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:referal/controller/button_click.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';
import 'package:referal/widgets/drawer/customer_drawer.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
    if (_currentIndex == 0) {
      return CustomAppBar(
        title: 'Home',
      );
    } else if (_currentIndex == 1) {
      return CustomAppBar(
        title: 'Chat',
      );
    } else if (_currentIndex == 3) {
      return CustomAppBar(
        title: 'MyAdv',
      );
    } else if (_currentIndex == 4) {
      return CustomAppBar(
        title: 'MyProfile',
      );
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        drawer: CustomDrawer(
          onHome: () {
            Navigator.pop(context);
            setState(() {
              _currentIndex = 0;
            });
          },
        ),
        appBar: _getAppBar(),
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              child: Icon(Icons.ac_unit_outlined),
              onPressed: () {
                Provider.of<ButtonClick>(context, listen: false).increment();
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.ac_unit_rounded),
              onPressed: () {
                Provider.of<ButtonClick>(context, listen: false).decrement();
              },
            ),
          ],
        ),
        body: Consumer<ButtonClick>(
          builder: (context, value, child) => Center(
            child: Text(value.number.toString()),
          ),
        ),
      ),
    );
  }
}
