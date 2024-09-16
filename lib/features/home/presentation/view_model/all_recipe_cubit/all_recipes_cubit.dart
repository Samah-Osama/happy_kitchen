import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/all_recipe_model.dart';
import 'package:happy_kitchen/features/home/data/repos/home_repo.dart';

part 'all_recipes_state.dart';

class AllRecipesCubit extends Cubit<AllRecipesState> {
  AllRecipesCubit(this.homeRepo) : super(AllRecipesInitial());
  final HomeRepo homeRepo;
  Future<void> getAllRecipes() async {
    emit(AllRecipesLoading());
    var results = await homeRepo.fetchAllRecipes();
    results.fold((failure) {
      emit(
        AllRecipesFailure(errorMessage: failure.errorMessage),
      );
    }, (recipe) {
      emit(
        AllRecipesSuccess(allRecipes: recipe),
      );
    });
  }
}
