
import 'package:hive/hive.dart';
part 'add_recipe_model.g.dart';

@HiveType(typeId: 0)
class AddRecipeModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String image;
  @HiveField(2)
  final String recipeTime;
  @HiveField(3)
  final String ingredients;
  @HiveField(4)
  final String steps;
  AddRecipeModel(
      {required this.title,
      required this.image,
      required this.recipeTime,
      required this.ingredients,
      required this.steps});
}
