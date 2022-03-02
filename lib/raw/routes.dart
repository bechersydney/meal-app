import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/mail_detail.dart';
import 'package:meal_app/screens/tabs.dart';

import '../screens/category_meal.dart';

final routes = {
  '/': (_) => const Tabs(),
  CategoryMeal.routeName: (_) => const CategoryMeal(),
  MealDetail.routeName: (_) => const MealDetail(),
  Filters.routeName: (_) => const Filters(),
};
