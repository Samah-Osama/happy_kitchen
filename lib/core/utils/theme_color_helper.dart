import 'package:flutter/material.dart';
import 'package:happy_kitchen/constant.dart';

class ThemeColorHelper {
  static Color getPrimaryColor(context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kPrimaryColorDarkMode
        : kPrimaryColorLightMode;
  }

  static Color getYellowAndBlack(context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kPrimaryColorDarkMode
        : kDarkColor;
  }

  static Color getSeconderyColor(context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kSecondaryColorD
        : kSecondaryColorLightM;
  }

  static Color getLightGreyAndPink(context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kLightGreyColor
        : kLightPinkColor;
  }

  static Color getDarkGreyAndPink(context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkGreyColor
        : kSecondaryColorLightM;
  }

  static Color getLightGreyAndDarkPink(context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kLightGreyColor
        : kPrimaryColorLightMode;
  }

  static Color getGreyAndWhite(context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kDarkGreyFontColor
        : kWhiteColor;
  }

  static Color getBlackAndWhite(context) {
    return Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : kWhiteColor;
  }

  static Color getWhiteAndBlack(context) {
    return Theme.of(context).brightness == Brightness.dark
        ? kWhiteColor
        : Colors.black;
  }
  
}
