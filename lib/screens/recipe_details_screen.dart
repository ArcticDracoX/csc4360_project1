import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';

class RecipeDetailScreen extends StatelessWidget {
  final Recipe recipe;
  final DatabaseOperations dbOperations = DatabaseOperations();

  RecipeDetailScreen(
  {
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children:
        [
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.3),
            ),
          ),

          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      recipe.title,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border,
                          color: Colors.white, size: 30),
                      onPressed: onFavoriteToggle, // Favorite toggle callback
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Ingredients',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade200,
                  ),
                ),
                const SizedBox(height: 8),
                ...ingredients.fromMap(
                  (item) => Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        const Icon(Icons.check, color: Colors.white, size: 20),
                        const SizedBox(width: 8),
                        Text(item,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Instructions',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade200,
                  ),
                ),
                const SizedBox(height: 8),
                ...instructions.map(
                  (step) => Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      step,
                      style: const TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
