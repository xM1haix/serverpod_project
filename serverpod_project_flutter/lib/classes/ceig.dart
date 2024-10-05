import 'package:flutter/material.dart';

class CEIG {
  final double l, t, r, b;
  const CEIG(this.l, this.t, this.r, this.b);
  factory CEIG.all(double x) => CEIG(x, x, x, x);
  factory CEIG.s({double v = 0, double h = 0}) => CEIG(h, v, h, v);
  factory CEIG.only({double l = 0, double t = 0, double r = 0, double b = 0}) =>
      CEIG(l, t, r, b);
  EdgeInsetsGeometry get v => EdgeInsets.fromLTRB(l, t, r, b);
}
