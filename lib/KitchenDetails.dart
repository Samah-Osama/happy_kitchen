import 'package:flutter/material.dart';
import 'package:happy_kitchen/Constant.dart';
import 'package:happy_kitchen/Details.dart';

class KitchenDetailsScreen extends StatefulWidget {
  final int index;
  final String image, name;
  const KitchenDetailsScreen(this.index, this.image, this.name, {super.key});

  @override
  _KitchenDetailsScreenState createState() => _KitchenDetailsScreenState();
}

class _KitchenDetailsScreenState extends State<KitchenDetailsScreen> {
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
    }
  ];

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
            const Padding(
              padding: EdgeInsets.only(
                top: 64.0,
                bottom: 0.0,
                left: 32.0,
                right: 32.0,
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
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      bottom: 16.0,
                    ),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                              margin: const EdgeInsets.only(
                                                  bottom: 2),
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
            )
          ],
        ),
      ),
    );
  }
}
