part of 'steps_and_ingredients_cubit.dart';

sealed class StepsAndIngredientsState extends Equatable {
  const StepsAndIngredientsState();

  @override
  List<Object> get props => [];
}

final class StepsAndIngredientsInitial extends StepsAndIngredientsState {}

final class StepsButtonState extends StepsAndIngredientsState {}

final class IngredientsButtonState extends StepsAndIngredientsState {}
