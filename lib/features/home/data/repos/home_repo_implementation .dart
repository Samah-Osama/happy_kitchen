import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:happy_kitchen/core/errors/failure.dart';
import 'package:happy_kitchen/core/utils/services/api_service.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/data/repos/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;
  HomeRepoImplementation({required this.apiService});
  @override
  Future<Either<Failure, List<AllRecipeModel>>> fetchAllRecipes(
      {int pageNumber = 0}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'recipes/AllRecipesByLanguageAndKitchenType?language=EN&page=$pageNumber&size=2');
      List<AllRecipeModel> allRecipeList = [];
      for (var recipe in data) {
        allRecipeList.add(AllRecipeModel.fromJson(recipe));
      }

      return right(allRecipeList);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }

  @override
  Future<Either<Failure, List<AllRecipeModel>>> fetchRecipesDetails(
      {required int id}) {
    // TODO: implement fetchRecipesDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<AllRecipeModel>>> fetchAllRecipesByCategory(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'recipes/AllRecipesByLanguage?language=EN&category=$category&page=0&size=10');

      print("this is category $category");
      List<AllRecipeModel> allRecipeList = [];
      for (var recipe in data) {
        allRecipeList.add(AllRecipeModel.fromJson(recipe));
      }
      // print(allRecipeList);

      return right(allRecipeList);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
