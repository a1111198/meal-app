import 'package:flutter/material.dart';
import 'package:meal_app/data/dummy.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class Favourites extends StatefulWidget {
  final List<String> favid;

  Favourites(this.favid);

  @override
  _FavouritesState createState() => _FavouritesState();
}

class _FavouritesState extends State<Favourites> {
  List<Meal> mealslist = [];

  @override
  void initState() {
    mealslist = DUMMY_MEALS.where((element) {
      if (widget.favid.contains(element.id)) {
        return true;
      } else {
        return false;
      }
    }).toList();
    super.initState();
  }

  @override
  void setState(fn) {
    mealslist = DUMMY_MEALS.where((element) {
      if (widget.favid.contains(element.id)) {
        return true;
      } else {
        return false;
      }
    }).toList();
    super.setState(fn);
  }

  void fun() {
    print('hey');
  }

  @override
  Widget build(BuildContext context) {
    if (mealslist.isEmpty) {
      return Center(
        child: Text("You have not added anything"),
      );
    }
    return ListView.builder(
      itemCount: mealslist.length,
      itemBuilder: (BuildContext context, int index) {
        return MealItem(mealslist[index], fun);
      },
    );
  }
}
