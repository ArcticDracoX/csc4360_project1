import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/screens/add_recipe_screen.dart';
import 'package:recipe_meal_planner/widgets/shopping_list.dart';

class ShoppingListScreen extends StatefulWidget {
  const ShoppingListScreen({super.key});

  @override
  State<ShoppingListScreen> createState() => ShoppingListScreenState();
}

class ShoppingListScreenState extends State<ShoppingListScreen> {
  DatabaseOperations dbOperations = DatabaseOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping List'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FutureBuilder(
                future: dbOperations.queryAllRowsS(),
                builder: (context, snapshot)
                {
                  if(snapshot.hasError)
                  {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  var data = snapshot.data;
                  return snapshot.hasData ? ShoppingListWidget(data!) : const Center(child: Text('You have no recipes.'),
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
