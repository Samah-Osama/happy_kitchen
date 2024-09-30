import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_actions_widget.dart';

class CustomDetailsPageAppBar extends StatelessWidget {
  const CustomDetailsPageAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(left: 25.r, right: 25.r, top: 60.r, bottom: 20.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomActionsWidget(
            onTap: () {
              
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              size: 24.0,
            ),
          ),
          CustomActionsWidget(
            onTap: () {
              
            },
            child: const Icon(
              Icons.favorite,
              size: 24.0,
            ),
          ),
        ],
      ),
    );
  }
}
