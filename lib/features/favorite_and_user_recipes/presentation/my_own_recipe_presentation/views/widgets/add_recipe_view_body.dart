import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/my_own_recipe_data/models/add_recipe_model.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/view_model/add_recipe_cubit/add_recipe_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/view_model/picked_image/picked_image_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/widgets/user_recipe_Image.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/widgets/custom_text_form_field.dart';

class AddRecipeViewBody extends StatefulWidget {
  const AddRecipeViewBody({super.key});

  @override
  State<AddRecipeViewBody> createState() => _AddRecipeViewBodyState();
}

class _AddRecipeViewBodyState extends State<AddRecipeViewBody> {
  String? title, ingredients, steps;
  double? time;
  // double? rating;
  // File? pickedImage;

//   final imagePicker = ImagePicker();
//  Future pickImage() async {
//     var image = await imagePicker.pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (image != null) {
//         pickedImage = File(image.path);
//       } else {}
//     });
//   }

  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: EdgeInsets.all(18.r),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                labelText: 'Title',
                validatorMessage: 'Please enter a title',
                onChanged: (value) {
                  title = value;
                },
              ),
              SizedBox(height: 15.h),
              const UserRecipeImage(),
              SizedBox(height: 15.h),
              CustomRecipeTimeTextFormField(
                keyboardType: TextInputType.number,
                labelText: "Time (in minutes)",
                validatorMessage: 'Please enter the time',
                onChanged: (value) {
                  time = double.tryParse(value);
                },
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                maxLines: 5,
                labelText: "Ingredients",
                validatorMessage: 'Please enter the ingredients',
                onChanged: (value) {
                  ingredients = value;
                },
              ),
              SizedBox(height: 15.h),
              CustomTextFormField(
                maxLines: 5,
                labelText: "Steps",
                validatorMessage: 'Please enter the steps',
                onChanged: (value) {
                  steps = value;
                },
              ),
              SizedBox(height: 20.r),
              SizedBox(
                width: 100.r,
                height: 50.r,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          ThemeColorHelper.getPrimaryColor(context)),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var recipe = AddRecipeModel(
                          title: title!,
                          image: BlocProvider.of<PickedImageCubit>(context)
                              .pickedImage
                              .toString(),
                          recipeTime: time!.round().toString(),
                          ingredients: ingredients!,
                          steps: steps!);
                      BlocProvider.of<AddRecipeCubit>(context)
                          .addRecipe(recipe);
                    }
                  },
                  child: Text(
                    'Save',
                    style: Styles.textStyle22.copyWith(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
