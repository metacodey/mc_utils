import 'package:flutter/material.dart';
//import 'package:hexcolor/hexcolor.dart';

class McTextFieldTheme {
  static InputDecoration textInputDecoration(
      {String lableText = "",
      String hintText = "",
      Widget? prefixIcon,
      Color? fillColor,
      TextStyle? labelStyle,
      TextStyle? hintStyle,
      Widget? suffixIcon,
      EdgeInsetsGeometry? contentPadding,
      BorderRadius borderRadius = const BorderRadius.all(Radius.circular(10)),
      BorderSide? borderSide,
      Color errorBorder = Colors.red}) {
    borderSide ??=
        const BorderSide(color: Color.fromRGBO(2, 57, 88, 1), width: 1);
    return InputDecoration(
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      fillColor: fillColor,
      labelStyle: labelStyle,
      hintStyle: hintStyle,
      labelText: lableText,
      hintText: hintText,
      contentPadding:
          contentPadding ?? const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
        borderSide: borderSide,
        borderRadius: borderRadius,
      ),
      enabledBorder: OutlineInputBorder(
          borderSide: borderSide, borderRadius: borderRadius),
      disabledBorder: OutlineInputBorder(
          borderSide: borderSide, borderRadius: borderRadius),
      errorBorder: OutlineInputBorder(
          borderRadius: borderRadius, borderSide: borderSide),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: borderRadius, borderSide: borderSide),
    );
  }

  static BoxDecoration inputBoxDecorationShaddow() {
    return const BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.white,
        blurRadius: 20,
        offset: Offset(0, 5),
      )
    ]);
  }
}
