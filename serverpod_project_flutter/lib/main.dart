import "package:flutter/material.dart";
import "package:serverpod_flutter/serverpod_flutter.dart";
import "package:serverpod_project_client/serverpod_project_client.dart";
import "package:serverpod_project_flutter/classes/cbr.dart";
import "package:serverpod_project_flutter/constant/colors.dart";
import "package:serverpod_project_flutter/pages/login.dart";
import "package:shared_preferences/shared_preferences.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userid = (await SharedPreferences.getInstance()).getInt("user_id");
  runApp(MyApp(userid));
}

var client = Client("http://$localhost:8080/")
  ..connectivityMonitor = FlutterConnectivityMonitor();

InputBorder border(Color color) => OutlineInputBorder(
      borderRadius: CBR.all(10).v,
      borderSide: BorderSide(
        color: color,
      ),
    );

class MyApp extends StatelessWidget {
  const MyApp(this.userid, {super.key});
  final int? userid;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Halo Mods",
      theme: ThemeData(
        buttonTheme: const ButtonThemeData(
          splashColor: Colors.red,
        ),
        tooltipTheme: const TooltipThemeData(
          constraints: BoxConstraints(),
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
