import 'package:flutter/material.dart';
import 'package:recipe_meal_planner/database/database_operations.dart';
import 'package:recipe_meal_planner/widgets/favourites_list.dart';

class FavouritesScreen extends StatefulWidget
{
  const FavouritesScreen(
  {
    super.key,
  });

  @override
  State<FavouritesScreen> createState() => FavouritesScreenState();
}

class FavouritesScreenState extends State<FavouritesScreen> {
  DatabaseOperations dbOperations = DatabaseOperations();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Recipes'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FutureBuilder(
                future: dbOperations.queryAllRowsF(),
                builder: (context, snapshot)
                {
                  if(snapshot.hasError)
                  {
                    return const Center(
                      child: Text('Error'),
                    );
                  }
                  var data = snapshot.data;
                  return snapshot.hasData ? FavouritesList(data!) : const Center(child: Text('You have no favourited recipes.'),
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