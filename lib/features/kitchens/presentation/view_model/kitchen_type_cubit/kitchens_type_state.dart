part of 'kitchens_type_cubit.dart';

sealed class KitchensTypeState extends Equatable {
  const KitchensTypeState();

  @override
  List<Object> get props => [];
}

final class KitchensTypeInitial extends KitchensTypeState {}

final class KitchensTypeLoading extends KitchensTypeState {}

final class KitchensTypeSuccess extends KitchensTypeState {
  final List<KitchensModel> kitchens;

  const KitchensTypeSuccess({required this.kitchens});
}

final class KitchensTypeFailure extends KitchensTypeState {
  final String errorMessage;

 const KitchensTypeFailure({required this.errorMessage});

}
