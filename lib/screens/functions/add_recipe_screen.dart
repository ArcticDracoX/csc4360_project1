import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';


class AddRecipeScreen extends StatefulWidget
{
  const AddRecipeScreen(
  {
    super.key, 
  });

  @override
  State<AddRecipeScreen> createState() => AddRecipeScreenState();
}

class AddRecipeScreenState extends State<AddRecipeScreen>
{
  DatabaseOperations dbOperations = DatabaseOperations();
  late Recipe recipe;

  final titleControl = TextEditingController();
  final descriptionControl = TextEditingController();
  final ingredientsControl = TextEditingController();
  final stepsControl = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Recipe',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.blue, 
        leading: GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: titleControl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Title'
                  ),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  maxLines: null,
                  controller: descriptionControl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Description'
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  maxLines: null,
                  controller: ingredientsControl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingredients'
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  maxLines: null,
                  controller: stepsControl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Steps'
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade300,
        child: const Icon(Icons.check),
        onPressed: () async
        {
          int id = 1;

          while((await dbOperations.searchByIdR(id)).isNotEmpty)
          {
            id++;
          }

          final recipe = Recipe(
            id: id,
            title: titleControl.text,
            description: descriptionControl.text,
            ingredients: ingredientsControl.text,
            steps: stepsControl.text
          );

          dbOperations.insertR(recipe);

          if(context.mounted)
          {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
