import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/kitchens/presentation/view/widgets/kitchens_type_widget.dart';

class AllKitchensBody extends StatelessWidget {
  const AllKitchensBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.r),
      child: GridView.builder(
          padding: EdgeInsets.only(top: 80.r),
          itemCount: 10,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0.r,
            mainAxisSpacing: 90.0.r,
          ),
          itemBuilder: (context, index) {
            return const KitchensTypeWidget();
          }),
    );
  }
}
