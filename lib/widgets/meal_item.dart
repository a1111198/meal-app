import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;
  final Function removeitem;

  MealItem(this.meal, this.removeitem);
  String get gettermethod {
    if (meal.complexity == Complexity.Simple) {
      return 'Simple';
    }
    if (meal.complexity == Complexity.Hard) {
      return 'Hard';
    }
    if (meal.complexity == Complexity.Challenging) {
      return 'Challenging';
    }
    return 'unknown';
  }

  String get gettermethod2 {
    if (meal.affordability == Affordability.Affordable) {
      return 'Affordable';
    }
    if (meal.affordability == Affordability.Luxurious) {
      return 'Luxurios';
    }
    if (meal.affordability == Affordability.Pricey) {
      return 'Pricey';
    }
    return 'Unknown';
  }

  void selectmeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(MealScreen.routeName, arguments: meal.id)
        .then((value) {
      if (value != null) {
        removeitem(value);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: () => selectmeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 6,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional(0.8, 0.8),
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: height * 0.4,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                  width: width * 0.7,
                  color: Color.fromRGBO(0, 0, 0, 0.6),
                  child: Text(
                    meal.title,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: 'RailWay'),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  height: 60,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.black,
                        size: 25,
                      ),
                      Text(
                        meal.duration.toString() + '  min',
                        style: TextStyle(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.work,
                      color: Colors.black,
                      size: 25,
                    ),
                    SizedBox(width: 2),
                    Text(
                      gettermethod,
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.attach_money,
                      color: Colors.black,
                      size: 25,
                    ),
                    Text(gettermethod2, style: TextStyle(color: Colors.black))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
