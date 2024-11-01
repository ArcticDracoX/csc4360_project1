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
  late String ingredients;

  ShoppingList(
  {
    required this.id,
    required this.ingredients,
  });

   ShoppingList.fromMap(dynamic obj)
   {
    id = obj['_id'];
    ingredients = obj['ingredientKey'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'ingredientKey': ingredients,
    };

    return map;
  }
}

// Planner List
class Planner
{
  late int id;
  late String recipeTitle;

  Planner(
  {
    required this.id,
    required this.recipeTitle,
  });

   Planner.fromMap(dynamic obj)
   {
    id = obj['_id'];
    recipeTitle = obj['recipeKey'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'recipeKey': recipeTitle,
    };

    return map;
  }
}

// Favourites List
class Favourites
{
  late int id;
  late String recipeTitle;

  Favourites(
  {
    required this.id,
    required this.recipeTitle,
  });

   Favourites.fromMap(dynamic obj)
   {
    id = obj['_id'];
    recipeTitle = obj['recipeKey'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'recipeKey': recipeTitle,
    };

    return map;
  }
}