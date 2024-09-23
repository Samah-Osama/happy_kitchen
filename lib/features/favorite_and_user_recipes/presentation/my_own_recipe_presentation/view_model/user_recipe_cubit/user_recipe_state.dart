part of 'user_recipe_cubit.dart';

sealed class UserRecipeState extends Equatable {
  const UserRecipeState();

  @override
  List<Object> get props => [];
}

final class UserRecipeInitial extends UserRecipeState {}

final class UserRecipeSuccess extends UserRecipeState {
  // final List<AddRecipeModel> recipe;

  // const UserRecipeSuccess({required this.recipe});
}

final class UserRecipeFailure extends UserRecipeState {
  final String errorMessage;

  const UserRecipeFailure({required this.errorMessage});
}
