import 'package:flutter/material.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/kitchens/presentation/view/widgets/all_kitchens_body.dart';

class AllKitchensView extends StatelessWidget {
  const AllKitchensView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Kitchens',
          style: Styles.textStyle22,
        ),
        centerTitle: true,
      ),
      body: const AllKitchensBody(),
    );
  }
}
