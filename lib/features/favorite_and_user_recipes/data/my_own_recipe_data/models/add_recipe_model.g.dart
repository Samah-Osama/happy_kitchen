// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddRecipeModelAdapter extends TypeAdapter<AddRecipeModel> {
  @override
  final int typeId = 0;

  @override
  AddRecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddRecipeModel(
      title: fields[0] as String,
      image: fields[1] as String,
      recipeTime: fields[2] as String,
      ingredients: fields[3] as String,
      steps: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddRecipeModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.recipeTime)
      ..writeByte(3)
      ..write(obj.ingredients)
      ..writeByte(4)
      ..write(obj.steps);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddRecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
