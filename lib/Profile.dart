import 'package:flutter/material.dart';

import 'package:happy_kitchen/constant.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: AppBar(
        title: const Text(
          'Profil Utilisateur',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.w800,
            color: kLightFontColor,
          ),
        ),
        backgroundColor: kDarkColor,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Photo de profil et nom
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: kPrimaryColorDarkMode,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  height: 100.0,
                  width: 100.0,
                  child: ClipOval(
                    child: Image.asset(
                      'assets/images/profile.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Nom de l\'Utilisateur',
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                    color: kLightFontColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40.0),
            // Boutons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kPrimaryColorDarkMode,
                      minimumSize: const Size(double.infinity, 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      // Action pour ajouter une recette
                    },
                    child: const Text(
                      'Add a Recipe !',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kSecondaryColorD,
                      minimumSize: const Size(double.infinity, 40.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                    ),
                    onPressed: () {
                      // Action pour faire des achats
                    },
                    child: const Text(
                      'wana shop !',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
