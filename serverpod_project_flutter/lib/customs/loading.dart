import 'package:flutter/material.dart';

import '/constant/colors.dart';
import '/customs/mc_running.dart';

loading(context) => showDialog(
      context: context,
      builder: (BuildContext context) => const AlertDialog(
        backgroundColor: transparent,
        shadowColor: transparent,
        title: Center(
            child: Text(
          "Loading",
          style: TextStyle(color: orange),
        )),
        content: MCRunning(),
      ),
    );
