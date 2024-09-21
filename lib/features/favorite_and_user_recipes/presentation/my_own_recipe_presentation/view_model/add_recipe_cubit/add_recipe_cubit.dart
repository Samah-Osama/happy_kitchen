import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/my_own_recipe_data/models/add_recipe_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_recipe_state.dart';

class AddRecipeCubit extends Cubit<AddRecipeState> {
  AddRecipeCubit() : super(AddRecipeInitial());

  addRecipe(AddRecipeModel recipe) async {
    emit(AddRecipeLoading());
    try {
      var recipeBox = Hive.box<AddRecipeModel>(kRecipeBox);
      await recipeBox.add(recipe);
      emit(AddRecipeSuccess());
    } catch (e) {
      emit(
        AddRecipeFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
