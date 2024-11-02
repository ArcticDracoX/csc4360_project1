import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';

class FavouritesScreen extends StatefulWidget
{
  const FavouritesScreen(
  {
    super.key,
  });

  @override
  State<FavouritesScreen> createState() => FavouritesScreenState();
}

class FavouritesScreenState extends State<FavouritesScreen>
{ 
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFD1DC), Color(0xFFE64C4C)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: favorites.isEmpty
        ? const Center(child: Text('No favorite recipes yet!'))
        : ListView.builder(
          itemCount: favorites.length,
          itemBuilder: (context, index)
          {
            final recipe = favorites[index];
            return Card(
              child: ListTile(
                title: Text(recipe.recipeTitle),
              ),
            );
          },
        ),
      ),
    );
  }
}
