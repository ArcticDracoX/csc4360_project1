import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

const tableRecipes = 'recipes';

class RecipeDatabase
{
  static const _databaseName = "RecipeDatabase.db";
  static const _databaseVersion = 1;

  static const recipe = 'recipes';
  static const recipeId = '_id';
  static const recipeTitle = 'title';
  static const recipeDesc = 'description';

  static const ingredients = 'ingredients';
  static const ingredientsId = '_id';
  static const ingredientsName = 'name';
  static const ingredientsAmount = 'amount';

  // static const shoppingList = 'shopping';
  // static const shoppingId = 'id';
  // static const shoppingName = 'name';

  // static const planner = 'planner';
  // static const plannerId = '_id';
  // static const plannerName = 'name';

  static const foreignId = 'recipeKey';

  late Database _db;

  RecipeDatabase._init();

  Future<void> init() async
  {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async
  {
    await db.execute('''
      CREATE TABLE $recipe (
        $recipeId INTEGER PRIMARY KEY AUTOINCREMENT,
        $recipeTitle TEXT NOT NULL,
        $recipeDesc TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $ingredients (
        $ingredientsId INTEGER PRIMARY KEY AUTOINCREMENT,
        $ingredientsName TEXT NOT NULL,
        $ingredientsAmount TEXT NOT NULL
        $recipeId FOREIGN KEY
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async
  {
    return await _db.insert(recipe, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async
  {
    return await _db.query(recipe);
  }

  Future<int> queryRowCount() async
  {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $recipe');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> update(Map<String, dynamic> row) async
  {
    int id = row[recipeId];
    return await _db.update(
      recipe,
      row,
      where: '$recipeId = ?',
      whereArgs: [id],
    );
  }

  Future<int> delete(int id) async
  {
    return await _db.delete(
      recipe,
      where: '$recipeId = ?',
      whereArgs: [id],
    );
  }

  Future<int> insertI(Map<String, dynamic> row) async
  {
    return await _db.insert(ingredients, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRowsI() async
  {
    return await _db.query(ingredients);
  }

  Future<int> queryRowCountI() async
  {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $ingredients');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> updateI(Map<String, dynamic> row) async
  {
    int id = row[ingredientsId];
    return await _db.update(
      ingredients,
      row,
      where: '$ingredientsId = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteI(int id) async
  {
    return await _db.delete(
      ingredients,
      where: '$ingredientsId = ?',
      whereArgs: [id],
    );
  }
}