import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';

class ViewRecipeScreen extends StatefulWidget
{
  final Recipe recipe;

  const ViewRecipeScreen(
  {
    super.key, 
    required this.recipe
  });

  @override
  State<ViewRecipeScreen> createState() => VireRecipeScreenState();
}

class VireRecipeScreenState extends State<ViewRecipeScreen>
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
            Navigator.of(context).pop();
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
              // Make all these display the respective text in neat boxes that indicate which is which
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
    );
  }
}
