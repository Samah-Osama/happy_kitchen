import 'package:flutter/material.dart';
import 'package:happy_kitchen/constant.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

enum Level { easy, medium, hard }

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({super.key});

  @override
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  File? imageFile;
  double rating = 0.0;
  String time = '';
  Level? level = Level.easy;
  String ingredients = '';
  String steps = '';

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        imageFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkGreyColor,
      appBar: AppBar(
        title: const Text("Add a Recipe"),
        foregroundColor: kPrimaryColorDarkMode,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false, // Remove back icon
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Title"),
                  onChanged: (value) {
                    setState(() {
                      title = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: _pickImage,
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: imageFile == null
                        ? Icon(Icons.add_a_photo,
                            size: 50, color: Colors.grey[800])
                        : Image.file(imageFile!, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Rating (1-5)"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      rating = double.tryParse(value) ?? 0.0;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty || double.tryParse(value) == null) {
                      return 'Please enter a valid rating';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration:
                      const InputDecoration(labelText: "Time (in minutes)"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      time = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the time';
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<Level>(
                  decoration: const InputDecoration(labelText: "Level"),
                  value: level,
                  onChanged: (Level? newValue) {
                    setState(() {
                      level = newValue;
                    });
                  },
                  items: Level.values.map((Level lvl) {
                    return DropdownMenuItem<Level>(
                      value: lvl,
                      child: Text(lvl.toString().split('.').last),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'Please select a level';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Ingredients"),
                  maxLines: 5,
                  onChanged: (value) {
                    setState(() {
                      ingredients = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the ingredients';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(labelText: "Steps"),
                  maxLines: 5,
                  onChanged: (value) {
                    setState(() {
                      steps = value;
                    });
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the steps';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final box = await Hive.openBox('recipes');
                      final recipes =
                          box.get('recipes', defaultValue: <Map>[]).cast<Map>();

                      recipes.add({
                        'title': title,
                        'imagePath': imageFile?.path ?? '',
                        'rating': rating,
                        'time': time,
                        'level': level.toString(),
                        'ingredients': ingredients,
                        'steps': steps,
                      });

                      await box.put('recipes', recipes);

                      print("Recipe saved: $recipes"); // Débogage

                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Recipe saved!')));
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
