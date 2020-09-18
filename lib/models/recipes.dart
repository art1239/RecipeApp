import 'dart:convert';

List<Recipe> itemsFromJson(String st) =>
    List<Recipe>.from(jsonDecode(st).map((x) => Recipe.fromJson(x)));

class Recipe {
  final String idMeal;
  final String meal;
  final String area;
  final String instructions;
  final String mealThumb;
  final List<String> ingredients;
  final String category;
  final String timeOfDay;
  final String youtube;
  final String source;

  Recipe(
      {this.idMeal,
      this.meal,
      this.area,
      this.instructions,
      this.mealThumb,
      this.ingredients,
      this.category,
      this.timeOfDay,
      this.youtube,
      this.source});

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      idMeal: json['idMeal'] as String,
      meal: json['meal'] as String,
      area: json['area'] as String,
      instructions: json['instructions'] as String,
      mealThumb: json['mealThumb'] as String,
      ingredients: parseIngredients(json['ingredients']),
      category: json['category'] as String,
      timeOfDay: json['timeOfDay'] as String,
      youtube: json['youtube'] as String,
      source: json['source'] as String,
    );
  }

  static List<String> parseIngredients(ing) {
    List<String> ingredients = new List<String>.from(ing);
    return ingredients;
  }
}
