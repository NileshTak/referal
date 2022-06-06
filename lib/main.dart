import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:referal/controller/button_click.dart';
import 'package:referal/controller/calendar_view_changer.dart';
import 'package:referal/injection.dart';
import 'package:referal/screens/Login/login.dart';
import 'package:referal/screens/Login/loginreg.dart';
import 'package:referal/screens/home/Home.dart';
import 'package:referal/screens/firstscreen.dart';
import 'package:referal/style/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ButtonClick()),
        ChangeNotifierProvider(create: (_) => MessageData()),
      ],
      child: MaterialApp(
        home: LoginReg(),
        theme: ThemeData(
          fontFamily: 'Rubik',
        ),
      ),
    );
  }
}
