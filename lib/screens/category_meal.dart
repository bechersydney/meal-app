import 'package:flutter/material.dart';
import '../raw/dummy_data.dart';
import '../widgets/mail_item.dart';

class CategoryMeal extends StatelessWidget {
  static const routeName = '/category-meal';
  // final String categoryId;
  // final String categoryTitle;
  const CategoryMeal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'].toString();
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => MealItem(categoryMeals[
            index]), // if you have problem in accessing index then your iterable should be a list, add this .toList()
        itemCount: categoryMeals.length,
      ),
    );
  }
}
