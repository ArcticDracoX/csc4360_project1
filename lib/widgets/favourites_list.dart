import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/screens/view_recipe_screen.dart';

class FavouritesList extends StatelessWidget
{
  final List<Favourites> favourites;
  final DatabaseOperations dbOperations = DatabaseOperations();

  FavouritesList(
    this.favourites,
    {super.key}
  );

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: favourites.length,
        itemBuilder: (BuildContext context, int index)
        {
          return Dismissible(
            key: Key('${favourites[index].id}'),
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
                      Text('${favourites[index].id}'),

                      Text(favourites[index].recipeTitle),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange
                          ),
                          onPressed: () async
                          {
                            List<Recipe> recipes = await dbOperations.queryAllRowsR();
                            if(context.mounted)
                            {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViewRecipeScreen(
                                    recipe: recipes[favourites[index].recipeKey],
                                  ),
                                ),
                              );
                            }
                          },
                          child: const Icon(Icons.remove_red_eye, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onDismissed: (direction)
            {
              dbOperations.deleteF(favourites[index].id);
            },
          );
        },
      ),
    );
  }
}
