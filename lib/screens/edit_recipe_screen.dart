import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';

class EditRecipeScreen extends StatefulWidget
{
  final Recipe recipe;

  const EditRecipeScreen(
  {
    super.key, 
    required this.recipe
  });

  @override
  State<EditRecipeScreen> createState() => EditRecipeScreenState();
}

class EditRecipeScreenState extends State<EditRecipeScreen>
{
  DatabaseOperations dbOperations = DatabaseOperations();

  final titleControl = TextEditingController();
  final descriptionControl = TextEditingController();
  final ingredientsControl = TextEditingController();
  final stepsControl = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    titleControl.text = widget.recipe.title;
    descriptionControl.text = widget.recipe.description;
    ingredientsControl.text = widget.recipe.ingredients;
    stepsControl.text = widget.recipe.steps;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Recipe'),
        leading: GestureDetector(
          onTap: ()
          {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
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

              Row(
                children:
                [
                  ElevatedButton(
                    onPressed: ()
                    {
                      if(dbOperations.searchF(keyword))
                    },
                    child: const Icon(Icons.star, color: Colors.yellow,))
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade300,
        child: const Icon(Icons.check),
        onPressed: ()
        {
          widget.recipe.title = titleControl.text;
          widget.recipe.description = descriptionControl.text;
          widget.recipe.ingredients = ingredientsControl.text;
          widget.recipe.steps = stepsControl.text;

          dbOperations.updateR(widget.recipe);

          if(context.mounted)
          {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
