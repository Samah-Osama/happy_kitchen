import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_kitchen/core/functions/snack_bar.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/view_model/add_recipe_cubit/add_recipe_cubit.dart';
import 'package:happy_kitchen/features/my_own_recipes/presentation/views/widgets/add_recipe_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class AddRecipeView extends StatefulWidget {
  const AddRecipeView({super.key});
  static String id = 'AddRecipeView';

  @override
  State<AddRecipeView> createState() => _AddRecipeViewState();
}

class _AddRecipeViewState extends State<AddRecipeView> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddRecipeCubit(),
      child: BlocConsumer<AddRecipeCubit, AddRecipeState>(
        listener: (context, state) {
           if (state is AddRecipeLoading) {
                    isLoading = true;
                  } else if (state is AddRecipeSuccess) {
                    isLoading = false;
                    showSnackBar(context, 'Recipe added successfully');
                  } else if (state is AddRecipeFailure) {
                    isLoading = false;
                    showSnackBar(context, state.errorMessage);
                    print(state.errorMessage);
                  }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: isLoading,
            child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("Add a Recipe"),
                foregroundColor: ThemeColorHelper.getPrimaryColor(context),
              ),
              body: const AddRecipeViewBody(),
            ),
          );
        },
      ),
    );
  }
}
