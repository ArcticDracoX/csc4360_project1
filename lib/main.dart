import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/favorites_screen.dart';
import 'screens/meal_planner_screen.dart';
import 'screens/shopping_list_screen.dart';

void main() {
  runApp(const RecipeMealPlannerApp());
}

class RecipeMealPlannerApp extends StatelessWidget {
  const RecipeMealPlannerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe and Meal Planner',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Arial',
      ),
      home: const SplashScreen(), 
    );
  }
}

class BottomNavController extends StatefulWidget {
  const BottomNavController({Key? key}) : super(key: key);

  @override
  State<BottomNavController> createState() => BottomNavControllerState();
}

class BottomNavControllerState extends State<BottomNavController> {
  int _currentIndex = 0;

 
  final List<Map<String, dynamic>> favorites = [];

  
  void _toggleFavorite(Map<String, dynamic> recipe) {
    setState(() {
      if (favorites.contains(recipe)) {
        favorites.remove(recipe);
      } else {
        favorites.add(recipe);
      }
    });
  }

  
  List<Widget> _screens() => [
    HomeScreen(onFavoriteToggle: _toggleFavorite), 
    FavoritesScreen(favorites: favorites),        
    MealPlannerScreen(),
    ShoppingListScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _screens()[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index)
        {
          setState(()
          {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: const
        [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Meal Planner'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Shopping List'),
        ],
      ),
    );
  }
}
