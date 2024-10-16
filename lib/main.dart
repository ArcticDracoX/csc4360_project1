import 'package:flutter/material.dart';

void main()
{
  runApp(RecipeMealPlannerApp());
}

class RecipeMealPlannerApp extends StatelessWidget 
{
  const RecipeMealPlannerApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Recipe and Meal Planner',
      theme: ThemeData(
        primarySwatch: Colors.pink, // pink color
        fontFamily: 'Arial', // font
      ),
      home: HomePage(), // HomePage 
    );
  }
}

// Home Page Screen
class HomePage extends StatelessWidget
{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent, 
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: Text('View Recipes'),
            ),
            
            SizedBox(height: 20), // spacing

            ElevatedButton(
              onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MealPlanningScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: Text('Meal Planning'),
            ),

            SizedBox(height: 20), 

            ElevatedButton(
              onPressed: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GroceryListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: Text('Grocery List'),
            ),
          ],
        ),
      ),
    );
  }
}

// Recipes Screen
class HomeScreen extends StatelessWidget
{
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipes'),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent, 
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          recipeCard(context, 'Spaghetti Bolognese', Icons.local_pizza, RecipeDetailScreen()),
          recipeCard(context, 'Chicken Curry', Icons.rice_bowl, RecipeDetailScreen()),
          recipeCard(context, 'Vegetarian Salad', Icons.emoji_nature, RecipeDetailScreen()),
        ],
      ),
    );
  }

  // Helper method to create recipe card
  Widget recipeCard(BuildContext context, String title, IconData icon, Widget nextScreen)
  {
    return Card(
      color: Colors.pink[50], 
      child: ListTile(
        leading: Icon(icon, color: Colors.pinkAccent, size: 40),
        title: Text(title, style: TextStyle(fontSize: 20, color: Colors.pink[900])),
        trailing: Icon(Icons.arrow_forward, color: Colors.pinkAccent),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextScreen),
          );
        },
      ),
    );
  }
}

// Recipe Detail Screen UI
class RecipeDetailScreen extends StatelessWidget
{
  const RecipeDetailScreen({super.key});

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe Details'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Spaghetti Bolognese', style: TextStyle(fontSize: 28, color: Colors.pink[900])),
            SizedBox(height: 16),
            Text('Ingredients:', style: TextStyle(fontSize: 20, color: Colors.pink[800])),
            Text('- Spaghetti\n- Ground beef\n- Tomato sauce\n- Garlic\n- Olive oil'),
            SizedBox(height: 16),
            Text('Steps:', style: TextStyle(fontSize: 20, color: Colors.pink[800])),
            Text('1. Boil spaghetti.\n2. Cook beef.\n3. Mix with sauce.'),
            Spacer(),
            ElevatedButton.icon(
              onPressed: ()
              {
                // Save to Favorites action
              },
              icon: Icon(Icons.favorite, color: Colors.white),
              label: Text('Save to Favorites'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent, 
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Meal Planning Screen UI
class MealPlanningScreen extends StatelessWidget
{
  const MealPlanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Planning'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Weekly Meal Plan', style: TextStyle(fontSize: 24, color: Colors.pink[900])),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // need to Add meal functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pinkAccent, 
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              ),
              child: Text('Add Meal', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

// Grocery List Screen UI
class GroceryListScreen extends StatefulWidget
{
  const GroceryListScreen({super.key});

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen>
{
  final List<Map<String, dynamic>> _groceryItems =
  [
    {'name': 'Spaghetti', 'isChecked': false},
    {'name': 'Ground beef', 'isChecked': false},
    {'name': 'Tomato sauce', 'isChecked': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grocery List'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: _groceryItems.map((item) {
          return CheckboxListTile(
            title: Text(item['name'], style: TextStyle(fontSize: 18, color: Colors.pink[900])),
            value: item['isChecked'],
            onChanged: (bool? value) {
              setState(() {
                item['isChecked'] = value!;
              });
            },
            activeColor: Colors.pinkAccent,
            checkColor: Colors.white,
          );
        }).toList(),
      ),
    );
  }
}
