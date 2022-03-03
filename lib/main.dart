import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/category_meal.dart';
import 'package:meal_app/screens/filters.dart';
import 'package:meal_app/screens/mail_detail.dart';
import 'package:meal_app/screens/tabs.dart';
import './raw/dummy_data.dart';
import '../screens/filters.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'isGluten': false,
    'isVegan': false,
    'isVegetarian': false,
    'isLactose': false
  };
  List<Meal> availableMeals = DUMMY_MEALS;
  List<Meal> favoriteMeals = [];

  void setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['isGluten']! && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['isVegan']! && !meal.isVegan) {
          return false;
        }
        if (_filters['isVegetarian']! && !meal.isVegetarian) {
          return false;
        }
        if (_filters['isLactose']! && !meal.isLactoseFree) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  void _toogleFavorite(String mealId) {
    final existingIndex = favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        favoriteMeals.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavorite(String id) {
    return favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'QuickSand',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amber,
          primary: Colors.pink,
        ),
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        // textTheme: ThemeData.light().textTheme.copyWith(
        // titleLarge: const TextStyle(
        //   fontSize: 28.0,
        // ),
        // titleMedium: const TextStyle(
        //   fontSize: 24.0,
        // ),
        // titleSmall: const TextStyle(
        //   fontSize: 18.0,
        // ),
        // ),
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => Tabs(favoriteMeals),
        CategoryMeal.routeName: (_) => CategoryMeal(availableMeals),
        MealDetail.routeName: (_) => MealDetail(_toogleFavorite, _isFavorite),
        Filters.routeName: (_) => Filters(_filters, setFilters),
      },
      onGenerateRoute: (settings) {
        // this will work if you do not register your route in route table
        // if(settings.name == '/meal-app'){
        //   return MaterialPageRoute(builder:(_)=>YourPage)
        // }
      },
      onUnknownRoute: (settings) {
        // 404 page in web
        // this will work and create a screen if all the routes fails
        // return MaterialPageRoute(builder:(_)=>YourPage)
      },
    );
  }
}
