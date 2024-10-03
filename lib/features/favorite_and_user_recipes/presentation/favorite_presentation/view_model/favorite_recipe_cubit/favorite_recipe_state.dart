part of 'favorite_recipe_cubit.dart';

sealed class FavoriteRecipeState extends Equatable {
  const FavoriteRecipeState();

  @override
  List<Object> get props => [];
}

final class FavoriteRecipeInitial extends FavoriteRecipeState {}
final class FavoriteRecipeSuccess extends FavoriteRecipeState {
 
}

