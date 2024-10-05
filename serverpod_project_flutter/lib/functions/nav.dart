import 'package:flutter/material.dart';

Future<void> nav(Widget location, BuildContext context) => Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation1, animation2) => location,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
back(context, [dynamic x]) => Navigator.of(context).pop(x);
