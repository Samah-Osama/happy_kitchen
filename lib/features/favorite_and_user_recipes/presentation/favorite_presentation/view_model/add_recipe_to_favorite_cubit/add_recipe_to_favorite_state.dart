part of 'add_recipe_to_favorite_cubit.dart';

sealed class AddRecipeToFavoriteState extends Equatable {
  const AddRecipeToFavoriteState();

  @override
  List<Object> get props => [];
}

final class AddRecipeToFavoriteInitial extends AddRecipeToFavoriteState {}

final class AddRecipeToFavoriteSuccess extends AddRecipeToFavoriteState {}

final class AddRecipeToFavoriteFailure extends AddRecipeToFavoriteState {
  final String errorMessage;
  const AddRecipeToFavoriteFailure({required this.errorMessage});
}
