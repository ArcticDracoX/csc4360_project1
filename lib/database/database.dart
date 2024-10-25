import 'package:path/path.dart';
import 'package:recipe_meal_planner/database/database_items.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class RecipeAppDatabase
{
  static const _databaseName = "RecipeAppDatabase.db";
  static const _databaseVersion = 1;

  // Recipes
  static const recipe = 'recipes';
  static const recipeId = '_id';
  static const recipeTitle = 'title';
  static const recipeDesc = 'description';
  static const recipeSteps = 'steps';

  // Ingredients
  static const ingredients = 'ingredients';
  static const ingredientsId = '_id';
  static const ingredientsName = 'name';
  static const ingredientsAmount = 'amount';
  static const ingredientsRecipe = 'recipeKey';

  // Shopping List references Ingredients
  static const shoppingList = 'shopping';
  static const shoppingId = '_id';
  static const shoppingIngredients = 'ingredientKey';

  // Planner references Recipes
  static const planner = 'planner';
  static const plannerId = '_id';
  static const plannerRecipe = 'recipeKey';

  // Favourites references Recipes
  static const favourites = 'favourites';
  static const favId = 'favId';
  static const favRecipe = 'recipeKey';

  late Database _db;

  RecipeAppDatabase.init();

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
        $recipeDesc TEXT NOT NULL,
        $recipeSteps TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $ingredients (
        $ingredientsId INTEGER PRIMARY KEY AUTOINCREMENT,
        $ingredientsName TEXT NOT NULL,
        $ingredientsAmount TEXT NOT NULL,
        $ingredientsRecipe INTEGER NOT NULL,
        FOREIGN KEY($ingredientsRecipe) REFERENCES recipe($recipeId)
      )
    ''');

    await db.execute('''
      CREATE TABLE $shoppingList (
        $shoppingId INTEGER PRIMARY KEY AUTOINCREMENT,
        $shoppingIngredients INTEGER NOT NULL,
        FOREIGN KEY($shoppingIngredients) REFERENCES ingredients($ingredientsId)
      )
    ''');

    await db.execute('''
      CREATE TABLE $planner (
        $plannerId INTEGER PRIMARY KEY AUTOINCREMENT,
        $plannerRecipe INTEGER NOT NULL,
        FOREIGN KEY($plannerRecipe) REFERENCES recipe($recipeId)
      )
    ''');

    await db.execute('''
      CREATE TABLE $favourites (
        $favId INTEGER PRIMARY KEY AUTOINCREMENT,
        $favRecipe INTEGER NOT NULL,
        FOREIGN KEY($favRecipe) REFERENCES recipe($recipeId)
      )
    ''');
  }


  // Recipe Functions
  Future<int> insertR(Recipe row) async
  {
    return await _db.insert(recipe, row.toMap());
  }

  Future<List<Recipe>> queryAllRowsR() async
  {
    var rows = await _db.query(recipe);
    return rows.map((recipe) => Recipe.fromMap(recipe)).toList();
  }

  Future<int> queryRowCountR() async
  {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $recipe');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> updateR(Recipe row) async
  {
    return await _db.update(
      recipe,
      row.toMap(),
      where: '$recipeId = ?',
      whereArgs: [row.id],
    );
  }

  Future<int> deleteR(int id) async
  {
    return await _db.delete(
      recipe,
      where: '$recipeId = ?',
      whereArgs: [id],
    );
  }


  // Ingredients Functions
  Future<int> insertI(Ingredients row) async
  {
    return await _db.insert(ingredients, row.toMap());
  }

  Future<List<Ingredients>> queryAllRowsI() async
  {
    var rows = await _db.query(ingredients);
    return rows.map((recipe) => Ingredients.fromMap(recipe)).toList();
  }

  Future<int> queryRowCountI() async
  {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $ingredients');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> updateI(Ingredients row) async
  {
    return await _db.update(
      ingredients,
      row.toMap(),
      where: '$ingredientsId = ?',
      whereArgs: [row.id],
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


  // Shopping List Functions
  Future<int> insertS(ShoppingList row) async
  {
    return await _db.insert(shoppingList, row.toMap());
  }

  Future<List<ShoppingList>> queryAllRowsS() async
  {
    var rows = await _db.query(shoppingList);
    return rows.map((shoppingList) => ShoppingList.fromMap(shoppingList)).toList();
  }

  Future<int> queryRowCountS() async
  {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $shoppingList');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> updateS(ShoppingList row) async
  {
    return await _db.update(
      shoppingList,
      row.toMap(),
      where: '$shoppingList = ?',
      whereArgs: [row.id],
    );
  }

  Future<int> deleteS(int id) async
  {
    return await _db.delete(
      shoppingList,
      where: '$shoppingList = ?',
      whereArgs: [id],
    );
  }


  // Planner Functions
  Future<int> insertP(Planner row) async
  {
    return await _db.insert(planner, row.toMap());
  }

  Future<List<Planner>> queryAllRowsP() async
  {
    var rows = await _db.query(planner);
    return rows.map((planner) => Planner.fromMap(planner)).toList();
  }

  Future<int> queryRowCountP() async
  {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $planner');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> updateP(Planner row) async
  {
    return await _db.update(
      planner,
      row.toMap(),
      where: '$plannerId = ?',
      whereArgs: [row.id],
    );
  }

  Future<int> deleteP(int id) async
  {
    return await _db.delete(
      planner,
      where: '$plannerId = ?',
      whereArgs: [id],
    );
  }

// Favourites Functions
  Future<int> insertF(Favourites row) async
  {
    return await _db.insert(favourites, row.toMap());
  }

  Future<List<Recipe>> queryAllRowsF() async
  {
    var rows = await _db.query(favourites);
    return rows.map((recipe) => Recipe.fromMap(favourites)).toList();
  }

  Future<int> queryRowCountF() async
  {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $favourites');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  Future<int> updateF(Favourites row) async
  {
    return await _db.update(
      favourites,
      row.toMap(),
      where: '$favId = ?',
      whereArgs: [row.id],
    );
  }

  Future<int> deleteF(int id) async
  {
    return await _db.delete(
      favourites,
      where: '$favId = ?',
      whereArgs: [id],
    );
  }
}