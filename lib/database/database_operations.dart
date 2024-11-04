import 'package:recipe_meal_planner/database/database.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:sqflite/sqflite.dart';
  
class DatabaseOperations
{
  final dbProvider = RecipeAppDatabase.instance;
  
  // Recipe Functions
  insertR(Recipe row) async
  {
    final db = await dbProvider.database;
    return await db!.insert(RecipeAppDatabase.recipe, row.toMap());
  }

  Future<List<Recipe>> queryAllRowsR() async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(RecipeAppDatabase.recipe);
    return rows.map((recipe) => Recipe.fromMap(RecipeAppDatabase.recipe)).toList();
  }

  Future<int> queryRowCountR() async
  {
    final db = await dbProvider.database;
    final results = await db!.rawQuery('SELECT COUNT(*) FROM ${RecipeAppDatabase.recipe}');
    return Sqflite.firstIntValue(results) ?? 0;
  }

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

  Future<List<Recipe>> searchR(String keyword) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.recipe,
      where: 'name LIKE ?',
      whereArgs: ['%$keyword%']
    );
    return rows.map((recipe) => Recipe.fromMap(RecipeAppDatabase.recipe)).toList();
  }

  // Shopping List Functions
  Future<int> insertS(ShoppingList row) async
  {
    final db = await dbProvider.database;
    return await db!.insert(RecipeAppDatabase.shoppingList, row.toMap());
  }

  Future<List<ShoppingList>> queryAllRowsS() async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(RecipeAppDatabase.shoppingList);
    return rows.map((shoppingList) => ShoppingList.fromMap(RecipeAppDatabase.shoppingList)).toList();
  }

  Future<int> queryRowCountS() async
  {
    final db = await dbProvider.database;
    final results = await db!.rawQuery('SELECT COUNT(*) FROM ${RecipeAppDatabase.shoppingList}');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> updateS(ShoppingList row) async
  {
    final db = await dbProvider.database;
    return await db!.update(
      RecipeAppDatabase.shoppingList,
      row.toMap(),
      where: '${RecipeAppDatabase.shoppingList} = ?',
      whereArgs: [row.id],
    );
  }

  Future<int> deleteS(int id) async
  {
    final db = await dbProvider.database;
    return await db!.delete(
      RecipeAppDatabase.shoppingList,
      where: '${RecipeAppDatabase.shoppingList} = ?',
      whereArgs: [id],
    );
  }

  Future<List<ShoppingList>> searchS(String keyword) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.shoppingList,
      where: 'name LIKE ?',
      whereArgs: ['%$keyword%']
    );
    return rows.map((shoppingList) => ShoppingList.fromMap(RecipeAppDatabase.shoppingList)).toList();
  }


  // Planner Functions
  Future<int> insertP(Planner row) async
  {
    final db = await dbProvider.database;
    return await db!.insert(RecipeAppDatabase.planner, row.toMap());
  }

  Future<List<Planner>> queryAllRowsP() async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(RecipeAppDatabase.planner);
    return rows.map((planner) => Planner.fromMap(RecipeAppDatabase.planner)).toList();
  }

  Future<int> queryRowCountP() async
  {
    final db = await dbProvider.database;
    final results = await db!.rawQuery('SELECT COUNT(*) FROM ${RecipeAppDatabase.planner}');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> updateP(Planner row) async
  {
    final db = await dbProvider.database;
    return await db!.update(
      RecipeAppDatabase.planner,
      row.toMap(),
      where: '${RecipeAppDatabase.plannerId} = ?',
      whereArgs: [row.id],
    );
  }

  Future<List<Planner>> searchP(String keyword) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.planner,
      where: 'name LIKE ?',
      whereArgs: ['%$keyword%']
    );
    return rows.map((planner) => Planner.fromMap(RecipeAppDatabase.planner)).toList();
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

// Favourites Functions
  Future<int> insertF(Favourites row) async
  {
    final db = await dbProvider.database;
    return await db!.insert(RecipeAppDatabase.favourites, row.toMap());
  }

  Future<List<Favourites>> queryAllRowsF() async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(RecipeAppDatabase.favourites);
    return rows.map((favourites) => Favourites.fromMap(RecipeAppDatabase.favourites)).toList();
  }

  Future<int> queryRowCountF() async
  {
    final db = await dbProvider.database;
    final results = await db!.rawQuery('SELECT COUNT(*) FROM ${RecipeAppDatabase.favourites}');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> updateF(Favourites row) async
  {
    final db = await dbProvider.database;
    return await db!.update(
      RecipeAppDatabase.favourites,
      row.toMap(),
      where: '${RecipeAppDatabase.favId} = ?',
      whereArgs: [row.id],
    );
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

  Future<List<Favourites>> searchF(String keyword) async
  {
    final db = await dbProvider.database;
    var rows = await db!.query(
      RecipeAppDatabase.favourites,
      where: 'name LIKE ?',
      whereArgs: ['%$keyword%']
    );
    return rows.map((favourites) => Favourites.fromMap(RecipeAppDatabase.favourites)).toList();
  }
}