import "package:flutter/material.dart";
import "package:serverpod_project_flutter/classes/cbr.dart";
import "package:serverpod_project_flutter/classes/ceig.dart";
import "package:serverpod_project_flutter/constant/colors.dart";

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.onTap,
    required this.child,
    this.borderRadius = 0,
    this.padding = const CEIG(0, 0, 0, 0),
    this.shadowColor = transparent,
    this.borderColor = transparent,
    this.borderWidth = 1,
    this.onLongPress,
    super.key,
  });
  final void Function()? onTap;
  final void Function()? onLongPress;
  final Widget child;
  final Color backgroundColor;
  final Color borderColor;
  final Color shadowColor;
  final double width;
  final double height;
  final double borderWidth;
  final double borderRadius;
  final CEIG padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      onLongPress: onLongPress,
      style: ButtonStyle(
        animationDuration: const Duration(milliseconds: 500),
        elevation: const WidgetStatePropertyAll(0),
        visualDensity: VisualDensity.compact,
        padding: WidgetStatePropertyAll(padding.v),
        fixedSize: WidgetStatePropertyAll(
          Size(width, height),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: CBR.all(borderRadius).v,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
        shadowColor: WidgetStatePropertyAll(shadowColor),
        side: WidgetStatePropertyAll(
          BorderSide(
            color: borderColor,
            width: borderWidth,
          ),
        ),
      ),
      child: child,
    );
  }
}
