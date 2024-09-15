import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:happy_kitchen/features/home/presentation/views/widgets/slide_image.dart';

class CustomSlideWidget extends StatelessWidget {
  const CustomSlideWidget({super.key});
  @override
  final List<String> sliderList = const [
    "assets/images/banner1.jpg",
    "assets/images/banner2.jpg",
    "assets/images/banner3.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220.r,
      child: CarouselSlider.builder(
          itemCount: sliderList.length,
          itemBuilder: (context, int, index) {
            return SlideImage(image: AssetImage(sliderList[int]));
          },
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 3 / 1.5,
          )),
    );
  }
}
