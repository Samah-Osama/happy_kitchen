import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:happy_kitchen/core/errors/failure.dart';
import 'package:happy_kitchen/core/utils/services/api_service.dart';
import 'package:happy_kitchen/features/kitchens/data/models/kitchens_model/kitchens_model.dart';
import 'package:happy_kitchen/features/kitchens/data/repos/kitchen_type_repo.dart';

class KitchenTypeRepoImpel implements KitchenTypeRepo {
  final ApiService apiService;

  KitchenTypeRepoImpel({required this.apiService});
  @override
  Future<Either<Failure, List<KitchensModel>>> fetchAllKitchensType() async {
    try {
      var data = await apiService.get(endpoint: 'kitchen-types');
      List<KitchensModel> kitchensList = [];
      for (var kitchen in data) {
        kitchensList.add(
          KitchensModel.fromJson(kitchen),
        );
      }
      return right(kitchensList);
    } catch (e) {
      if (e is DioException) {
        return left(
          ServerFailure.fromDioException(e),
        );
      } else {
        return left(
          ServerFailure(
            errorMessage: e.toString(),
          ),
        );
      }
    }
  }
}
