part of 'recipe_by_category_cubit.dart';

sealed class RecipeByCategoryState extends Equatable {
  const RecipeByCategoryState();

  @override
  List<Object> get props => [];
}

final class RecipeByCategoryInitial extends RecipeByCategoryState {}

final class RecipeByCategoryLoading extends RecipeByCategoryState {}

final class RecipeByCategorySuccess extends RecipeByCategoryState {
  final List<AllRecipeModel> recipes;

  const RecipeByCategorySuccess({required this.recipes});
}

final class RecipeByCategoryFailure extends RecipeByCategoryState {
  final String errorMessage;

 const RecipeByCategoryFailure({required this.errorMessage});
}
