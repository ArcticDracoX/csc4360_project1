import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/screens/add_recipe_screen.dart';
import 'package:recipe_meal_planner/widgets/recipe_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  DatabaseOperations dbOperations = DatabaseOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe List'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FutureBuilder(
                future: dbOperations.queryAllRowsR(),
                builder: (context, snapshot)
                {
                  // if(snapshot.hasError)
                  // {
                  //   return const Center(
                  //     child: Text('Error'),
                  //   );
                  // }
                  var data = snapshot.data;
                  return snapshot.hasData ? RecipeList(data!) : const Center(child: Text('You have no recipes.'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: ()
        {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const AddRecipeScreen()
            ),
          );
        },
      ),
    );
  }
}
