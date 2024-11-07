import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';


class AddShoppingScreen extends StatefulWidget
{
  const AddShoppingScreen(
  {
    super.key, 
  });

  @override
  State<AddShoppingScreen> createState() => AddShoppingScreenState();
}

class AddShoppingScreenState extends State<AddShoppingScreen>
{
  DatabaseOperations dbOperations = DatabaseOperations();
  late ShoppingList shopping;

  final titleControl = TextEditingController();
  final ingredientsControl = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Shopping List',
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
                  controller: ingredientsControl,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ingredients'
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

          while((await dbOperations.searchByIdS(id)).isNotEmpty)
          {
            id++;
          }

          final shopping = ShoppingList(
            id: id,
            shoppingTitle: titleControl.text,
            shoppingIngredients: ingredientsControl.text,
          );

          dbOperations.insertS(shopping);

          if(context.mounted)
          {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
