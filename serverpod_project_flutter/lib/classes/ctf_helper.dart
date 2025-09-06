import "package:flutter/material.dart";
import "package:serverpod_project_flutter/constant/colors.dart";

class CTFHelper {
  CTFHelper({this.labelText, this.errorText});
  var empty = true;
  String? errorText;
  String? labelText;
  final controller = TextEditingController();
  final focusNode = FocusNode();
  var active = false;
  Color get color => errorText == null ? primary : errorColor;
  void select() => active = !active;
}
