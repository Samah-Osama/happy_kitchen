import 'package:dartz/dartz.dart';
import 'package:happy_kitchen/core/errors/failure.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/recipe_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<RecipeModel>>> fetchAllRecipes(
      {int pageNumber = 0});
  Future<Either<Failure, List<RecipeModel>>> fetchRecipesDetails(
      {required int id});
  Future<Either<Failure, List<RecipeModel>>> fetchAllRecipesByCategory(
      {required String category});
}
