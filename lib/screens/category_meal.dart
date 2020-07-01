import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';

class CategoryMeal extends StatefulWidget {
  static const categorymealscreen = '/mealscreen';
  final List<Meal> availablemeals;
  CategoryMeal(this.availablemeals);

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  List<Meal> categories = [];
  Map<String, String> routacceptedargs;
  String categoryid;
  void _removemeal(String mealid) {
    setState(() {
      categories.removeWhere((element) => element.id == mealid);
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    routacceptedargs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    categoryid = routacceptedargs['id'];
    categories = widget.availablemeals.where((meal) {
      return meal.categories.contains(routacceptedargs['id']);
    }).toList();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routacceptedargs['title']),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(categories[index], _removemeal);
        },
      ),
    );
  }
}
