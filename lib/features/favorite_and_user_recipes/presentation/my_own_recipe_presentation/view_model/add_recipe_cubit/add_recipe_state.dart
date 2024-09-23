part of 'add_recipe_cubit.dart';

sealed class AddRecipeState extends Equatable {
  const AddRecipeState();

  @override
  List<Object> get props => [];
}

final class AddRecipeInitial extends AddRecipeState {}

final class AddRecipeLoading extends AddRecipeState {}

final class AddRecipeSuccess extends AddRecipeState {}

final class AddRecipeFailure extends AddRecipeState {
  final String errorMessage;

  const AddRecipeFailure({required this.errorMessage});
}
