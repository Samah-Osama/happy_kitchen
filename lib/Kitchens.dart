import 'package:flutter/material.dart';
import 'package:happy_kitchen/Constant.dart';
import 'package:happy_kitchen/KitchenDetails.dart';

class KitchensScreen extends StatefulWidget {
  const KitchensScreen({super.key});

  @override
  _KitchensScreenState createState() => _KitchensScreenState();
}

class _KitchensScreenState extends State<KitchensScreen> {
  List<Map<String, String>> dinnerList = [
    {
      "image": "assets/images/women.png",
      "name": "Français",
      "time": "30",
      "level": "Facile"
    },
    {
      "image": "assets/images/women.png",
      "name": "Thaï",
      "time": "45",
      "level": "Moyen"
    },
    {
      "image": "assets/images/women.png",
      "name": "Marocain",
      "time": "60",
      "level": "Difficile"
    },
    {
      "image": "assets/images/women.png",
      "name": "Turc",
      "time": "35",
      "level": "Facile"
    },
    {
      "image": "assets/images/women.png",
      "name": "Mexicain",
      "time": "50",
      "level": "Moyen"
    },
    {
      "image": "assets/images/women.png",
      "name": "Syrien",
      "time": "40",
      "level": "Facile"
    },
    {
      "image": "assets/images/women.png",
      "name": "Japonais",
      "time": "55",
      "level": "Difficile"
    },
    {
      "image": "assets/images/women.png",
      "name": "Chinois",
      "time": "65",
      "level": "Difficile"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreyColor,
      appBar: AppBar(
        automaticallyImplyLeading: false, // Enlève la flèche de retour
        title: const Text(
          'Kitchen',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            color: kLightFontColor,
          ),
        ),
        centerTitle: true, // Centre le titre
        backgroundColor: kDarkGreyColor,
        elevation: 0, // Enlève l'ombre sous l'app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 75.0,
            crossAxisSpacing: 0.0,
          ),
          shrinkWrap:
              false, // Permet au GridView de prendre tout l'espace disponible
          physics: const BouncingScrollPhysics(), // Permet le défilement
          padding: const EdgeInsets.only(top: 64.0),
          itemCount: dinnerList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => KitchenDetailsScreen(
                    index,
                    dinnerList[index]["image"]!,
                    dinnerList[index]["name"]!,
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
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Text(
                            dinnerList[index]["name"]!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                              color: kLightFontColor,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12.0),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -120.0,
                    bottom: 0.0,
                    left: 50.0,
                    right: 50.0,
                    child: Hero(
                      tag: "tag$index",
                      child: Image.asset(
                        dinnerList[index]["image"]!,
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
    );
  }
}
