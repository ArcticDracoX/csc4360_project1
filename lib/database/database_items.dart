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
    this.id = obj['_id'];
    this.title = obj['title'];
    this.description = obj['description'];
    this.steps = obj['directions'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'title': title,
      'description': description,
      'steps':steps,
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

  Ingredients(
  {
    required this.id,
    required this.name,
    required this.amount,
  });

   Ingredients.fromMap(dynamic obj)
   {
    this.id = obj['_id'];
    this.name = obj['name'];
    this.amount = obj['amount'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
      'name': name,
      'amount': amount,
    };

    return map;
  }
}

// Shopping List
class ShoppingList
{
  late int id;

  ShoppingList(
  {
    required this.id,
  });

   ShoppingList.fromMap(dynamic obj)
   {
    this.id = obj['_id'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
    };

    return map;
  }
}

// Planner List
class Planner
{
  late int id;

  Planner(
  {
    required this.id,
  });

   Planner.fromMap(dynamic obj)
   {
    this.id = obj['_id'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
    };

    return map;
  }
}

// Favourites List
class Favourites
{
  late int id;

  Favourites(
  {
    required this.id,
  });

   Favourites.fromMap(dynamic obj)
   {
    this.id = obj['_id'];
  }

  Map<String, dynamic> toMap()
  {
    var map = <String, dynamic>
    {
      '_id': id,
    };

    return map;
  }
}