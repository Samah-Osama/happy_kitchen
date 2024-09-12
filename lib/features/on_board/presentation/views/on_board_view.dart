import 'package:flutter/material.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:happy_kitchen/features/on_board/presentation/views/widgets/on_board_view_body.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kPrimaryColorDarkMode,
      body: OnBoardViewBody(),
    );
  }
}
