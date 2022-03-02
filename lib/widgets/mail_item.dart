import 'package:flutter/material.dart';
import 'package:meal_app/raw/enums.dart';
import 'package:meal_app/screens/mail_detail.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  const MealItem(this.meal, {Key? key}) : super(key: key);

  void _selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(MealDetail.routeName, arguments: meal.id);
  }

  String get _complexityValue {
    String text;
    // if (meal.complexity == Complexity.Challenging) {
    //   text = 'Challenging';
    // } else if (meal.complexity == Complexity.Hard) {
    //   text = 'Hard';
    // } else {
    //   text = 'Simple';
    // }
    switch (meal.complexity) {
      case Complexity.Challenging:
        text = 'Challenging';
        break;
      case Complexity.Simple:
        text = 'Simple';
        break;
      default:
        text = 'Hard';
    }
    return text;
  }

  String get _affordabilityValue {
    String text;
    // if (meal.complexity == Complexity.Challenging) {
    //   text = 'Challenging';
    // } else if (meal.complexity == Complexity.Hard) {
    //   text = 'Hard';
    // } else {
    //   text = 'Simple';
    // }
    switch (meal.affordability) {
      case Affordability.Pricey:
        text = 'Pricey';
        break;
      case Affordability.Luxurious:
        text = 'Expensive';
        break;
      default:
        text = 'Affordable';
    }
    return text;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        elevation: 4.0,
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 0,
                  child: Container(
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(20.0),
                    //     color: Colors.black54),
                    color: Colors.black54,
                    width: 300,
                    padding: const EdgeInsets.all(10.0),
                    // color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: const TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.schedule),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text('${meal.duration} min')
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.work),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(_complexityValue)
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.attach_money),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(_affordabilityValue)
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
