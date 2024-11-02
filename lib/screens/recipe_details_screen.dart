import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/widgets/recipe_list.dart';

class ContactsPage extends StatefulWidget
{
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => ContactsPageState();
}

class ContactsPageState extends State<ContactsPage> {
  DatabaseOperations dbOperations = DatabaseOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recipe Details'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>
            [
              FutureBuilder(
                future: dbOperations.queryAllRowsR(),
                builder: (context, snapshot)
                {
                  var data = snapshot.data;
                  return snapshot.hasData
                  ? RecipeList(data!)
                  : const Center(
                    child: Text('You have no contacts'),
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
