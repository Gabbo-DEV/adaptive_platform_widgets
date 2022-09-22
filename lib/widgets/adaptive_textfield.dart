import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveTextFormField extends StatelessWidget {
  const AdaptiveTextFormField({
    Key? key,
    this.textCapitalization = TextCapitalization.none,
    this.onChanged,
    this.keyboardType,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.prefix,
    this.obscureText = false,
    this.hintText,
    this.borderRadius,
    this.materialInputBorder = const OutlineInputBorder(),
    this.hintStyle,
    this.textInputAction,
    this.borderSide = const BorderSide(),
    this.validator,
    this.color,
  }) : super(key: key);

  final TextCapitalization textCapitalization;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool autocorrect;
  final bool enableSuggestions;
  final Widget? prefix;
  final bool obscureText;
  final String? hintText;
  final BorderRadiusGeometry? borderRadius; // property only used for iOS
  final InputBorder materialInputBorder;
  final BorderSide borderSide;
  final TextStyle? hintStyle;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return CupertinoTextFormFieldRow(
        textCapitalization: textCapitalization,
        onChanged: onChanged,
        keyboardType: keyboardType,
        autocorrect: autocorrect,
        enableSuggestions: enableSuggestions,
        prefix: prefix,
        validator: validator,
        obscureText: obscureText,
        placeholder: hintText,
        placeholderStyle: hintStyle,
        textInputAction: textInputAction,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
          border: Border.all(
            width: borderSide.width,
            style: borderSide.style,
          ),
        ),
      );
    }

    return TextFormField(
      textCapitalization: textCapitalization,
      onChanged: onChanged,
      keyboardType: keyboardType,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestions,
      obscureText: obscureText,
      validator: validator,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        filled: color != null,
        fillColor: color,
        prefix: prefix,
        hintText: hintText,
        hintStyle: hintStyle,
        border: materialInputBorder.copyWith(borderSide: borderSide),
      ),
    );
  }
}
