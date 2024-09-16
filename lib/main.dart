import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/service_locator.dart';
import 'package:happy_kitchen/core/utils/services/theme_service/cubit/theme_cubit.dart';
import 'package:happy_kitchen/features/favorite/presentation/views/add_recipe_view.dart';
import 'package:happy_kitchen/features/home/data/repos/home_repo_implementation%20.dart';
import 'package:happy_kitchen/features/home/presentation/view_model/all_recipe_cubit/all_recipes_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/details_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/home_view.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/all_recipes.dart';
import 'package:happy_kitchen/features/home/presentation/views/recipe_by_category_view.dart';
import 'package:happy_kitchen/features/on_board/presentation/views/on_board_view.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarBrightness: Brightness.light,
  //     statusBarColor: Colors.transparent,
  //   ),
  // );
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
            ),
          ),
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
                AllRecipes.id: (context) => const AllRecipes(),
                DetailsView.id: (context) => const DetailsView(),
                AddRecipeView.id: (context) => const AddRecipeView(),
                RecipeByCategoryView.id: (context) =>
                    const RecipeByCategoryView(),
              },
              home: const OnBoardView(),
            );
          },
        ),
      ),
    );
  }
}
