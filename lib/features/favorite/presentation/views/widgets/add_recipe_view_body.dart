import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/favorite/presentation/views/widgets/add_recipe_pickImage.dart';
import 'package:happy_kitchen/features/favorite/presentation/views/widgets/custom_text_form_field.dart';

enum Levels { easy, medium, hard }

class AddRecipeViewBody extends StatefulWidget {
  const AddRecipeViewBody({super.key});

  @override
  State<AddRecipeViewBody> createState() => _AddRecipeViewBodyState();
}

class _AddRecipeViewBodyState extends State<AddRecipeViewBody> {
  String? title, time, ingredients, steps;
  double? rating;
  Levels? recipeLevel;
  // File? pickedImage;

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
              const AddRecipeImage(),
              SizedBox(height: 15.h),
              CustomRatingTextFormField(
                keyboardType: TextInputType.number,
                labelText: 'Rating (1-5)',
                validatorMessage: 'Please enter a valid rating',
                onChanged: (value) {
                  rating = double.tryParse(value);
                },
              ),
              CustomRecipeTimeTextFormField(
                keyboardType: TextInputType.number,
                labelText: "Time (in minutes)",
                validatorMessage: 'Please enter the time',
                onChanged: (value) {
                  time = value;
                },
              ),
              DropdownButtonFormField(
                hint: Text(
                  'Choose Level',
                  style: TextStyle(
                      color: ThemeColorHelper.getWhiteAndBlack(context)),
                ),
                items: Levels.values.map((level) {
                  return DropdownMenuItem(
                    // ignore: sort_child_properties_last
                    child: Text(level.toString().split('.').last),
                    value: level,
                  );
                }).toList(),
                onChanged: (value) {
                  recipeLevel = value;
                },
                value: recipeLevel,
                validator: (value) {
                  if (value == null) {
                    return 'Please select a level';
                  }
                  return null;
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
                      Navigator.pop(context);
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
