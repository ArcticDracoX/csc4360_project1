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

  @override
  Widget build(BuildContext context)
  { 
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.title),
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    const Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      widget.recipe.description,
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Ingredients',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),
                    
                    Text(
                      widget.recipe.ingredients,
                      style: const TextStyle(fontSize: 16),
                    ),

                    const SizedBox(height: 16),

                    const Text(
                      'Steps',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),
                    
                    Text(
                      widget.recipe.steps,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
