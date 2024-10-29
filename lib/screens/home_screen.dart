import 'package:flutter/material.dart';
import 'recipe_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final void Function(Map<String, dynamic>) onFavoriteToggle;

  const HomeScreen({Key? key, required this.onFavoriteToggle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final List<Map<String, dynamic>> recipes = [
      {
        'name': 'Garlic Tofu Skillet',
        'image': 'assets/images/recipe1.jpg',
        'ingredients': ['Tofu', 'Garlic', 'Soy sauce', 'Vegetable oil', 'Green onions'],
        'instructions': [
          'Cut tofu into cubes.',
          'Heat oil in skillet, add garlic, then tofu.',
          'Stir in soy sauce and cook until tofu is golden.',
          'Garnish with green onions and serve.'
        ]
      },
      {
        'name': 'Strawberry Smoothie',
        'image': 'assets/images/straw.jpg',
        'ingredients': ['Strawberries', 'Banana', 'Yogurt', 'Honey', 'Ice cubes'],
        'instructions': [
          'Combine all ingredients in a blender.',
          'Blend until smooth and creamy.',
          'Pour into a glass and serve chilled.'
        ]
      },
      {
        'name': 'Classic Lasagna',
        'image': 'assets/images/lasagna.jpg',
        'ingredients': ['Lasagna noodles', 'Ground beef', 'Tomato sauce', 'Ricotta cheese', 'Mozzarella cheese'],
        'instructions': [
          'Preheat oven to 375°F (190°C).',
          'Layer noodles, sauce, and cheeses in a baking dish.',
          'Repeat layers, ending with mozzarella.',
          'Bake for 45 minutes or until bubbly.'
        ]
      },
      {
        'name': 'Caesar Salad',
        'image': 'assets/images/salad.jpg',
        'ingredients': ['Romaine lettuce', 'Caesar dressing', 'Parmesan cheese', 'Croutons'],
        'instructions': [
          'Chop lettuce and place in a bowl.',
          'Add Caesar dressing and toss to coat.',
          'Top with Parmesan and croutons and serve.'
        ]
      },
      {
        'name': 'Pancakes',
        'image': 'assets/images/pancakes.jpg',
        'ingredients': ['Flour', 'Milk', 'Eggs', 'Sugar', 'Baking powder', 'Butter'],
        'instructions': [
          'Mix all ingredients in a bowl.',
          'Pour batter onto a hot griddle and cook until bubbles form.',
          'Flip and cook until golden brown on both sides.'
        ]
      },
      {
        'name': 'Spaghetti Carbonara',
        'image': 'assets/images/carbonara.jpg',
        'ingredients': ['Spaghetti', 'Eggs', 'Parmesan cheese', 'Bacon', 'Black pepper'],
        'instructions': [
          'Cook spaghetti according to package instructions.',
          'In a bowl, mix eggs, cheese, and pepper.',
          'Add cooked spaghetti to the egg mixture and toss.',
          'Top with crispy bacon and serve.'
        ]
      },
      {
        'name': 'Chicken Curry',
        'image': 'assets/images/curry.jpg',
        'ingredients': ['Chicken breast', 'Coconut milk', 'Curry powder', 'Onion', 'Garlic', 'Ginger'],
        'instructions': [
          'Sauté onion, garlic, and ginger until fragrant.',
          'Add chicken and cook until browned.',
          'Add coconut milk and curry powder and simmer.',
          'Cook until chicken is fully cooked and sauce thickens.'
        ]
      },
      {
        'name': 'Avocado Toast',
        'image': 'assets/images/toast.jpg',
        'ingredients': ['Bread', 'Avocado', 'Salt', 'Pepper', 'Chili flakes'],
        'instructions': [
          'Toast the bread slices.',
          'Mash avocado and spread on toast.',
          'Season with salt, pepper, and chili flakes.'
        ]
      },
      {
        'name': 'Chocolate Cake',
        'image': 'assets/images/cake.jpg',
        'ingredients': ['Flour', 'Sugar', 'Cocoa powder', 'Eggs', 'Butter', 'Vanilla extract'],
        'instructions': [
          'Preheat oven to 350°F (175°C).',
          'Mix all ingredients and pour into a greased pan.',
          'Bake for 30 minutes or until a toothpick comes out clean.'
        ]
      },
      {
        'name': 'Beef Tacos',
        'image': 'assets/images/beef.jpg',
        'ingredients': ['Ground beef', 'Taco seasoning', 'Tortillas', 'Lettuce', 'Cheese', 'Salsa'],
        'instructions': [
          'Cook beef with taco seasoning.',
          'Fill tortillas with beef, lettuce, cheese, and salsa.',
          'Serve and enjoy.'
        ]
      },
    ];

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
                itemBuilder: (context, index) {
                  return _buildRecipeCard(context, recipes[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeCard(BuildContext context, Map<String, dynamic> recipe) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RecipeDetailScreen(
              recipeName: recipe['name'] as String,
              recipeImage: recipe['image'] as String,
              ingredients: recipe['ingredients'] as List<String>,
              instructions: recipe['instructions'] as List<String>,
              onFavoriteToggle: () => onFavoriteToggle(recipe),
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
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.asset(
                recipe['image'] as String,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
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
