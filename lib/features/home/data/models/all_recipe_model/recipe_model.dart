
import 'package:hive/hive.dart';
part 'recipe_model.g.dart';
@HiveType(typeId: 2)
class RecipeModel extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String? image;
  @HiveField(4)
  final String preparationTime;
  @HiveField(5)
  final String category;
  @HiveField(6)
  final int? serving;
  @HiveField(7)
  final bool? isVegan;
  @HiveField(8)
  final String? fat;
  @HiveField(9)
  final bool? isHalal;
  @HiveField(10)
  final int? rating;
  @HiveField(11)
  final String? kitchenType;

   RecipeModel({
    required this.id,
    required this.title,
    required this.description,
    this.image,
    required this.preparationTime,
    required this.category,
    this.serving,
    this.isVegan,
    this.fat,
    this.isHalal,
    this.rating,
    this.kitchenType,
  });

  factory RecipeModel.fromJson(Map<String, dynamic> json) {
    return RecipeModel(
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
