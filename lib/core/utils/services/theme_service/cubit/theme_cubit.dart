import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:happy_kitchen/constant.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.light());
  void toggleTheme() {
    if (state == ThemeData.light()) {
      emit(ThemeData.dark().copyWith(scaffoldBackgroundColor: kDarkGreyColor));
    } else {
      emit(ThemeData.light());
    }
  }
}
