import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.onSaved,
    this.validatorMessage,
    this.labelText,
    this.maxLines,
    this.validator,
    this.index,
  });
  final void Function(String)? onChanged;
  final String? hintText;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final int? maxLines;
  final String? validatorMessage;
  final String? labelText;
  final Function(String?)? validator;
  final int? index;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value!.isEmpty) {
          return validatorMessage;
        }
        return null;
      },
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w500,
              color: ThemeColorHelper.getWhiteAndBlack(context)),
          hintText: hintText,
          hintStyle:
              TextStyle(color: ThemeColorHelper.getWhiteAndBlack(context))),
    );
  }
}

class CustomRatingTextFormField extends StatelessWidget {
  const CustomRatingTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.onSaved,
    this.validatorMessage,
    this.labelText,
    this.maxLines,
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
        } else if (double.tryParse(value) == null) {
          return validatorMessage;
        } else if (double.tryParse(value)! > 5) {
          return 'Rating must be between 1 : 5';
        }
        return null;
      },
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w500,
              color: ThemeColorHelper.getWhiteAndBlack(context)),
          hintText: hintText,
          hintStyle:
              TextStyle(color: ThemeColorHelper.getWhiteAndBlack(context))),
    );
  }
}

class CustomRecipeTimeTextFormField extends StatelessWidget {
  const CustomRecipeTimeTextFormField({
    super.key,
    this.onChanged,
    this.hintText,
    this.keyboardType,
    this.onSaved,
    this.validatorMessage,
    this.labelText,
    this.maxLines,
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
        } else if (double.tryParse(value) == null) {
          return validatorMessage;
        }
        return null;
      },
      maxLines: maxLines,
      keyboardType: keyboardType,
      onChanged: onChanged,
      onSaved: onSaved,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Styles.textStyle16.copyWith(
              fontWeight: FontWeight.w500,
              color: ThemeColorHelper.getWhiteAndBlack(context)),
          hintText: hintText,
          hintStyle:
              TextStyle(color: ThemeColorHelper.getWhiteAndBlack(context))),
    );
  }
}
