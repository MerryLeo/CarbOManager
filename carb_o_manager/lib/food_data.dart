import 'package:flutter/material.dart';

enum MealType { none, breakfast, lunch, dinner, snack, desert }

class DailyMeal {
  final String title;
  final DateTime date;
  const DailyMeal({required this.title, required this.date});
}

class Meal {
  final TimeOfDay time;
  final MealType type;
  late List<MealIngredient> ingredients = [];
  final num carb, insulin;
  Meal({
    required this.time,
    this.type = MealType.none,
    this.carb = 0,
    this.insulin = 0,
  });

  Meal.withIngredient(
      {required this.time,
      required this.ingredients,
      this.type = MealType.none,
      this.carb = 0,
      this.insulin = 0});
}

class MealIngredient {
  Ingredient ingredient;
  String unit;
  num quantity;
  MealIngredient(this.ingredient, this.unit, this.quantity);
}

class Ingredient {
  final String name;
  final Map<String, num>? carbPerUnit;
  const Ingredient({required this.name, this.carbPerUnit});
}
