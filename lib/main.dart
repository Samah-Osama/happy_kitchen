import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/core/utils/service_locator.dart';
import 'package:happy_kitchen/core/utils/services/theme_service/cubit/theme_cubit.dart';
import 'package:happy_kitchen/core/utils/simple_bloc_observer.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/data/my_own_recipe_data/models/add_recipe_model.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/view_model/picked_image/picked_image_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/view_model/user_recipe_cubit/user_recipe_cubit.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/add_recipe_view.dart';
import 'package:happy_kitchen/features/home/data/repos/home_repo_implementation%20.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/all_recipe_cubit/all_recipes_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/recipe_by_category/recipe_by_category_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/dashboard_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/details_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/home_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/all_recipes_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/recipe_by_category_view.dart';
import 'package:happy_kitchen/features/favorite_and_user_recipes/presentation/my_own_recipe_presentation/views/user_recipes_details_view.dart';
import 'package:happy_kitchen/features/on_board/presentation/views/on_board_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarBrightness: Brightness.light,
  //     statusBarColor: Colors.transparent,
  //   ),
  // );
  await Hive.initFlutter();
  Hive.registerAdapter(AddRecipeModelAdapter());
  await Hive.openBox<AddRecipeModel>(kRecipeBox);
  Bloc.observer = SimpleBlocObserver();
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(357, 812),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(
            create: (context) => AllRecipesCubit(
              getIt.get<HomeRepoImplementation>(),
            )..getAllRecipes(),
          ),
          BlocProvider(
            create: (context) => RecipeByCategoryCubit(
              getIt.get<HomeRepoImplementation>(),
            ),
          ),
          BlocProvider(
            create: (context) => UserRecipeCubit(),
          ),
          BlocProvider(
            create: (context) => PickedImageCubit(),
            child: Container(),
          )
        ],
        child: BlocBuilder<ThemeCubit, ThemeData>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: state.copyWith(
                  appBarTheme: const AppBarTheme(color: Colors.transparent)),
              // ThemeData(
              //   scaffoldBackgroundColor: kDarkColor,
              //   colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
              //   fontFamily: "Lato",
              //   useMaterial3: true,
              // ),
              routes: {
                HomeView.id: (context) => const HomeView(),
                AllRecipesView.id: (context) => const AllRecipesView(),
                DetailsView.id: (context) => const DetailsView(),
                AddRecipeView.id: (context) => const AddRecipeView(),
                RecipeByCategoryView.id: (context) =>
                    const RecipeByCategoryView(),
                DashBoardView.id: (context) => const DashBoardView(),
                UserRecipesDetailsView.id: (context) =>
                    const UserRecipesDetailsView(),
              },
              home: const OnBoardView(),
            );
          },
        ),
      ),
    );
  }
}
