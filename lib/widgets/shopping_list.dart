import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/screens/functions/edit_shopping_screen.dart';
import 'package:recipe_meal_planner/screens/functions/view_recipe_screen.dart';
import 'package:recipe_meal_planner/screens/functions/view_shopping_screen.dart';

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
                      Text('  ${shoppingList[index].id}     ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                      ),

                      Expanded(
                        child: Text(
                          shoppingList[index].shoppingTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange
                          ),
                          onPressed: () async
                          {
                            if(context.mounted)
                            {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ViewShoppingScreen(
                                      shopping: shoppingList[index],
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
            confirmDismiss: (direction) async
            {
              if(direction == DismissDirection.startToEnd)
              {
                Navigator.push(
                  context,
                    MaterialPageRoute(
                      builder: (context) => EditShoppingScreen(
                      shopping: shoppingList[index],
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
                dbOperations.deleteS(shoppingList[index].id);
              }
            },
          );
        },
      ),
    );
  }
}
