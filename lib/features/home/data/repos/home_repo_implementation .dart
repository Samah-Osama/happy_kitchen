import 'package:dartz/dartz.dart';
import 'package:happy_kitchen/core/errors/failure.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/data/repos/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  @override
  Future<Either<Failure, List<AllRecipeModel>>> fetchAllRecipes() {
    // TODO: implement fetchAllRecipes
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AllRecipeModel>>> fetchRecipesDetails({required int id}) {
    // TODO: implement fetchRecipesDetails
    throw UnimplementedError();
  }
  
}   