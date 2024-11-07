import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/screens/add_recipe_screen.dart';
import 'package:recipe_meal_planner/widgets/recipe_list.dart';

class HomeScreen extends StatefulWidget
{
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
{
  DatabaseOperations dbOperations = DatabaseOperations();
  String keyword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Recipe List',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>
            [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue
                ),
                onPressed: ()
                {
                  // Simple refresh button
                  setState((){});
                },
                child: const Icon(Icons.refresh, color: Colors.white)
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search by Recipe Name'
                  ),
                  onSubmitted: (value)
                  {
                    keyword = value;
                    setState((){});
                  },
                ),
              ),

              FutureBuilder(
                future: dbOperations.searchByNameR(keyword),
                builder: (context, snapshot)
                {
                  if(snapshot.connectionState == ConnectionState.done)
                  {
                    if(snapshot.hasError)
                    {
                      return const Center(
                        child: Text('Error in snapshot'),
                      );
                    }
                    
                    var data = snapshot.data;
                    if(snapshot.hasData)
                    {
                      if(snapshot.data!.isEmpty)
                      {
                        return const Center(child: Text('You have no recipes.'));
                      }
                      
                      return RecipeList(data!);
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade300,
        child: const Icon(Icons.add),
        onPressed: ()
        {
          Navigator.push(context,
            MaterialPageRoute(
              builder: (context) => const AddRecipeScreen()
            ),
          ).then((_)
          {
            setState((){});
          });
        },
      ),
    );
  }
}
