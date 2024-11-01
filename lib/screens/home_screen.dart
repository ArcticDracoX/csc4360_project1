import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/screens/recipe_details_screen.dart';

class HomeScreen extends StatelessWidget {
  final void Function(Map<String, dynamic>) onFavoriteToggle;

  const HomeScreen({Key? key, required this.onFavoriteToggle}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    DatabaseOperations dbOperations = DatabaseOperations();
    final List<Recipe> recipes = dbOperations.queryAllRowsF() as List<Recipe>;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFE1F5C4), Color(0xFF1E8F91)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16.0, 60.0, 16.0, 20.0),
              child: Text(
                'Recipes',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Serif', // Optional custom font
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: recipes.length,
                itemBuilder: (context, index)
                {
                  return _buildRecipeCard(context, recipes[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeCard(BuildContext context, Recipe recipe)
  {
    DatabaseOperations dbOperations = DatabaseOperations();
    final List<Recipe> recipes = dbOperations.queryAllRowsF() as List<Recipe>;

    return GestureDetector(
      onTap: ()
      {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(
              recipe: recipes[],
            ),
          ),
        );
      },

      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 8,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Stack(
          children:
          [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    recipe['name'] as String,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
