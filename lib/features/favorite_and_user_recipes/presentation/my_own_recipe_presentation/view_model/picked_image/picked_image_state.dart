part of 'picked_image_cubit.dart';

sealed class PickedImageState extends Equatable {
  const PickedImageState();

  @override
  List<Object> get props => [];
}

final class PickedImageInitial extends PickedImageState {}

final class PickedImageSuccess extends PickedImageState {}

final class PickedImageFailure extends PickedImageState {
  final String errorMessage;

const  PickedImageFailure({required this.errorMessage});
}
