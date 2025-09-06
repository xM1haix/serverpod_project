import "dart:async";
import "dart:convert";
import "dart:developer";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;
import "package:serverpod_project_flutter/classes/wrap_helper.dart";
import "package:serverpod_project_flutter/constant/colors.dart";
import "package:serverpod_project_flutter/customs/wrap.dart";
import "package:serverpod_project_flutter/pages/login.dart";

Future customAjax({Map<String, dynamic>? object}) async {
  final x = await http.post(
    Uri.parse("http://95.216.2.106:4444/"),
  );
  if (x.statusCode != 200) {
    throw Exception("Connection error!");
  }
  final Map r = jsonDecode(x.body) as Map<String, dynamic>;
  log({"url": "url", "object": object, "result": r}.toString());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Hi @User#1234"),
        actions: [
          IconButton(
            tooltip: "Change Log",
            onPressed: () {
              //show pop-up
            },
            icon: const Icon(
              Icons.published_with_changes_outlined,
              color: white,
            ),
          ),
          IconButton(
            tooltip: "Download App",
            onPressed: () {
              //popup with multiple versions
            },
            icon: const Icon(
              Icons.download_outlined,
              color: primary,
            ),
          ),
          IconButton(
            tooltip: "About me",
            onPressed: () {
              //navigate to a new page
            },
            icon: const Icon(
              Icons.person_outline_rounded,
              color: orange,
            ),
          ),
          IconButton(
            tooltip: "Friends",
            onPressed: () async {
              await customAjax();
            },
            icon: const Icon(
              Icons.contacts_outlined,
              color: blue,
            ),
          ),
          IconButton(
            tooltip: "Log-out",
            onPressed: () => Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) => const Login(),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ),
            ),
            icon: const Icon(
              Icons.power_settings_new_outlined,
              color: errorColor,
            ),
          ),
        ],
      ),
      body: CustomWrap(
        children: List.generate(
          3,
          (i) => const WrapHelper(
            "title",
            "",
            Login(),
          ),
        ),
      ),
    );
  }
}
