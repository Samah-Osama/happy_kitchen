import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'picked_image_state.dart';

class PickedImageCubit extends Cubit<PickedImageState> {
  PickedImageCubit() : super(PickedImageInitial());

  final imagePicker = ImagePicker();
  File? pickedImage;
  
  Future getImage() async {
    try {
      var image = await imagePicker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        pickedImage =File(image.path);
      }
      
      emit(PickedImageSuccess());
    } catch (e) {
      emit(
        PickedImageFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
