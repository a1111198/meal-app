import 'package:flutter/material.dart';
import '../data/dummy.dart';

class MealScreen extends StatelessWidget {
  static const routeName = '/materai';
  final Function addfav;
  final Function isfav;
  MealScreen(this.addfav, this.isfav);
  @override
  Widget build(BuildContext context) {
    final mealid = ModalRoute.of(context).settings.arguments as String;

    final selectedmeal =
        DUMMY_MEALS.firstWhere((element) => mealid == element.id);
    return Scaffold(
      appBar: AppBar(title: Text('${selectedmeal.title}')),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white, border: Border.all(color: Colors.green)),
              height: 250,
              width: double.infinity,
              child: Image.network(selectedmeal.imageUrl, fit: BoxFit.cover)),
          builtstyle(context, 'Ingredients'),
          liststyle(
              context,
              ListView.builder(
                itemCount: selectedmeal.ingredients.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Text(selectedmeal.ingredients[index],
                        style: Theme.of(context).textTheme.headline6),
                    color: Theme.of(context).accentColor,
                  );
                },
              )),
          builtstyle(context, 'Steps'),
          liststyle(
            context,
            ListView.builder(
              itemCount: selectedmeal.steps.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(child: Text(' # ${index + 1}')),
                      title: Text('${selectedmeal.steps[index]}'),
                    ),
                    Divider(color: Colors.black12, thickness: 1)
                  ],
                );
              },
            ),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pop(mealid);
        },
        child: Icon(Icons.delete),
      ),
      persistentFooterButtons: [
        FlatButton(
            onPressed: () {
              addfav(mealid);
            },
            child: isfav(mealid) ? Icon(Icons.star) : Icon(Icons.star_border))
      ],
    );
  }

  Widget builtstyle(BuildContext context, String text) {
    return Container(
      child: Text(text, style: Theme.of(context).textTheme.headline6),
    );
  }
}

Widget liststyle(BuildContext context, Widget child) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
    ),
    height: 140,
    width: 300,
    child: child,
  );
}
