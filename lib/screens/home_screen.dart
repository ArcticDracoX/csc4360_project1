import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search for recipes...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('Recipe Categories', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            _buildCategorySection(),
            SizedBox(height: 20),
            Text('Recommended Recipes', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            _buildRecommendedRecipes(),
            SizedBox(height: 20),
            Text('Popular Recipes', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            _buildPopularRecipes(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Meal Planner'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shopping List'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildCategorySection() {
    final categories = ['Courses', 'Cuisines', 'Diets', 'Dishes'];
    final colors = [Colors.redAccent, Colors.blueAccent, Colors.greenAccent, Colors.orangeAccent];
    final images = [
      'assets/images/courses.jpg',
      'assets/images/cuisines.jpg',
      'assets/images/diets.jpg',
      'assets/images/dishes.jpg',
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return GestureDetector(
            onTap: () {
              // Add navigation to category details here
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              color: colors[index],
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(images[index], width: 120, height: 120, fit: BoxFit.cover),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(categories[index], style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildRecommendedRecipes() {
    final recipes = [
      {'name': 'Garlic Tofu Skillet', 'image': 'assets/images/recipe1.jpg'},
      {'name': 'Strawberry Smoothie', 'image': 'assets/images/recipe2.jpg'},
      {'name': 'Classic Lasagna', 'image': 'assets/images/recipe3.jpg'},
      {'name': 'Caesar Salad', 'image': 'assets/images/recipe4.jpg'},
      {'name': 'Pancakes', 'image': 'assets/images/recipe5.jpg'},
    ];

    return Column(
      children: recipes.map((recipe) {
        return GestureDetector(
          onTap: () {
            // Add navigation to recipe details here
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image.asset(recipe['image']!, width: double.infinity, height: 200, fit: BoxFit.cover),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(recipe['name']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPopularRecipes() {
    final recipes = [
      {'name': 'Spaghetti Carbonara', 'image': 'assets/images/recipe6.jpg'},
      {'name': 'Chicken Curry', 'image': 'assets/images/recipe7.jpg'},
      {'name': 'Avocado Toast', 'image': 'assets/images/recipe8.jpg'},
      {'name': 'Chocolate Cake', 'image': 'assets/images/recipe9.jpg'},
      {'name': 'Beef Tacos', 'image': 'assets/images/recipe10.jpg'},
    ];

    return Column(
      children: recipes.map((recipe) {
        return GestureDetector(
          onTap: () {
            // Add navigation to recipe details here
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(left: Radius.circular(15.0)),
                  child: Image.asset(recipe['image']!, width: 100, height: 100, fit: BoxFit.cover),
                ),
                SizedBox(width: 10),
                Text(recipe['name']!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
