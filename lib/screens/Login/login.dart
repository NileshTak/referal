import 'dart:convert';
import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:flutter/material.dart';
import 'package:http/io_client.dart';
import 'package:referal/screens/Login/forgot_pass.dart';
import 'package:referal/screens/Login/register.dart';
import 'package:referal/screens/home/Home.dart';
import 'package:referal/screens/home/widget/incorrectAlertDialog.dart';
import 'package:referal/style/colors.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:referal/widgets/common/buttons/button.dart';
import 'package:referal/widgets/common/buttons/rounded_button.dart';
import 'package:referal/widgets/common/custom_app_bar.dart';
import 'package:referal/widgets/common/default_text_field.dart';
import 'package:referal/widgets/drawer/customer_drawer.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _TemplateState();
}

class _TemplateState extends State<Login> {
  var emailController = new TextEditingController();
  var passController = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  bool isLoading = false;

  Future<void> getData() async {
    print('aaaaaaaa    enter');

    if (emailController.text.isEmpty && passController.text.isEmpty) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              incorrectAlertDialog('Error', 'Please fill the information'));
    } else if (emailController.text.isEmpty) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (context) =>
              incorrectAlertDialog('Error', 'Please enter your email'));
    } else {
      setState(() {
        isLoading = true;
      });

      Dio dio = new Dio();
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (HttpClient client) {
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      };
      var response = await dio.post(
          'https://test.dashboard.moonshotjr.com/LMSServices/api/Account/getUserToken',
          data: {
            "userName": emailController.text,
            "password": passController.text,
            "ipAddress": "192.168.1.12",
            "rememberMe": true
          });
      print('aaaaaaaaaaaa' + response.data.toString());

      try {
        if (response.statusCode == 200) {
          print('aaaaaaaa    200');
          setState(() {
            isLoading = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        } else {
          setState(() {
            isLoading = false;
          });
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) => incorrectAlertDialog(
                  'Error', 'Incorrect Username or Password !!'));
          return null;
        }
      } catch (e) {
        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) =>
                incorrectAlertDialog('Error', 'Something Went Wrong !!'));

        setState(() {
          isLoading = false;
        });
        return null;
      }
    }
  }

  /// To Save token in Local
  ///
  // void saveToken(String value) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString("token", value);
  // }

  // Future<String> getToken() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   var token = prefs.getString("token") ?? "";

  //   // key name must be same

  //   return token;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
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
                          child: Text('LOGIN',
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
                                    controller: emailController,
                                    validator: (val) {},
                                    hintText: 'Email'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: DefaultTextField(
                                    borderColor: white,
                                    controller: passController,
                                    validator: (val) {
                                      // if (val.length != 4) {
                                      //   return 'Please enter Valid Password';
                                      // } else if (int.parse(val) < 1980 ||
                                      //     int.parse(val) > DateTime.now().year) {
                                      //   return "Please enter Valid Password";
                                      // } else {
                                      //   return null;
                                      // }
                                    },
                                    type: TextInputType.visiblePassword,
                                    hintText: 'Password'),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(16, 10, 16, 16),
                          height: 80,
                          child: Button(
                            color: white,
                            textColors: primaryColor,
                            title: 'Login',
                            onPressed: () {
                              getData();
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
                                      builder: (context) => ForgotPass(),
                                    ),
                                  );
                                },
                                child: Text('Forgot Password',
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
        ),
        isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(),
      ],
    ));
  }
}
