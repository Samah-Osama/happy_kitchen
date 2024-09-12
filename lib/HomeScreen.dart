import 'package:flutter/material.dart';
import 'package:happy_kitchen/Dashboard.dart';
import 'package:happy_kitchen/Favorits.dart';
import 'package:happy_kitchen/Kitchens.dart';
import 'package:happy_kitchen/Profile.dart';
import 'package:happy_kitchen/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<Widget> _pages = [
    const DashboardScreen(),
    const KitchensScreen(),
    //AllRecipesScreen(),
    const FavoritsScreen(),
    const UserProfileScreen(),
    //SavedRecipesScreen(),
    //AddRecipeScreen(),
  ];

  int currentIndex = 0;
  int currentPage = 0;

  List<String> carouselImages = [
    "assets/images/banner1.jpg",
    "assets/images/banner2.jpg",
    "assets/images/banner3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      bottomNavigationBar: SizedBox(
        height: 80.0,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: kBottomColor.withOpacity(0.1),
          elevation: 0.0,
          selectedItemColor: kPrimaryColorDarkMode,
          unselectedItemColor: kDarkGreyFontColor,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            buildBottomNavigationBarItem("assets/icons/home.png", 0),
            buildBottomNavigationBarItem("assets/icons/kitchen.png", 1),
            buildBottomNavigationBarItem("assets/icons/favorits.png", 2),
            buildBottomNavigationBarItem("assets/icons/add.png", 3),
          ],
        ),
      ),
      body: _pages[selectedIndex],
    );
  }

  BottomNavigationBarItem buildBottomNavigationBarItem(
      String image, int index) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Column(
          children: [
            ImageIcon(
              AssetImage(image),
              size: 26.0,
            ),
            Container(
              height: 8.0,
              width: 8.0,
              margin: const EdgeInsets.only(top: 4.0),
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? kPrimaryColorDarkMode
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
        ),
      ),
      label: "",
    );
  }
}
