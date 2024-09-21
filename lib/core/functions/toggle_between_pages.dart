import 'package:flutter/material.dart';

void toggleBetweenPages(int index, dynamic controller) {
    controller.animateToPage(index,
        duration: const Duration(microseconds: 1), curve: Curves.bounceIn);
  }