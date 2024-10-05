import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_project_client/serverpod_project_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'classes/cbr.dart';
import 'constant/colors.dart';
import 'pages/login.dart';

var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  int? userid = (await SharedPreferences.getInstance()).getInt('user_id');
  runApp(MyApp(userid));
}

class MyApp extends StatelessWidget {
  final int? userid;
  const MyApp(this.userid, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Halo Mods',
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(
          splashColor: Colors.red,
        ),
        tooltipTheme: const TooltipThemeData(
          height: 0,
          textStyle: TextStyle(color: white, fontSize: 10),
          decoration: BoxDecoration(
            color: transparent,
          ),
        ),
        iconTheme: const IconThemeData(
          color: primary,
        ),
        primaryColor: primary,
        colorScheme: const ColorScheme.dark(
          primary: primary,
          secondary: orange,
          error: errorColor,
        ),
        scaffoldBackgroundColor: black,
        inputDecorationTheme: InputDecorationTheme(
          errorBorder: border(errorColor),
          focusedBorder: border(primary),
          enabledBorder: border(Colors.white),
          disabledBorder: border(black),
          focusedErrorBorder: border(errorColor),
        ),
      ),
      home: const Login(),
    );
  }
}

InputBorder border(Color color) => OutlineInputBorder(
      borderRadius: CBR.all(10).v,
      borderSide: BorderSide(
        color: color,
        width: 1,
      ),
    );
