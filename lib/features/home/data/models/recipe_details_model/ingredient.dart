import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
  final int? ingredientId;
  final String? title;
  final int? quantity;
  final String? unity;

  const Ingredient({
    this.ingredientId,
    this.title,
    this.quantity,
    this.unity,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        ingredientId: json['ingredientId'] as int?,
        title: json['title'] as String?,
        quantity: json['quantity'] as int?,
        unity: json['unity'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'ingredientId': ingredientId,
        'title': title,
        'quantity': quantity,
        'unity': unity,
      };

  @override
  List<Object?> get props => [ingredientId, title, quantity, unity];
}
