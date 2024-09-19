import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/features/my_own_recipes/data/models/add_recipe_model.dart';

part 'user_recipe_state.dart';

class UserRecipeCubit extends Cubit<UserRecipeState> {
  UserRecipeCubit() : super(UserRecipeInitial());
  getUserRecipes(){

  }
}
