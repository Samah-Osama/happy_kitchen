import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:happy_kitchen/features/kitchens/data/models/kitchens_model/kitchens_model.dart';
import 'package:happy_kitchen/features/kitchens/data/repos/kitchen_type_repo.dart';

part 'kitchens_type_state.dart';

class KitchensTypeCubit extends Cubit<KitchensTypeState> {
  KitchensTypeCubit(this.kitchenTypeRepo) : super(KitchensTypeInitial());
  final KitchenTypeRepo kitchenTypeRepo;

  Future<void> getAllKitchens() async {
    emit(KitchensTypeLoading());
    var result = await kitchenTypeRepo.fetchAllKitchensType();
    result.fold((failure) {
      emit(
        KitchensTypeFailure(errorMessage: failure.errorMessage),
      );
    }, (kitchen) {
      emit(
        KitchensTypeSuccess(kitchens: kitchen),
      );
    });
  }
}
