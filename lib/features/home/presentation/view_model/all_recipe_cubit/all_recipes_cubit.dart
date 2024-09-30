import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/data/repos/home_repo.dart';

part 'all_recipes_state.dart';

class AllRecipesCubit extends Cubit<AllRecipesState> {
  AllRecipesCubit(this.homeRepo) : super(AllRecipesInitial());
  final HomeRepo homeRepo;
  List<AllRecipeModel> allRecipeList = [];
  

  Future<void> getAllRecipes(
      {int pageNumber = 0, bool thereIsMoreData = true}) async {
    if (thereIsMoreData) {
      if (pageNumber == 0) {
        emit(AllRecipesLoading());
      } else {
        emit(AllRecipesPaginationLoading());
      }
      var results = await homeRepo.fetchAllRecipes(pageNumber: pageNumber);
      results.fold((failure) {
        if (pageNumber == 0) {
          emit(
            AllRecipesFailure(errorMessage: failure.errorMessage),
          );
        } else {
          emit(AllRecipesPaginationFailure(errorMessage: failure.errorMessage));
        }
      }, (newRecipeList) {
        if (newRecipeList.isEmpty) {
          emit(NoMoreRecipeState());
        } else {
          allRecipeList.addAll(newRecipeList);
          emit(
            AllRecipesSuccess(allRecipes: allRecipeList),
          );
        }
      });
    }
  }
}
