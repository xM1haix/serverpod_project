import "package:flutter/material.dart";
import "package:serverpod_project_flutter/constant/colors.dart";
import "package:serverpod_project_flutter/customs/mc_running.dart";

Future<void> loading(BuildContext context) => showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: transparent,
        shadowColor: transparent,
        title: Center(
          child: Text(
            "Loading",
            style: TextStyle(color: orange),
          ),
        ),
        content: MCRunning(),
      ),
    );
