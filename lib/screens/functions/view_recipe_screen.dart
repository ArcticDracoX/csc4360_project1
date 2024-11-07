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
        title: const Text(
          'Recipe Details',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                      [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue
                          ),
                          onPressed: () async
                          {
                            int id = 1;
                            while((await dbOperations.searchByIdF(id)).isNotEmpty)
                            {
                              id++;
                            }

                            final favRecipe = Favourites(
                              id: id,
                              recipeTitle: widget.recipe.title,
                              recipeKey: widget.recipe.id,
                            );

                            dbOperations.insertF(favRecipe);

                            if(context.mounted)
                            {
                              ScaffoldMessenger.of(context).showSnackBar( 
                                const SnackBar( 
                                  content: Text('Recipe added to favourites'), 
                                  duration: Duration(seconds: 2),
                                ), 
                              ); 
                            }
                          },
                          child: const Icon(Icons.star, color: Colors.white),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                          onPressed: () async
                          {
                            int id = 1;
                            while((await dbOperations.searchByIdP(id)).isNotEmpty)
                            {
                              id++;
                            }

                            final planRecipe = Planner(
                              id: id,
                              recipeTitle: widget.recipe.title,
                              recipeKey: widget.recipe.id,
                            );

                            dbOperations.insertP(planRecipe);

                            if(context.mounted)
                            {
                              ScaffoldMessenger.of(context).showSnackBar( 
                                const SnackBar( 
                                  content: Text('Recipe added to planner'),
                                  duration: Duration(seconds: 2),
                                ), 
                              ); 
                            }
                          },
                          child: const Icon(Icons.calendar_today, color: Colors.white),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue),
                          onPressed: () async {
                            int id = 1;
                            while ((await dbOperations.searchByIdS(id)).isNotEmpty)
                            {
                              id++;
                            }

                            final shoppingRecipe = ShoppingList(
                              id: id,
                              shoppingTitle: 'Ingredients for ${widget.recipe.title}',
                              shoppingIngredients: widget.recipe.ingredients,
                            );

                            dbOperations.insertS(shoppingRecipe);

                            if(context.mounted)
                            {
                              ScaffoldMessenger.of(context).showSnackBar( 
                                const SnackBar( 
                                  content: Text('Recipe added to shopping list'), 
                                  duration: Duration(seconds: 2),
                                ), 
                              ); 
                            }
                          },
                          child: const Icon(Icons.shopping_cart, color: Colors.white),
                        ),
                      ],
                    ),

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
                      child: Column(
                        children:
                        [ 
                          Text(
                            widget.recipe.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            widget.recipe.description,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
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
                            widget.recipe.ingredients,
                            textAlign: TextAlign.left,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
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
                            'Steps',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            widget.recipe.steps,
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
