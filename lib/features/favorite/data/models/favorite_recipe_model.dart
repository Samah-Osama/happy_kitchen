import 'dart:io';
import 'package:happy_kitchen/AddRecipe.dart';

class FavoriteRecipeModel {
  final String title;

  final File image;
  final int rating;
  final String recipeTime;
  final Level level;
  final String ingredients;
  final String steps;

  FavoriteRecipeModel(
      {required this.title,
      required this.image,
      required this.rating,
      required this.recipeTime,
      required this.level,
      required this.ingredients,
      required this.steps});
}
