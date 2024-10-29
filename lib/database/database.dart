import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class RecipeAppDatabase
{
  static const _databaseName = "RecipeAppDatabase.db";
  static const _databaseVersion = 1;
  
  RecipeAppDatabase._privateConstructor();
  static final RecipeAppDatabase instance = RecipeAppDatabase._privateConstructor();

  // Recipes
  static const recipe = 'recipes';
  static const recipeId = '_id';
  static const recipeTitle = 'title';
  static const recipeDesc = 'description';
  static const recipeSteps = 'steps';

  // Ingredients references Recipes
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

  static Database? _db;

  Future<Database?> get database async
  {
    var checkDb = _db;

    if(checkDb == null)
    {
      checkDb = await init();
      _db = checkDb;
    }
  
    return _db;
  }

  init() async
  {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(
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
}