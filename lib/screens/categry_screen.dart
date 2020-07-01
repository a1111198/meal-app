import 'package:flutter/material.dart';
import '../data/dummy.dart';
import '../widgets/category_item.dart';

class Categoriescreen extends StatelessWidget {
  const Categoriescreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 1.5,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES
            .map((cd) =>
                CategoryItem(id: cd.id, title: cd.title, color: cd.color))
            .toList());
  }
}
