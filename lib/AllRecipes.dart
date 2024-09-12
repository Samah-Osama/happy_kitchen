import 'package:flutter/material.dart';

import 'package:happy_kitchen/Details.dart';
import 'package:happy_kitchen/constant.dart';

class AllRecipesScreen extends StatefulWidget {
  const AllRecipesScreen({super.key});

  @override
  _AllRecipesScreenState createState() => _AllRecipesScreenState();
}

class _AllRecipesScreenState extends State<AllRecipesScreen> {
  int selectedIndex = 0;
  int currentIndex = 0;
  int currentPage = 0;

  List categoryList = [
    {"image": "assets/images/women.png", "name": "All"},
    {"image": "assets/images/women.png", "name": "Breakfast"},
    {"image": "assets/images/women.png", "name": "Lunch"},
    {"image": "assets/images/women.png", "name": "Snacks"},
    {"image": "assets/images/women.png", "name": "Dinner"},
    {"image": "assets/images/women.png", "name": "Cookies"},
    {"image": "assets/images/women.png", "name": "Waffels"},
    {"image": "assets/images/women.png", "name": "PainCake"}
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
      "name": "Garlick shrimp spaghetti",
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
      "name": "Garlick shrimp spaghetti",
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreyColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Let's find something to cook",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: kLightFontColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
                height:
                    20), // Espace supplémentaire entre le bouton et la liste
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
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
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
                                          : kDarkGreyFontColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12.0),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        margin:
                                            const EdgeInsets.only(bottom: 2),
                                        decoration: BoxDecoration(
                                          color: kDarkGreyFontColor,
                                          borderRadius:
                                              BorderRadius.circular(2.0),
                                        ),
                                      ),
                                    ),
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
      ),
    );
  }
}
