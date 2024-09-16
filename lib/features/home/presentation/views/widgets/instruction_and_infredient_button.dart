import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/core/utils/theme_color_helper.dart';

class InstructionsAndIngredientButton extends StatefulWidget {
  const InstructionsAndIngredientButton({
    super.key,
  });

  @override
  State<InstructionsAndIngredientButton> createState() =>
      _InstructionsAndIngredientButtonState();
}

class _InstructionsAndIngredientButtonState
    extends State<InstructionsAndIngredientButton> {
  List<String> tabs = ["Instructions", "Ingredients"];
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: List.generate(
            tabs.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  selectedItem = index;
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.only(left: 10.r),
                  height: 45.h,
                  width: 140.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedItem == index
                        ? ThemeColorHelper.getLightGreyAndPink(context)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  child: Text(tabs[index],
                      style: Styles.textStyle18.copyWith(
                          color: selectedItem == index
                              ? ThemeColorHelper.getYellowAndBlack(context)
                              : ThemeColorHelper.getGreyAndWhite(context))),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class CustomInstructionsAndIngredientButton extends StatelessWidget {
  const CustomInstructionsAndIngredientButton({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 10.r),
        height: 45.h,
        width: 140.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: ThemeColorHelper.getLightGreyAndPink(context),
          borderRadius: BorderRadius.circular(28.0),
        ),
        child: Text(text),
      ),
    );
  }
}
