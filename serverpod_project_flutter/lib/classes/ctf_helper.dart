import 'package:flutter/material.dart';
import 'package:serverpod_project_flutter/constant/colors.dart';

class CTFHelper {
  bool empty = true;
  Color get color => errorText == null ? primary : errorColor;
  String? errorText, labelText;
  final TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  bool active = false;
  void select() => active = !active;
  CTFHelper({this.labelText, this.errorText});
}
