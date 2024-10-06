import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/recipe_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_recipe_to_favorite_state.dart';

class AddRecipeToFavoriteCubit extends Cubit<AddRecipeToFavoriteState> {
  AddRecipeToFavoriteCubit() : super(AddRecipeToFavoriteInitial());

  addRecipeToFavorite(RecipeModel recipes) async {
    try {
      var favoriteBox = Hive.box<RecipeModel>(kRecipeModelBox);
      await favoriteBox.add(recipes);
      emit(AddRecipeToFavoriteSuccess());
    } catch (e) {
      emit(
        AddRecipeToFavoriteFailure(errorMessage: e.toString()),
      );
    }
  }
}
