import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/services/theme_service/cubit/theme_cubit.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_app_bar_text.dart';

class CustomeDashBoardViewAppBar extends StatelessWidget {
  const CustomeDashBoardViewAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 30.r, right: 30.r, top: 64.r, bottom: 30),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomAppBarText(),
          DarkAndLightModeWidget(),
        ],
      ),
    );
  }
}

class DarkAndLightModeWidget extends StatelessWidget {
  const DarkAndLightModeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeData>(
      builder: (context, state) {
        return IconButton(
          onPressed: () {
            BlocProvider.of<ThemeCubit>(context).toggleTheme();
          },
          icon: state == ThemeData.light()
              ? const Icon(Icons.dark_mode, size: 35)
              : const Icon(Icons.light_mode, size: 35),
        );
      },
    );
  }
}
