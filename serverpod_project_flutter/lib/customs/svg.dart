import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

class SVG extends StatelessWidget {
  const SVG(
    this.assets, {
    this.size,
    this.color,
    super.key,
  });
  final String assets;
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/animations/$assets.svg",
      width: size,
      height: size,
      colorFilter: color == null
          ? null
          : ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            ),
    );
  }
}
