import 'package:flutter/material.dart';

class Gap extends StatelessWidget {
  final double w, h;
  const Gap({this.w = 0, this.h = 0, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}
