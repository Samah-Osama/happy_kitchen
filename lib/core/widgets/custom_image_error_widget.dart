import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomImageErrorWidget extends StatelessWidget {
  const CustomImageErrorWidget({
    super.key,
    required this.hight,
    required this.width,
  });
  final double hight, width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight.h,
      width: width.w,
      decoration: const BoxDecoration(
        color: Colors.amber,
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.fill,
          image: CachedNetworkImageProvider(
              'https://demofree.sirv.com/nope-not-here.jpg'),
        ),
      ),
    );
  }
}
