import 'package:flutter/material.dart';
import '../screens/category_meal.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color, {Key? key})
      : super(key: key);

  void _selectCategory(BuildContext context) {
    // Navigator.of(context)
    //     .push(MaterialPageRoute(builder: (_) => CategoryMeal(id, title)));

    Navigator.of(context).pushNamed(CategoryMeal.routeName,
        arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => _selectCategory(context),
      splashColor: Colors.pink[100],
      borderRadius: BorderRadius.circular(15.0),
      child: Container(
        padding: const EdgeInsets.all(
          15.0,
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              title,
              style: theme.textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
