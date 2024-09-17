import 'package:dartz/dartz.dart';
import 'package:happy_kitchen/core/errors/failure.dart';
import 'package:happy_kitchen/features/add_recipe/data/models/add_recipe_model.dart';

abstract class AddRecipeRepo {
  Future<Either<Failure, AddRecipeModel>> addRecipe({required AddRecipeModel addRecipeModel});
}
