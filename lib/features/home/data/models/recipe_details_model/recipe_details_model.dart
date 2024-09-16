import 'package:equatable/equatable.dart';

import 'ingredient.dart';
import 'step.dart';

class RecipeDetailsModel extends Equatable {
  final List<Step>? steps;
  final List<Ingredient>? ingredients;

  const RecipeDetailsModel({this.steps, this.ingredients});

  factory RecipeDetailsModel.fromJson(Map<String, dynamic> json) {
    return RecipeDetailsModel(
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => Step.fromJson(e as Map<String, dynamic>))
          .toList(),
      ingredients: (json['ingredients'] as List<dynamic>?)
          ?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'steps': steps?.map((e) => e.toJson()).toList(),
        'ingredients': ingredients?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props => [steps, ingredients];
}
