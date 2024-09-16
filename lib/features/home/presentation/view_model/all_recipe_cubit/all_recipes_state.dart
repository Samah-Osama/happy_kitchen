part of 'all_recipes_cubit.dart';

sealed class AllRecipesState extends Equatable {
  const AllRecipesState();

  @override
  List<Object> get props => [];
}

final class AllRecipesInitial extends AllRecipesState {}

final class AllRecipesSuccess extends AllRecipesState {
  final List<AllRecipeModel> allRecipes;

const AllRecipesSuccess({required this.allRecipes});
}

final class AllRecipesLoading extends AllRecipesState {}

final class AllRecipesFailure extends AllRecipesState {
  final String errorMessage;

  const AllRecipesFailure({required this.errorMessage});
}
