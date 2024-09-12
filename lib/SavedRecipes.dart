import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SavedRecipesScreen extends StatefulWidget {
  const SavedRecipesScreen({super.key});

  @override
  _RecipesScreenState createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<SavedRecipesScreen> {
  List recipes = [];

  @override
  void initState() {
    super.initState();
    getRecipesFromCache();
  }

  Future<void> getRecipesFromCache() async {
    final box = await Hive.openBox('recipes');
    final savedRecipes = box.get('recipes', defaultValue: <Map>[]).cast<Map>();

    setState(() {
      recipes = savedRecipes;
    });

    print("Recipes loaded: $recipes"); // Débogage
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Categories section
          // You can use a similar horizontal scroll view with categories

          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                mainAxisSpacing: 20.0,
                crossAxisSpacing: 20.0,
              ),
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Handle recipe details screen navigation
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.file(
                          File(recipes[index]['imagePath']),
                          height: 120.0,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons
                                .error); // Gère les erreurs de chargement d'image
                          },
                        ),
                        Text(
                          recipes[index]['title'],
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Add more details like rating, time, etc.
                      ],
                    ),
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
