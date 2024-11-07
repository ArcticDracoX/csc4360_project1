import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';

class ViewShoppingScreen extends StatefulWidget
{
  final ShoppingList shopping;

  const ViewShoppingScreen(
  {
    super.key, 
    required this.shopping,
  });

  @override
  State<ViewShoppingScreen> createState() => ViewShoppingScreenState();
}

class ViewShoppingScreenState extends State<ViewShoppingScreen>
{
  DatabaseOperations dbOperations = DatabaseOperations();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List Details',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.blue,
        leading: GestureDetector(
          onTap: ()
          {
            Navigator.of(context).pop();
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
              // Make all these display the respective text in neat boxes that indicate which is which
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:
                  [
                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        border: Border.all(
                          color: Colors.blue,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(4.0)
                      ),
                      constraints: const BoxConstraints(minWidth: double.infinity),
                      child: Text(
                        widget.shopping.shoppingTitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),

                    Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade600,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(4.0)
                      ),
                      child: Column(
                        children:
                        [ 
                           const Text(
                            'Ingredients',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            widget.shopping.shoppingIngredients,
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
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
