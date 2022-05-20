import 'package:flutter/material.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/buttons/button.dart';
import 'package:referal/widgets/common/buttons/rounded_button.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';
import 'package:referal/widgets/common/default_text_field.dart';
import 'package:referal/widgets/drawer/customer_drawer.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key key}) : super(key: key);

  @override
  State<EditProfile> createState() => _TemplateState();
}

class _TemplateState extends State<EditProfile> {
  _getAppBar() {
    return CustomAppBar(
      title: 'Edit Profile',
      isleading: true,
      onPress: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _getAppBar(),
        body: Container(
          color: const Color(0xFFf3f3f2),
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
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
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.all(14),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Name',
                                      style: TextStyle(
                                          color: Colors.grey.shade600,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500)),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                                    child: DefaultTextField(
                                        validator: (val) {
                                          if (val.length != 4) {
                                            return 'Please enter Valid Year';
                                          } else if (int.parse(val) < 1980 ||
                                              int.parse(val) >
                                                  DateTime.now().year) {
                                            return "Please enter Valid year";
                                          } else {
                                            return null;
                                          }
                                        },
                                        type: TextInputType.phone,
                                        hintText: 'Nilesh Tak'),
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
                                    child: DefaultTextField(
                                        validator: (val) {
                                          if (val.length != 4) {
                                            return 'Please enter Valid Year';
                                          } else if (int.parse(val) < 1980 ||
                                              int.parse(val) >
                                                  DateTime.now().year) {
                                            return "Please enter Valid year";
                                          } else {
                                            return null;
                                          }
                                        },
                                        type: TextInputType.phone,
                                        hintText: 'Nilesh.t@moonpreneur.com'),
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
                                    child: DefaultTextField(
                                        validator: (val) {
                                          if (val.length != 4) {
                                            return 'Please enter Valid Year';
                                          } else if (int.parse(val) < 1980 ||
                                              int.parse(val) >
                                                  DateTime.now().year) {
                                            return "Please enter Valid year";
                                          } else {
                                            return null;
                                          }
                                        },
                                        type: TextInputType.phone,
                                        hintText: '13-Aug-1997'),
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
                                    child: DefaultTextField(
                                        validator: (val) {
                                          if (val.length != 4) {
                                            return 'Please enter Valid Year';
                                          } else if (int.parse(val) < 1980 ||
                                              int.parse(val) >
                                                  DateTime.now().year) {
                                            return "Please enter Valid year";
                                          } else {
                                            return null;
                                          }
                                        },
                                        type: TextInputType.phone,
                                        hintText: '**********'),
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
                                    child: DefaultTextField(
                                        validator: (val) {
                                          if (val.length != 4) {
                                            return 'Please enter Valid Year';
                                          } else if (int.parse(val) < 1980 ||
                                              int.parse(val) >
                                                  DateTime.now().year) {
                                            return "Please enter Valid year";
                                          } else {
                                            return null;
                                          }
                                        },
                                        type: TextInputType.phone,
                                        hintText: 'New Delhi, India'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(16),
                              height: 80,
                              width: 160,
                              child: Button(
                                title: 'Update',
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
