import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/widgets/planner_list.dart';

class MealPlannerScreen extends StatefulWidget {
  const MealPlannerScreen({super.key});

  @override
  State<MealPlannerScreen> createState() => MealPlannerScreenState();
}

class MealPlannerScreenState extends State<MealPlannerScreen> {
  DatabaseOperations dbOperations = DatabaseOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meal Planner'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FutureBuilder(
                future: dbOperations.queryAllRowsP(),
                builder: (context, snapshot)
                {
                  if(snapshot.hasError)
                  {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  var data = snapshot.data;
                  return snapshot.hasData ? PlannerList(data!) : const Center(child: Text('You have no recipes.'),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
