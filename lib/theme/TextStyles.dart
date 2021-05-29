import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vvn_xchange/theme/ThemeColors.dart';

TextStyle boldHeading() {
  return TextStyle(
    color: ThemeColor.themePrimary,
    fontWeight: FontWeight.bold,
    fontSize: 30,
  );
}

InputDecoration textFieldInputDecoration(String hintText, String labelText) {
  return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      labelStyle: TextStyle(color: ThemeColor.themePrimary),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ThemeColor.themePrimary)),
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: ThemeColor.themePrimary)));
}

TextStyle simpleTextStyle() {
  return TextStyle(
    color: ThemeColor.themePrimary,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
}

TextStyle smallTextStyle() {
  return TextStyle(
    color: ThemeColor.themePrimary,
    decoration: TextDecoration.underline,
    fontSize: 14,
  );
}
