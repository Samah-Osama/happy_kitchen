import 'package:equatable/equatable.dart';

class Step extends Equatable {
  final int? stepsId;
  final String? description;
  final bool? isOptional;
  final int? order;

  const Step({this.stepsId, this.description, this.isOptional, this.order});

  factory Step.fromJson(Map<String, dynamic> json) => Step(
        stepsId: json['stepsId'] as int?,
        description: json['description'] as String?,
        isOptional: json['isOptional'] as bool?,
        order: json['order'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'stepsId': stepsId,
        'description': description,
        'isOptional': isOptional,
        'order': order,
      };

  @override
  List<Object?> get props => [stepsId, description, isOptional, order];
}
