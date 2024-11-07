import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/widgets/planner_list.dart';

class MealPlannerScreen extends StatefulWidget
{
  const MealPlannerScreen({super.key});

  @override
  State<MealPlannerScreen> createState() => MealPlannerScreenState();
}

class MealPlannerScreenState extends State<MealPlannerScreen>
{
  DatabaseOperations dbOperations = DatabaseOperations();
  String keyword = '';

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meal Planner',
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
                future: dbOperations.searchByNameP(keyword),
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
                        return const Center(child: Text('You have no planned recipes.'));
                      }

                      return PlannerList(data!);
                    }
                  }
                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
