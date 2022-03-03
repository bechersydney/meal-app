import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/mail_item.dart';

class Favorites extends StatelessWidget {
  final List<Meal> _favoriteMeals;
  const Favorites(this._favoriteMeals, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _favoriteMeals.isEmpty
        ? Center(
            child: Text(
              'No Favorites',
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        : ListView.builder(
            itemBuilder: (context, index) => MealItem(
              _favoriteMeals[index],
            ),
            itemCount: _favoriteMeals.length,
          );
  }
}
