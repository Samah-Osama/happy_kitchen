import 'package:flutter/material.dart';
import 'package:happy_kitchen/features/favorite/presentation/views/widgets/favorite_view_body.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: FavoritesViewBody(),
    );
  }
}
