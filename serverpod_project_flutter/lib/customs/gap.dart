import "package:flutter/material.dart";

class Gap extends StatelessWidget {
  const Gap({this.w = 0, this.h = 0, super.key});
  final double w;
  final double h;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: w,
      height: h,
    );
  }
}
