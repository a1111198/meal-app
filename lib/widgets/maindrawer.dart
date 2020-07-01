import 'package:flutter/material.dart';
import 'package:meal_app/screens/Filter.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        elevation: 0,
        child: Column(
          children: [
            Container(
              height: 100,
              width: double.infinity,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(10),
              color: Theme.of(context).accentColor,
              child: Text(
                "Cooking Up",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            customListTile(context, 'Meals', Icons.restaurant, () {
              Navigator.of(context).pushReplacementNamed('/');
            }),
            customListTile(context, 'Filters', Icons.settings, () {
              Navigator.of(context).pushReplacementNamed(Filters.routeName);
            })
          ],
        ));
  }

  Widget customListTile(
      BuildContext context, String title, IconData n, Function handler) {
    return ListTile(
        leading: Icon(
          n,
          size: 25,
          color: Theme.of(context).accentColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        onTap: handler);
  }
}
