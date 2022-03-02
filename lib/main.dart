import 'package:flutter/material.dart';
import '../raw/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
      routes: routes,
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
