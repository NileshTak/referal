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

class ForgotPass extends StatefulWidget {
  ForgotPass({Key key}) : super(key: key);

  @override
  State<ForgotPass> createState() => _TemplateState();
}

class _TemplateState extends State<ForgotPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: primaryColor,
      padding: EdgeInsets.all(10),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 120, bottom: 80),
              width: 200,
              child: Image.asset(
                'assets/mm.png',
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(4),
                      child: Text('FORGOT PASSWORD',
                          style: TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800)),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(14, 20, 14, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 6, 0, 0),
                            child: DefaultTextField(
                                borderColor: white,
                                validator: (val) {
                                  // if (val.length != 4) {
                                  //   return 'Please enter Valid Year';
                                  // } else if (int.parse(val) < 1980 ||
                                  //     int.parse(val) > DateTime.now().year) {
                                  //   return "Please enter Valid year";
                                  // } else {
                                  //   return null;
                                  // }
                                },
                                hintText: 'Email'),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                      height: 80,
                      child: Button(
                        color: white,
                        textColors: primaryColor,
                        title: 'Reset Password',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyHomePage(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 10, 16, 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ),
                              );
                            },
                            child: Text('Login',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ),
                          Text('  |  ',
                              style: TextStyle(
                                  color: white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w800)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Register(),
                                ),
                              );
                            },
                            child: Text('Register',
                                style: TextStyle(
                                    color: white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
