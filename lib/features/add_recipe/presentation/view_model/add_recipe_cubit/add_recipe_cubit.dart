import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/errors/failure.dart';
import 'package:happy_kitchen/features/add_recipe/data/models/add_recipe_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'add_recipe_state.dart';

class AddRecipeCubit extends Cubit<AddRecipeState> {
  AddRecipeCubit() : super(AddRecipeInitial());

  addRecipe(AddRecipeModel recipe) async {
    emit(AddRecipeLoading());
    try {
      var recipeBox = Hive.box<AddRecipeModel>(kRecipeBox);
      recipeBox.add(recipe);
    } catch (e) {
      return ServerFailure(
        errorMessage: e.toString(),
      );
    }
  }
}
