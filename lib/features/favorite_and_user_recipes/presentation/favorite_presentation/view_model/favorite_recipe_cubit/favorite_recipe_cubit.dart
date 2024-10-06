import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/features/home/data/models/all_recipe_model/recipe_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'favorite_recipe_state.dart';

class FavoriteRecipeCubit extends Cubit<FavoriteRecipeState> {
  FavoriteRecipeCubit() : super(FavoriteRecipeInitial());
  List<RecipeModel>? favoriteRecipeList;
  getFavoriteRecipe() {
    var favoriteBox = Hive.box<RecipeModel>(kRecipeModelBox);
    favoriteRecipeList = favoriteBox.values.toList();
    emit(FavoriteRecipeSuccess());
  }
}
