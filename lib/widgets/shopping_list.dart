import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';

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

                      Text(shoppingList[index].ingredients),
                      
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          onPressed: () async
                          {
                            await dbOperations.deleteS(shoppingList[index].id);
                          },
                          child: const Icon(Icons.remove, color: Colors.white),
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
