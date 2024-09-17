import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/data/repos/home_repo.dart';

part 'recipe_by_category_state.dart';

class RecipeByCategoryCubit extends Cubit<RecipeByCategoryState> {
  RecipeByCategoryCubit(this.homeRepo) : super(RecipeByCategoryInitial());
  final HomeRepo homeRepo;

  Future<void> getRecipesByCategory({required String category}) async {
    emit(RecipeByCategoryLoading());
    var results = await homeRepo.fetchAllRecipesByCategory(category: category);
    results.fold((failure) {
      emit(
        RecipeByCategoryFailure(errorMessage: failure.errorMessage),
      );
    }, (recipe) {
      emit(
        RecipeByCategorySuccess(recipes: recipe),
      );
    });
  }
}
