import 'package:meal_app/screens/categories.dart';
import 'package:meal_app/screens/mail_detail.dart';

import '../screens/category_meal.dart';

final routes = {
  '/': (_) => const Categories(),
  CategoryMeal.routeName: (_) => const CategoryMeal(),
  MealDetail.routeName: (_) => const MealDetail(),
};
