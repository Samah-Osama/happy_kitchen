import 'package:flutter/material.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/custom_short_desc_item.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/vertical_circular_widget.dart';

class ShortDesc extends StatelessWidget {
  const ShortDesc({super.key});
  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CustomShortDescItem(text1: '30 Minutes', type: 'Cooking'),
        VerticalCircularWidget(length: 12),
        CustomShortDescItem(text1: '4.08', type: 'Rating'),
        VerticalCircularWidget(length: 12),
        CustomShortDescItem(text1: 'Hard Level', type: 'Level'),
      ],
    );
  }
}
