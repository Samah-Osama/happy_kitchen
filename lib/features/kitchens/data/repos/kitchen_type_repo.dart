import 'package:dartz/dartz.dart';
import 'package:happy_kitchen/core/errors/failure.dart';
import 'package:happy_kitchen/features/kitchens/data/models/kitchens_model/kitchens_model.dart';

abstract class KitchenTypeRepo {
  Future<Either<Failure, List<KitchensModel>>> fetchRecipeByKitchenType();
}
