import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    this.inputFormatters,
    this.useSuffixAsPrefixCupertino = false,
    this.suffix,
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
  final List<TextInputFormatter>? inputFormatters;
  final bool useSuffixAsPrefixCupertino;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    if (!Platform.isIOS) {
      return CupertinoTextFormFieldRow(
        textCapitalization: textCapitalization,
        onChanged: onChanged,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        autocorrect: autocorrect,
        enableSuggestions: enableSuggestions,
        prefix: useSuffixAsPrefixCupertino ? suffix : prefix,
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
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        filled: color != null,
        fillColor: color,
        prefixIcon: prefix is Icon ? prefix : null,
        prefix: prefix is! Icon ? prefix : null,
        hintText: hintText,
        hintStyle: hintStyle,
        suffix: suffix is Icon ? suffix : null,
        suffixIcon: suffix is! Icon ? suffix : null,
        border: materialInputBorder is OutlineInputBorder
            ? (materialInputBorder as OutlineInputBorder).copyWith(
                borderRadius: borderRadius as BorderRadius,
                borderSide: borderSide,
              )
            : (materialInputBorder as UnderlineInputBorder).copyWith(
                borderRadius: borderRadius as BorderRadius,
                borderSide: borderSide,
              ),
      ),
    );
  }
}
