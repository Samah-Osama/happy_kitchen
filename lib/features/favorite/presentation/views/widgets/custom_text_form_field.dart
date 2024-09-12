import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.onSaved,
    this.validatorMessage,
    this.labelText, this.maxLines,
  });
  final void Function(String)? onChanged;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final int? maxLines;
  final String? validatorMessage;
  final String? labelText;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return validatorMessage;
        } else {
          return null;
        }
      },
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle:
              TextStyle(color: ThemeColorHelper.getWhiteAndBlack(context)),
          hintText: hintText,
          hintStyle:
              TextStyle(color: ThemeColorHelper.getWhiteAndBlack(context))),
    );
  }
}
