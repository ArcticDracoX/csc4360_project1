import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/screens/view_recipe_screen.dart';

class ShoppingListWidget extends StatelessWidget
{
  final List<ShoppingList> shoppingList;
  final DatabaseOperations dbOperations = DatabaseOperations();

  ShoppingListWidget(
    this.shoppingList,
    {super.key}
  );

  @override
  Widget build(BuildContext context)
  {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: shoppingList.length,
        itemBuilder: (BuildContext context, int index)
        {
          return Dismissible(
            key: Key('${shoppingList[index].id}'),
            direction: DismissDirection.endToStart,
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
                      // style: TextStyle(
                      //   color: Colors.white,
                      //   fontWeight: FontWeight.w700,
                      // ),
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
                      Text('${shoppingList[index].id}'),

                      Text(shoppingList[index].ingredientsName),
                      
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
                                    recipe: recipes[shoppingList[index].ingredientsKey],
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
              dbOperations.deleteS(shoppingList[index].id);
            },
          );
        },
      ),
    );
  }
}
