import 'package:recipe_meal_planner/database/database.dart';
import 'package:recipe_meal_planner/database/database_items.dart';

// Contains all SQLite operations for each table
class DatabaseOperations
{
  final dbProvider = RecipeAppDatabase.instance;
  
  // Recipe Functions
  insertR(Recipe row) async
  {
    final db = await dbProvider.database;
    return await db!.insert(RecipeAppDatabase.recipe, row.toMap());
  }

  // Originally used for ID and was copied to all other functions
  // Saved just in case
  // Future<List<Recipe>> queryAllRowsR() async
  // {
  //   final db = await dbProvider.database;
  //   var rows = await db!.query(RecipeAppDatabase.recipe);
  //   return rows.map((recipe) => Recipe.fromMap(recipe)).toList();
  // }

  // Future<int> queryRowCountR() async
  // {
  //   final db = await dbProvider.database;
  //   final results = await db!.rawQuery('SELECT COUNT(*) FROM ${RecipeAppDatabase.recipe}');
  //   return Sqflite.firstIntValue(results) ?? 0;
  // }

  Future<int> updateR(Recipe row) async
  {
    final db = await dbProvider.database;
    return await db!.update(
      RecipeAppDatabase.recipe,
      row.toMap(),
      where: '${RecipeAppDatabase.recipeId} = ?',
      whereArgs: [row.id],
    );
  }

  Future<int> deleteR(int id) async
  {

    final db = await dbProvider.database;
    return await db!.delete(
      RecipeAppDatabase.recipe,
      where: '${RecipeAppDatabase.recipeId} = ?',
      whereArgs: [id],
    );
  }

  Future<List<Recipe>> searchByNameR(String keyword) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.recipe,
      where: '${RecipeAppDatabase.recipeTitle} LIKE ?',
      whereArgs: ['%$keyword%']
    );
    return rows.map((recipe) => Recipe.fromMap(recipe)).toList();
  }

  Future<List<Recipe>> searchByIdR(int searchId) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.recipe,
      where: '${RecipeAppDatabase.recipeId} LIKE ?',
      whereArgs: ['%$searchId%']
    );
    return rows.map((recipe) => Recipe.fromMap(recipe)).toList();
  }


  // Shopping List Functions
  Future<int> insertS(ShoppingList row) async
  {
    final db = await dbProvider.database;
    return await db!.insert(RecipeAppDatabase.shoppingList, row.toMap());
  }

  Future<int> updateS(ShoppingList row) async
  {
    final db = await dbProvider.database;
    return await db!.update(
      RecipeAppDatabase.shoppingList,
      row.toMap(),
      where: '${RecipeAppDatabase.shoppingId} = ?',
      whereArgs: [row.id],
    );
  }

  Future<int> deleteS(int id) async
  {
    final db = await dbProvider.database;
    return await db!.delete(
      RecipeAppDatabase.shoppingList,
      where: '${RecipeAppDatabase.shoppingId} = ?',
      whereArgs: [id],
    );
  }

  Future<List<ShoppingList>> searchByIngredientS(String keyword) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.shoppingList,
      where: '${RecipeAppDatabase.shoppingIngredients} LIKE ?',
      whereArgs: ['%$keyword%']
    );
    return rows.map((shoppingList) => ShoppingList.fromMap(shoppingList)).toList();
  }

  Future<List<ShoppingList>> searchByIdS(int searchId) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.shoppingList,
      where: '${RecipeAppDatabase.shoppingId} LIKE ?',
      whereArgs: ['%$searchId%']
    );
    return rows.map((shoppingList) => ShoppingList.fromMap(shoppingList)).toList();
  }


  // Planner Functions
  Future<int> insertP(Planner row) async
  {
    final db = await dbProvider.database;
    return await db!.insert(RecipeAppDatabase.planner, row.toMap());
  }
  
  Future<int> deleteP(int id) async
  {
    final db = await dbProvider.database;
    return await db!.delete(
      RecipeAppDatabase.planner,
      where: '${RecipeAppDatabase.plannerId} = ?',
      whereArgs: [id],
    );
  }

  Future<List<Planner>> searchByNameP(String keyword) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.planner,
      where: '${RecipeAppDatabase.plannerRecipeTitle} LIKE ?',
      whereArgs: ['%$keyword%']
    );
    return rows.map((planner) => Planner.fromMap(planner)).toList();
  }

  Future<List<Planner>> searchByIdP(int searchId) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.planner,
      where: '${RecipeAppDatabase.plannerId} LIKE ?',
      whereArgs: ['%$searchId%']
    );
    return rows.map((planner) => Planner.fromMap(planner)).toList();
  }

// Favourites Functions
  Future<int> insertF(Favourites row) async
  {
    final db = await dbProvider.database;
    return await db!.insert(RecipeAppDatabase.favourites, row.toMap());
  }

  Future<int> deleteF(int id) async
  {
    final db = await dbProvider.database;
    return await db!.delete(
      RecipeAppDatabase.favourites,
      where: '${RecipeAppDatabase.favId} = ?',
      whereArgs: [id],
    );
  }

  Future<List<Favourites>> searchByNameF(String keyword) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.favourites,
      where: '${RecipeAppDatabase.favRecipeTitle} LIKE ?',
      whereArgs: ['%$keyword%']
    );
    return rows.map((favourites) => Favourites.fromMap(favourites)).toList();
  }

  Future<List<Favourites>> searchByIdF(int searchId) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.favourites,
      where: '${RecipeAppDatabase.favId} LIKE ?',
      whereArgs: ['%$searchId%']
    );
    return rows.map((favourites) => Favourites.fromMap(favourites)).toList();
  }
}