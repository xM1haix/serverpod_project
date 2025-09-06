import "package:flutter/material.dart";

class CBR {
  const CBR(this.bl, this.br, this.tl, this.tr);
  factory CBR.all(double x) => CBR(x, x, x, x);
  factory CBR.h({double l = 0, double r = 0}) => CBR(l, r, l, r);
  factory CBR.only({
    double bl = 0,
    double br = 0,
    double tl = 0,
    double tr = 0,
  }) =>
      CBR(bl, br, tl, tr);
  factory CBR.v({double t = 0, double b = 0}) => CBR(b, b, t, t);
  final double bl;
  final double br;
  final double tl;
  final double tr;
  BorderRadius get v => BorderRadius.only(
        bottomLeft: Radius.circular(bl),
        bottomRight: Radius.circular(br),
        topLeft: Radius.circular(tl),
        topRight: Radius.circular(tr),
      );
}
