import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:happy_kitchen/core/utils/service_locator.dart';
import 'package:happy_kitchen/core/utils/styles.dart';
import 'package:happy_kitchen/features/kitchens/data/repos/kitchen_type_repo_impel.dart';
import 'package:happy_kitchen/features/kitchens/presentation/view/widgets/all_kitchens_body.dart';
import 'package:happy_kitchen/features/kitchens/presentation/view_model/kitchen_type_cubit/kitchens_type_cubit.dart';

class AllKitchensView extends StatelessWidget {
  const AllKitchensView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KitchensTypeCubit(getIt.get<KitchenTypeRepoImpel>())
        ..getAllKitchens(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'Kitchens',
            style: Styles.textStyle22,
          ),
          centerTitle: true,
        ),
        body: const AllKitchensBody(),
      ),
    );
  }
}
