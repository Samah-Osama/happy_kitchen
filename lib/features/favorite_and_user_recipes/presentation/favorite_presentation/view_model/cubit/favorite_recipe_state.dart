part of 'favorite_recipe_cubit.dart';

sealed class FavoriteRecipeState extends Equatable {
  const FavoriteRecipeState();

  @override
  List<Object> get props => [];
}

final class FavoriteRecipeInitial extends FavoriteRecipeState {}

final class AddRecipeToFavoriteSuccess extends FavoriteRecipeState {
  
}

final class AddRecipeToFavoriteFailure extends FavoriteRecipeState {
  final String errorMessage;

  const AddRecipeToFavoriteFailure({required this.errorMessage});
}
