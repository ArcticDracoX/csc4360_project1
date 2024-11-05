import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/screens/edit_recipe_screen.dart';
import 'package:recipe_meal_planner/screens/view_recipe_screen.dart';

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
            direction: DismissDirection.horizontal,
            background: Container(
              color: Colors.green,
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 20,
                    ),

                    Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),

                    Text(
                      " Edit",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                      
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),

            secondaryBackground: Container(
              color: Colors.red,
              child: const Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>
                  [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    
                    Text(
                      " Delete",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.right,
                    ),

                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              ),
            ),
            
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
                      Text('  ${recipes[index].id}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                      ),

                      Text(recipes[index].title,
                        style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>
                          [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange
                              ),
                              onPressed: ()
                              {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewRecipeScreen(
                                      recipe: recipes[index],
                                    ),
                                  ),
                                );
                              },
                              child: const Icon(Icons.remove_red_eye, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            confirmDismiss: (direction) async
            {
              if(direction == DismissDirection.startToEnd)
              {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => EditRecipeScreen(
                      recipe: recipes[index],
                    ),
                  ),
                );
                return false;
              }
              return true;
            },
            onDismissed: (direction)
            {
              if(direction == DismissDirection.endToStart)
              {
                dbOperations.deleteR(recipes[index].id);
              }
            },
          );
        },
      ),
    );
  }
}
