import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/Filter.dart';
import 'package:meal_app/screens/tabs_screen.dart';
import './screens/meal_screen.dart';
import './screens/category_meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> filters = {
    'gf': false,
    'lac': false,
    'vegeterian': false,
    'vag': false
  };
  List<Meal> availablemeals = DUMMY_MEALS;
  List<String> favouritesid = [];
  var isfav = false;
  void toggfav(String id) {
    if (!favouritesid.contains(id)) {
      setState(() {
        favouritesid.add(id);
      });
    } else {
      setState(() {
        favouritesid.removeWhere((element) {
          if (element == id) {
            return true;
          } else {
            return false;
          }
        });
      });
    }
  }

  bool _isfav(String id) {
    return favouritesid.any((element) => element == id);
  }

  void filtersetter(Map<String, bool> args) {
    setState(() {
      filters = args;
      availablemeals = availablemeals.where((e) {
        if (!e.isGlutenFree && filters['gf']) {
          return false;
        }
        if (!e.isLactoseFree && filters['lac']) {
          return false;
        }
        if (!e.isVegetarian && filters['vegeterian']) {
          return false;
        }
        if (!e.isVegan && filters['vag']) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'meal app',
      theme: ThemeData(
          primarySwatch: Colors.orange,
          accentColor: Colors.pink,
          canvasColor: Colors.blue[50],
          fontFamily: 'RailWay',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(10, 20, 30, 1)),
              bodyText2: TextStyle(color: Colors.indigo),
              headline6: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 23,
                  fontWeight: FontWeight.bold))),
      //home: Categories_screen(),
      routes: {
        '/': (ctx) => TabScreen(favouritesid),
        CategoryMeal.categorymealscreen: (ctx) => CategoryMeal(availablemeals),
        MealScreen.routeName: (ctx) => MealScreen(toggfav, _isfav),
        Filters.routeName: (ctx) => Filters(filters, filtersetter)
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (ctx) => CategoryMeal(availablemeals));
      },
    );
  }
}
