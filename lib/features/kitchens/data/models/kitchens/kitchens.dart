import 'package:equatable/equatable.dart';

class Kitchens extends Equatable {
  final int? id;
  final String? name;
  final String? nameSpanish;
  final String? nameArabic;
  final String? description;
  final String? descriptionArabic;
  final String? descriptionSpanish;
  final String? flag;
  final dynamic recipes;

  const Kitchens({
    this.id,
    this.name,
    this.nameSpanish,
    this.nameArabic,
    this.description,
    this.descriptionArabic,
    this.descriptionSpanish,
    this.flag,
    this.recipes,
  });

  factory Kitchens.fromJson(Map<String, dynamic> json) => Kitchens(
        id: json['id'] as int?,
        name: json['name'] as String?,
        nameSpanish: json['nameSpanish'] as String?,
        nameArabic: json['nameArabic'] as String?,
        description: json['description'] as String?,
        descriptionArabic: json['descriptionArabic'] as String?,
        descriptionSpanish: json['descriptionSpanish'] as String?,
        flag: json['flag'] as String?,
        recipes: json['recipes'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'nameSpanish': nameSpanish,
        'nameArabic': nameArabic,
        'description': description,
        'descriptionArabic': descriptionArabic,
        'descriptionSpanish': descriptionSpanish,
        'flag': flag,
        'recipes': recipes,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      nameSpanish,
      nameArabic,
      description,
      descriptionArabic,
      descriptionSpanish,
      flag,
      recipes,
    ];
  }
}
