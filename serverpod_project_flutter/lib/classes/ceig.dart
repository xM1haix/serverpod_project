import "package:flutter/material.dart";

class CEIG {
  const CEIG(this.l, this.t, this.r, this.b);
  factory CEIG.all(double x) => CEIG(x, x, x, x);
  factory CEIG.only({double l = 0, double t = 0, double r = 0, double b = 0}) =>
      CEIG(l, t, r, b);
  factory CEIG.s({double v = 0, double h = 0}) => CEIG(h, v, h, v);
  final double l;
  final double t;
  final double r;
  final double b;
  EdgeInsetsGeometry get v => EdgeInsets.fromLTRB(l, t, r, b);
}
