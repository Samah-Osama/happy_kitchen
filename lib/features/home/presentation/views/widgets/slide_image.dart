import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SlideImage extends StatelessWidget {
  const SlideImage({super.key, required this.image});
  @override
  final ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.r),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(fit: BoxFit.fill, image: image)),
      ),
    );
  }
}
