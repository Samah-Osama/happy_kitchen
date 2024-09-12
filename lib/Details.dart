import 'package:flutter/material.dart';

import 'package:happy_kitchen/constant.dart';

class DetailsScreen extends StatefulWidget {
  final int index;
  final String image, name, time, level;
  const DetailsScreen(this.index, this.image, this.name, this.time, this.level,
      {super.key});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int selectedIndex = 0;
  List tabs = ["Instructions", "Ingredients"];

  @override
  void initState() {
    super.initState();
    print("object");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreyColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 64.0,
                left: 32.0,
                right: 32.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: kLightGreyColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 24.0,
                        color: kDarkGreyFontColor,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => print("Fav"),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: kLightGreyColor,
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: const Icon(
                        Icons.favorite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Hero(
                  tag: "tag${widget.index}",
                  child: Image.asset(
                    widget.image,
                    height: 250.0,
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(top: 28.0),
              padding: const EdgeInsets.symmetric(vertical: 28.0),
              decoration: const BoxDecoration(
                color: kLightGreyColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 4.0,
                    width: 28.0,
                    margin: const EdgeInsets.only(bottom: 32.0),
                    decoration: BoxDecoration(
                      color: kDarkGreyFontColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Text(
                      widget.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 28.0,
                        color: kLightFontColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            "assets/icons/menu.png",
                            height: 24.0,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            "${widget.time} Minute",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: kLightFontColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            "Cooking",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: kDarkGreyFontColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(
                            12,
                            (index) => Container(
                                  height: 2.0,
                                  width: 2.0,
                                  margin: const EdgeInsets.only(bottom: 2),
                                  decoration: BoxDecoration(
                                    color: kDarkGreyFontColor,
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                )),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/icons/menu.png",
                            height: 24.0,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 12.0),
                          const Text(
                            "4.08",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: kLightFontColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            "Rating",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: kDarkGreyFontColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: List.generate(
                            12,
                            (index) => Container(
                                  height: 2.0,
                                  width: 2.0,
                                  margin: const EdgeInsets.only(bottom: 2),
                                  decoration: BoxDecoration(
                                    color: kDarkGreyFontColor,
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                )),
                      ),
                      Column(
                        children: [
                          Image.asset(
                            "assets/icons/menu.png",
                            height: 24.0,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(height: 12.0),
                          Text(
                            "${widget.level} Level",
                            style: const TextStyle(
                              fontSize: 16.0,
                              color: kLightFontColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 4.0),
                          const Text(
                            "Recipe",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: kDarkGreyFontColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 32.0),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 32.0),
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    decoration: BoxDecoration(
                      color: kDarkColor,
                      borderRadius: BorderRadius.circular(36.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        tabs.length,
                        (index) => GestureDetector(
                          onTap: () => setState(() {
                            selectedIndex = index;
                          }),
                          child: Container(
                            height: 48.0,
                            width: 160.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: selectedIndex == index
                                  ? kLightGreyColor
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(28.0),
                            ),
                            child: Text(
                              tabs[index],
                              style: TextStyle(
                                fontSize: 16.0,
                                color: selectedIndex == index
                                    ? kPrimaryColorDarkMode
                                    : kDarkGreyFontColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  selectedIndex == 0
                      ? Container(
                          height: 130.0,
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 16.0,
                          ),
                          decoration: BoxDecoration(
                            color: kDarkColor,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: const Text(
                            "The spoonacular Recipe - Food - Nutrition API gives you to access to thousands of recipes, storebought packaged foods, and chain restaurant menu items. Our food ontology and semantic recipe search engine makes it possible to search for recipes using natural language queries, such as . You can automatically calculate the nutritional information for any recipe, estimate recipe costs, visualize ingredient lists, find recipes for what's in your fridge, find recipes based on special diets, nutritional requirements, or favorite ingredients, classify recipes into types and cuisines, convert ingredient amounts, or even compute an entire meal plan. With our powerful API, you can create many kinds of food and nutrition apps. Special diets/dietary requirements currently available include: vegan, vegetarian, pescetarian, gluten free, grain free, dairy free, high protein, low sodium, low carb, Paleo, Primal, ketogenic, and more.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: kDarkGreyFontColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : Container(
                          height: 130.0,
                          margin: const EdgeInsets.symmetric(horizontal: 16.0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 16.0,
                          ),
                          decoration: BoxDecoration(
                            color: kDarkColor,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          //    child: Column(
                          //
                          child: const Text(
                            "The Nutrition API gives you to access to thousands of recipes, storebought packaged foods, and chain restaurant menu items. Our food ontology and semantic recipe search engine makes it possible to search for recipes using natural language queries, such as . You can automatically calculate the nutritional information for any recipe, estimate recipe costs, visualize ingredient lists, find recipes for what's in your fridge, find recipes based on special diets, nutritional requirements, or favorite ingredients, classify recipes into types and cuisines, convert ingredient amounts, or even compute an entire meal plan. With our powerful API, you can create many kinds of food and nutrition apps. Special diets/dietary requirements currently available include: vegan, vegetarian, pescetarian, gluten free, grain free, dairy free, high protein, low sodium, low carb, Paleo, Primal, ketogenic, and more.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: kDarkGreyFontColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          //
                        ),
                  //  ),
                  const SizedBox(height: 24.0),
                  GestureDetector(
                    onTap: () => print("show more"),
                    child: const Column(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up,
                          size: 28.0,
                          color: kDarkGreyFontColor,
                        ),
                        Text(
                          "Show More",
                          style: TextStyle(
                            fontSize: 14.0,
                            color: kDarkGreyFontColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
