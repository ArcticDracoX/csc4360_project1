// Recipe Item
class Recipe
{
  late int id;
  late String title;
  late String description;
  late String ingredients;
  late String steps;

  Recipe(
  {
    required this.id,
    required this.title,
    required this.description,
    required this.ingredients,
    required this.steps
  });

   Recipe.fromMap(dynamic obj)
   {
    id = obj['_id'];
    title = obj['title'];
    description = obj['description'];
    ingredients = obj['ingredients'];
    steps = obj['steps'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'title': title,
      'description': description,
      'ingredients': ingredients,
      'steps': steps,
    };

    return map;
  }
}

// Shopping List
class ShoppingList
{
  late int id;
  late String shoppingTitle;
  late String shoppingIngredients;

  ShoppingList(
  {
    required this.id,
    required this.shoppingTitle,
    required this.shoppingIngredients,
  });

   ShoppingList.fromMap(dynamic obj)
   {
    id = obj['_id'];
    shoppingTitle = obj['shoppingTitle'];
    shoppingIngredients = obj['shoppingIngredients'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'shoppingTitle': shoppingTitle,
      'shoppingIngredients': shoppingIngredients,
    };

    return map;
  }
}

// Planner List
class Planner
{
  late int id;
  late String recipeTitle;
  late int recipeKey;

  Planner(
  {
    required this.id,
    required this.recipeTitle,
    required this.recipeKey,
  });

   Planner.fromMap(dynamic obj)
   {
    id = obj['_id'];
    recipeTitle = obj['recipeTitle'];
    recipeKey = obj['recipeKey'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'recipeTitle': recipeTitle,
      'recipeKey': recipeKey,
    };

    return map;
  }
}

// Favourites List
class Favourites
{
  late int id;
  late String recipeTitle;
  late int recipeKey;

  Favourites(
  {
    required this.id,
    required this.recipeTitle,
    required this.recipeKey,
  });

   Favourites.fromMap(dynamic obj)
   {
    id = obj['_id'];
    recipeTitle = obj['recipeTitle'];
    recipeKey = obj['recipeKey'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'recipeTitle': recipeTitle,
      'recipeKey': recipeKey,
    };

    return map;
  }
}