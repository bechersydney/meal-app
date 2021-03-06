import '../raw/enums.dart';

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isFavorite;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    this.imageUrl = '',
    required this.ingredients,
    required this.steps,
    this.duration = 2,
    this.complexity = Complexity.Simple,
    this.affordability = Affordability.Affordable,
    this.isGlutenFree = false,
    this.isLactoseFree = false,
    this.isVegan = false,
    this.isVegetarian = false,
    this.isFavorite = false,
  });
}
