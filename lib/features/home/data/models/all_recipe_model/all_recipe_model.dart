import 'package:equatable/equatable.dart';

class AllRecipeModel extends Equatable {
  final int? id;
  final String? title;
  final String? description;
  final String? image;
  final String? preparationTime;
  final String? category;
  final int? serving;
  final bool? isVegan;
  final String? fat;
  final bool? isHalal;
  final int? rating;
  final String? kitchenType;

  const AllRecipeModel({
     this.id,
     this.title,
     this.description,
     this.image,
     this.preparationTime,
     this.category,
    this.serving,
    this.isVegan,
    this.fat,
    this.isHalal,
     this.rating,
    this.kitchenType,
  });

  factory AllRecipeModel.fromJson(Map<String, dynamic> json) {
    return AllRecipeModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
      preparationTime: json['preparationTime'] as String,
      category: json['category'] as String,
      serving: json['serving'] as int?,
      isVegan: json['isVegan'] as bool?,
      fat: json['fat'] as String?,
      isHalal: json['isHalal'] as bool?,
      rating: json['rating'] as int,
      kitchenType: json['kitchenType'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'image': image,
        'preparationTime': preparationTime,
        'category': category,
        'serving': serving,
        'isVegan': isVegan,
        'fat': fat,
        'isHalal': isHalal,
        'rating': rating,
      };

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      image,
      preparationTime,
      category,
      serving,
      isVegan,
      fat,
      isHalal,
      rating,
    ];
  }
}
