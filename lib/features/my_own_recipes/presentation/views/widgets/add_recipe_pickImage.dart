import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class AddRecipeImage extends StatefulWidget {
  const AddRecipeImage({super.key});

  @override
  State<AddRecipeImage> createState() => _AddRecipeImageState();
}

class _AddRecipeImageState extends State<AddRecipeImage> {
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pickImage,
      child: Container(
        height: 200.h,
        color: Colors.grey.shade400,
        child: Center(
            child: pickedImage == null
                ? Icon(
                    Icons.add_a_photo,
                    size: 50,
                    color: Colors.grey.shade800,
                  )
                : Image.file(
                    pickedImage!,
                    fit: BoxFit.fill,
                  )),
      ),
    );
  }

  final ImagePicker imagePicker = ImagePicker();
  Future<void> pickImage() async {
    XFile? image = await pickImageFromGallery();
    XFile? cameraImage = await pickImageByCam();
    setState(() {
      image != null ? pickedImage = File(image.path) : null;
      cameraImage != null ? pickedImage = File(cameraImage.path) : null;
    });
  }

  Future<XFile?> pickImageFromGallery() async {
    var image = await imagePicker.pickImage(source: ImageSource.gallery);
    return image;
  }

  Future<XFile?> pickImageByCam() async {
    var cameraImage = await imagePicker.pickImage(source: ImageSource.camera);
    return cameraImage;
  }
}
