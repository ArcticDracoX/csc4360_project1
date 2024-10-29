// Recipe Item
class Recipe
{
  late int id;
  late String title;
  late String description;
  late String steps;

  Recipe(
  {
    required this.id,
    required this.title,
    required this.description,
    required this.steps
  });

   Recipe.fromMap(dynamic obj)
   {
    id = obj['_id'];
    title = obj['title'];
    description = obj['description'];
    steps = obj['steps'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'title': title,
      'description': description,
      'steps': steps,
    };

    return map;
  }
}

// Ingredients Item
class Ingredients
{
  late int id;
  late String name;
  late String amount;
  late int recipe;

  Ingredients(
  {
    required this.id,
    required this.name,
    required this.amount,
    required this.recipe,
  });

   Ingredients.fromMap(dynamic obj)
   {
    id = obj['_id'];
    name = obj['name'];
    amount = obj['amount'];
    recipe = obj['recipeKey'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'name': name,
      'amount': amount,
      'recipeKey': recipe,
    };

    return map;
  }
}

// Shopping List
class ShoppingList
{
  late int id;
  late int ingredient;

  ShoppingList(
  {
    required this.id,
    required this.ingredient,
  });

   ShoppingList.fromMap(dynamic obj)
   {
    id = obj['_id'];
    ingredient = obj['ingredientKey'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'ingredientKey': ingredient,
    };

    return map;
  }
}

// Planner List
class Planner
{
  late int id;
  late int recipe;

  Planner(
  {
    required this.id,
    required this.recipe,
  });

   Planner.fromMap(dynamic obj)
   {
    id = obj['_id'];
    recipe = obj['recipeKey'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'recipeKey': recipe,
    };

    return map;
  }
}

// Favourites List
class Favourites
{
  late int id;
  late int recipe;

  Favourites(
  {
    required this.id,
    required this.recipe,
  });

   Favourites.fromMap(dynamic obj)
   {
    id = obj['_id'];
    recipe = obj['recipeKey'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'recipeKey': recipe,
    };

    return map;
  }
}