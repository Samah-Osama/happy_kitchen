// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:image_picker/image_picker.dart';

// class AddRecipeImage extends StatefulWidget {
// const  AddRecipeImage({
//     super.key,
//     // // this.pickedImage,
//     // this.imagepath,
//   });
//   // final File? pickedImage;
//   // String? imagepath;
//   @override
//   State<AddRecipeImage> createState() => _AddRecipeImageState();
// }

// class _AddRecipeImageState extends State<AddRecipeImage> {
//   // final ImagePicker imgpicker = ImagePicker();
//   // Future getImage() async {
//   //   try {
//   //     var pickedFile = await imgpicker.pickImage(source: ImageSource.gallery);
//   //     if (pickedFile != null) {
//   //       setState(() {
//   //         widget.imagepath = pickedFile.path;
//   //         print(imagePath);
//   //       });
//   //     } else {
//   //       print("No image is selected.");
//   //     }
//   //   } catch (e) {
//   //     print("error while picking image.");
//   //   }
//   // }

//   // String imagePath = '';
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: getImage,
//       child: Container(
//         height: 200.h,
//         color: Colors.grey.shade400,
//         child: Center(
//             child: widget.imagepath == null
//                 ? Icon(
//                     Icons.add_a_photo,
//                     size: 50,
//                     color: Colors.grey.shade800,
//                   )
//                 : Image.file(
//                     File(widget.imagepath ?? ''),
//                     fit: BoxFit.fill,
//                   )),
//       ),
//     );
//   }

//   final ImagePicker imagePicker = ImagePicker();
//   Future pickImage() async {
//     XFile? image = await pickImageFromGallery();
//     XFile? cameraImage = await pickImageByCam();
//     setState(() {
//       // pickedImage = File(image!.path);
//       imagePath = cameraImage!.path;
//     });
//   }

//   Future<XFile?> pickImageFromGallery() async {
//     var image = await imagePicker.pickImage(source: ImageSource.gallery);
//     return image;
//   }

//   Future<XFile?> pickImageByCam() async {
//     var cameraImage = await imagePicker.pickImage(source: ImageSource.camera);
//     return cameraImage;
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/view_model/picked_image/picked_image_cubit.dart';

class UserRecipeImage extends StatelessWidget {
  const UserRecipeImage({super.key});
  @override
  Widget build(BuildContext context) {
    var pickedImage = BlocProvider.of<PickedImageCubit>(context).pickedImage;
    return GestureDetector(
      onTap: () => BlocProvider.of<PickedImageCubit>(context).getImage(),
      child: Container(
        height: 200.h,
        width: double.infinity,
        color: Colors.grey.shade400,
        child: pickedImage == null
            ? Icon(Icons.add_a_photo, size: 50, color: Colors.grey[800])
            : Image.file(pickedImage,fit: BoxFit.cover, ),
      ),
    );
  }
}
