import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/widgets/custom_error_widget.dart';
import 'package:happy_kitchen/core/widgets/custom_loading_indicator.dart';
import 'package:happy_kitchen/features/kitchens/presentation/view/widgets/kitchens_type_widget.dart';
import 'package:happy_kitchen/features/kitchens/presentation/view_model/kitchen_type_cubit/kitchens_type_cubit.dart';

class AllKitchensBody extends StatelessWidget {
  const AllKitchensBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<KitchensTypeCubit, KitchensTypeState>(
      builder: (context, state) {
        if (state is KitchensTypeSuccess) {
          return Padding(
            padding: EdgeInsets.only(left: 10.r),
            child: GridView.builder(
                padding: EdgeInsets.only(top: 80.r),
                itemCount: state.kitchens.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.0.r,
                  mainAxisSpacing: 90.0.r,
                ),
                itemBuilder: (context, index) {
                  return KitchensTypeWidget(
                      kitchensModel: state.kitchens[index]);
                }),
          );
        } else if (state is KitchensTypeFailure) {
          return CustomErrorWidget(errorMessage: state.errorMessage);
        }
        return const CustomLoadingIndicator();
      },
    );
  }
}
