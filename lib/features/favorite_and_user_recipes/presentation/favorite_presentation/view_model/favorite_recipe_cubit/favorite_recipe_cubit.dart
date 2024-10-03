import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/favorite_data/models/favorite_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'favorite_recipe_state.dart';

class FavoriteRecipeCubit extends Cubit<FavoriteRecipeState> {
  FavoriteRecipeCubit() : super(FavoriteRecipeInitial());
  List<FavoriteModel>? favoriteRecipeList;
  getFavoriteRecipe() {
    var favoriteBox = Hive.box<FavoriteModel>(kFavoriteBox);
    favoriteRecipeList = favoriteBox.values.toList();
    emit(FavoriteRecipeSuccess());
  }
}
