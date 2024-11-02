import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/screens/edit_recipe_screen.dart';

class RecipeList extends StatelessWidget
{
  final List<Recipe> recipes;
  final DatabaseOperations dbOperations = DatabaseOperations();

  RecipeList(
    this.recipes,
    {super.key}
  );

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: recipes.length,
        itemBuilder: (BuildContext context, int index)
        {
          return Dismissible(
            key: Key('${recipes[index].id}'),
            child: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(5)),
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>
                    [
                      Text('${recipes[index].id}'),

                      Text(recipes[index].title),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditRecipeScreen(
                                  recipeId: index,
                                ),
                              ),
                            );
                          },
                          child: const Icon(Icons.edit, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onDismissed: (direction)
            {
              dbOperations.deleteR(index);
            },
          );
        },
      ),
    );
  }
}
