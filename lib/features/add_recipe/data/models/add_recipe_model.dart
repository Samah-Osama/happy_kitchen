import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteRecipeModel extends HiveObject {
  final String title;
  final Image image;
  // final double rating;
  final String recipeTime;
  // final Level level;
  final String ingredients;
  final String steps;

  FavoriteRecipeModel(
      {required this.title,
      required this.image,
      required this.recipeTime,
      required this.ingredients,
      required this.steps});
}
