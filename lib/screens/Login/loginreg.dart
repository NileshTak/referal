import 'package:flutter/material.dart';
import 'package:referal/screens/Login/login.dart';
import 'package:referal/screens/Login/register.dart';
import 'package:referal/screens/home/Home.dart';
import 'package:referal/style/colors.dart';
import 'package:referal/widgets/common/buttons/button.dart';
import 'package:referal/widgets/common/buttons/rounded_button.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';
import 'package:referal/widgets/common/default_text_field.dart';
import 'package:referal/widgets/drawer/customer_drawer.dart';

class LoginReg extends StatefulWidget {
  LoginReg({Key key}) : super(key: key);

  @override
  State<LoginReg> createState() => _TemplateState();
}

class _TemplateState extends State<LoginReg> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: primaryColor,
      padding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 120, bottom: 80),
                width: 200,
                child: Image.asset(
                  'assets/mm.png',
                ),
              ),
              Container(
                margin: EdgeInsets.all(4),
                child: Text('REFER YOUR FRIENDS, EARN CASHBACK',
                    style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800)),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                child: Text(
                    'Invite your friends to join crediplus and get Rs.50 cashback for each friend that joins using your referal code.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16.0, color: white)),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.all(4),
                child: Text('REGISTER WITH',
                    style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontWeight: FontWeight.w800)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset('assets/fb.png', width: 42, height: 42),
                    margin: EdgeInsets.all(14),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Image.asset('assets/t.png', width: 54, height: 54),
                    margin: EdgeInsets.all(12),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Image.asset('assets/g.png', width: 42, height: 42),
                    margin: EdgeInsets.all(14),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.all(4),
                child: Text('OR',
                    style: TextStyle(
                        color: white,
                        fontSize: 18,
                        fontWeight: FontWeight.w800)),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 140,
                      margin: EdgeInsets.all(10),
                      child: Button(
                        color: white,
                        textColors: primaryColor,
                        title: 'Login',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 140,
                      margin: EdgeInsets.all(10),
                      child: Button(
                        color: white,
                        textColors: primaryColor,
                        title: 'Register',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Register(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Text('© 2022 Copyright, Moonpreneur Inc.',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 14.0, color: Colors.grey.shade200)),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
