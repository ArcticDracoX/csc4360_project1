import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class RecipeAppDatabase
{
  RecipeAppDatabase._privateConstructor();
  static final RecipeAppDatabase instance = RecipeAppDatabase._privateConstructor();
  
  static const _databaseName = "RecipeAppDatabase.db";
  static const _databaseVersion = 1;

  // Recipes
  static const recipe = 'recipes';
  static const recipeId = '_id';
  static const recipeTitle = 'title';
  static const recipeDesc = 'description';
  static const recipeIngredients = 'ingredients';
  static const recipeSteps = 'steps';

  // Shopping List references Recipes
  static const shoppingList = 'shopping';
  static const shoppingId = '_id';
  static const shoppingIngredientsName = 'ingredientsName';
  static const shoppingKey = 'ingredientsKey';

  // Planner references Recipes
  static const planner = 'planner';
  static const plannerId = '_id';
  static const plannerRecipeTitle = 'recipeTitle';
  static const plannerRecipeKey = 'recipeKey';

  // Favourites references Recipes
  static const favourites = 'favourites';
  static const favId = 'favId';
  static const favRecipeTitle = 'recipeTitle';
  static const favRecipeKey = 'recipeKey';

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
        $recipeId INTEGER PRIMARY KEY,
        $recipeTitle TEXT NOT NULL,
        $recipeDesc TEXT NOT NULL,
        $recipeIngredients TEXT NOT NULL,
        $recipeSteps TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE $shoppingList (
        $shoppingId INTEGER PRIMARY KEY,
        $shoppingIngredientsName TEXT NOT NULL,
        $shoppingKey INTEGER NOT NULL,
        FOREIGN KEY($shoppingIngredientsName) REFERENCES $recipe($recipeIngredients),
        FOREIGN KEY($shoppingKey) REFERENCES $recipe($recipeId)
      )
    ''');

    await db.execute('''
      CREATE TABLE $planner (
        $plannerId INTEGER PRIMARY KEY,
        $plannerRecipeTitle TEXT NOT NULL,
        $plannerRecipeKey INTEGER NOT NULL,
        FOREIGN KEY($plannerRecipeTitle) REFERENCES $recipe($recipeTitle),
        FOREIGN KEY($plannerRecipeKey) REFERENCES $recipe($recipeId)
      )
    ''');

    await db.execute('''
      CREATE TABLE $favourites (
        $favId INTEGER PRIMARY KEY,
        $favRecipeTitle TEXT NOT NULL,
        $favRecipeKey INTEGER NOT NULL,
        FOREIGN KEY($favRecipeTitle) REFERENCES $recipe($recipeTitle),
        FOREIGN KEY($favRecipeKey) REFERENCES $recipe($recipeId)
      )
    ''');
  }
}