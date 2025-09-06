import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:serverpod_project_flutter/classes/ctf_helper.dart";
import "package:serverpod_project_flutter/constant/colors.dart";

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    required this.x,
    this.maxLines,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
    this.enabled = true,
    this.dot = false,
    this.numeral = false,
    this.isPassword = false,
    this.expands = false,
    this.readOnly = false,
    super.key,
  });
  final CTFHelper x;
  final int? maxLines;
  final bool numeral;
  final bool dot;
  final bool isPassword;
  final bool enabled;
  final bool expands;
  final bool readOnly;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorErrorColor: errorColor,
      cursorColor: primary,
      expands: expands,
      readOnly: readOnly,
      enabled: enabled,
      controller: x.controller,
      focusNode: x.focusNode,
      maxLines: isPassword ? 1 : maxLines,
      keyboardType:
          numeral ? TextInputType.numberWithOptions(decimal: dot) : null,
      inputFormatters: numeral
          ? [
              FilteringTextInputFormatter.allow(
                dot ? RegExp(r"^\d*\.?\d*$") : RegExp(r"^\d*$"),
              ),
            ]
          : null,
      obscureText: isPassword,
      cursorOpacityAnimates: true,
      style: const TextStyle(
        fontSize: 16,
      ),
      decoration: InputDecoration(
        errorText: x.errorText,
        labelText: x.labelText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
