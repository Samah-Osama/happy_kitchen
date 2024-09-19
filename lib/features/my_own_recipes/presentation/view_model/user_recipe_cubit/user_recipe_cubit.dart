import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/features/my_own_recipes/data/models/add_recipe_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_recipe_state.dart';

class UserRecipeCubit extends Cubit<UserRecipeState> {
  UserRecipeCubit() : super(UserRecipeInitial());
  List<AddRecipeModel>? recipe;
  getUserRecipes() {
    var recipeBox = Hive.box<AddRecipeModel>(kRecipeBox);
   recipe = recipeBox.values.toList();
    emit(
      UserRecipeSuccess(recipe: recipe!),
    );
  }
}
