part of 'all_recipes_cubit.dart';

sealed class AllRecipesState extends Equatable {
  const AllRecipesState();

  @override
  List<Object> get props => [];
}

final class AllRecipesInitial extends AllRecipesState {}

final class NoMoreRecipeState extends AllRecipesState {}

final class AllRecipesSuccess extends AllRecipesState {
  final List<RecipeModel> allRecipes;

  const AllRecipesSuccess({required this.allRecipes});
}

final class AllRecipesLoading extends AllRecipesState {}

final class AllRecipesPaginationLoading extends AllRecipesState {}

final class AllRecipesFailure extends AllRecipesState {
  final String errorMessage;

  const AllRecipesFailure({required this.errorMessage});
}

final class AllRecipesPaginationFailure extends AllRecipesState {
  final String errorMessage;

  const AllRecipesPaginationFailure({required this.errorMessage});
}
