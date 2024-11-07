import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';

class EditShoppingScreen extends StatefulWidget
{
  final ShoppingList shopping;

  const EditShoppingScreen(
  {
    super.key, 
    required this.shopping,
  });

  @override
  State<EditShoppingScreen> createState() => EditShoppingScreenState();
}

class EditShoppingScreenState extends State<EditShoppingScreen>
{
  DatabaseOperations dbOperations = DatabaseOperations();

  final titleControl = TextEditingController();
  final ingredientsControl = TextEditingController();

  @override
  Widget build(BuildContext context)
  {
    titleControl.text = widget.shopping.shoppingTitle;
    ingredientsControl.text = widget.shopping.shoppingIngredients;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Shopping List',
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
        onPressed: ()
        {
          widget.shopping.shoppingTitle = titleControl.text;
          widget.shopping.shoppingIngredients = ingredientsControl.text;

          dbOperations.updateS(widget.shopping);

          if(context.mounted)
          {
            Navigator.of(context).pop();
          }
        },
      ),
    );
  }
}
