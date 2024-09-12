import 'package:flutter/material.dart';
import 'package:happy_kitchen/AllRecipes.dart';
import 'package:happy_kitchen/Details.dart';
import 'package:happy_kitchen/constant.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  int currentPage = 0;

  List<String> carouselImages = [
    "assets/images/banner1.jpg",
    "assets/images/banner2.jpg",
    "assets/images/banner3.jpg",
  ];

  List categoryList = [
    {"image": "assets/images/women.png", "name": "Breakfast"},
    {"image": "assets/images/women.png", "name": "Lunch"},
    {"image": "assets/images/women.png", "name": "Snacks"},
    {"image": "assets/images/women.png", "name": "Dinner"}
  ];
  List dinnerList = [
    {
      "image": "assets/images/dish.png",
      "name": "Dinner",
      "category": "Dinner",
      "time": "60",
      "level": "Hard",
    },
    {
      "image": "assets/images/dish.png",
      "name": "Dinner",
      "category": "Lunch",
      "time": "40",
      "level": "Easy",
    },
    {
      "image": "assets/images/dish.png",
      "name": "Garlick shrim spagetti",
      "category": "Lunch",
      "time": "30",
      "level": "Hard",
    },
    {
      "image": "assets/images/dish.png",
      "name": "Dinner",
      "category": "Lunch",
      "time": "20",
      "level": "Easy",
    },
    {
      "image": "assets/images/dish.png",
      "name": "Dinner",
      "category": "Dinner",
      "time": "40",
      "level": "Easy",
    },
    {
      "image": "assets/images/dish.png",
      "name": "Garlick shrim spagetti",
      "category": "Breakfast",
      "time": "30",
      "level": "Hard",
    },
    {
      "image": "assets/images/dish.png",
      "name": "Dinner",
      "category": "Snacks",
      "time": "20",
      "level": "Easy",
    },
    {
      "image": "assets/images/dish.png",
      "name": "Dinner",
      "category": "Breakfast",
      "time": "40",
      "level": "Easy",
    }
  ];
  @override
  void initState() {
    super.initState();
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 64.0,
              bottom: 32.0,
              left: 32.0,
              right: 32.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Hi Samah",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w800,
                          color: kLightFontColor,
                        ),
                      ),
                      TextSpan(
                        text: "\nReady to cook for dinner ?",
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w700,
                          color: kLightFontColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColorDarkMode,
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  height: 50.0, // Limiter la hauteur de l'image
                  width: 50.0,
                  child: Image.asset(
                      "assets/images/women.png"), // Limiter la largeur de l'image
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 6.0,
                color: kLightGreyColor,
              ),
              borderRadius: BorderRadius.circular(26.0),
            ),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(26.0),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      SizedBox(
                        height: 200.0, // Définir une hauteur fixe
                        child: PageView.builder(
                          itemCount: carouselImages.length,
                          onPageChanged: (index) {
                            setState(() {
                              currentPage = index;
                            });
                          },
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => DetailsScreen(
                                      index,
                                      carouselImages[index],
                                      "Detail of image $index",
                                      "30", // Exemple de temps pour chaque image
                                      "Medium",
                                    ),
                                  ),
                                );
                              },
                              child: Image.asset(
                                carouselImages[index],
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          carouselImages.length,
                          (index) => Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 4.0,
                              vertical: 16.0,
                            ),
                            width: 12.0,
                            height: 12.0,
                            decoration: BoxDecoration(
                              color: currentPage == index
                                  ? kPrimaryColorDarkMode
                                  : kDarkGreyColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
/*
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  width: 6.0,
                  color: kLightGreyColor,
                ),
                borderRadius: BorderRadius.circular(26.0),
              ),
              child: Column(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(26.0),
                      child: Image.asset("assets/images/banner.jpg")),
                ],
              ),
            ),

            */
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 32.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Meal Category",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: kLightFontColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const AllRecipesScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: kDarkGreyFontColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //categories widget
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: Row(
                children: List.generate(
                  categoryList.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 24.0),
                    child: GestureDetector(
                        onTap: () => setState(() {
                              currentIndex = index;
                            }),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                          ),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 8.0),
                            decoration: BoxDecoration(
                              color: currentIndex == index
                                  ? kPrimaryColorDarkMode
                                  : kLightGreyColor,
                              borderRadius: BorderRadius.circular(18.0),
                              border: Border.all(
                                width: 4.0,
                                color: currentIndex == index
                                    ? kSecondaryColorD
                                    : kDarkGreyColor,
                              ),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(right: 16.0),
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: currentIndex == index
                                        ? kSecondaryColorD
                                        : kDarkGreyColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  child: Image.asset(
                                    categoryList[index]["image"],
                                    height: 36.0,
                                    width: 36.0,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: Text(
                                    categoryList[index]["name"],
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w800,
                                        color: currentIndex == index
                                            ? kDarkColor
                                            : kDarkGreyFontColor),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              bottom: 16.0,
            ),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 75.0,
                crossAxisSpacing: 0.0,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.only(top: 64.0),
              itemCount: dinnerList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(
                        index,
                        dinnerList[index]["image"],
                        dinnerList[index]["name"],
                        dinnerList[index]["time"],
                        dinnerList[index]["level"],
                      ),
                    ),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 200.0,
                        width: 170.0,
                        padding: const EdgeInsets.only(bottom: 24.0),
                        decoration: BoxDecoration(
                          color: kLightGreyColor,
                          borderRadius: BorderRadius.circular(32.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Text(
                                dinnerList[index]["name"],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: kLightFontColor,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                5,
                                (index) => Image.asset(
                                  "assets/images/sss.png",
                                  height: 16.0,
                                ),
                              ),
                            ),
                            const SizedBox(height: 12.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${dinnerList[index]["time"]} \nMin",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: kLightFontColor,
                                  ),
                                ),
                                Column(
                                  children: List.generate(
                                      6,
                                      (index) => Container(
                                            height: 2.0,
                                            width: 2.0,
                                            margin: const EdgeInsets.only(
                                                bottom: 2),
                                            decoration: BoxDecoration(
                                              color: kDarkGreyFontColor,
                                              borderRadius:
                                                  BorderRadius.circular(2.0),
                                            ),
                                          )),
                                ),
                                Text(
                                  "${dinnerList[index]["level"]}\nLvl",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w400,
                                    color: kLightFontColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: -190.0,
                        bottom: 0.0,
                        left: 50.0,
                        right: 50.0,
                        child: Hero(
                          tag: "tag$index",
                          child: Image.asset(
                            dinnerList[index]["image"],
                            height: 80.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
