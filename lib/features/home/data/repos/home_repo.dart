import 'package:dartz/dartz.dart';
import 'package:happy_kitchen/core/errors/failure.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<AllRecipeModel>>> fetchAllRecipes(
      {int pageNumber = 0});
  Future<Either<Failure, List<AllRecipeModel>>> fetchRecipesDetails(
      {required int id});
  Future<Either<Failure, List<AllRecipeModel>>> fetchAllRecipesByCategory(
      {required String category});
}
