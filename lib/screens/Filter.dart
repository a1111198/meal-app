import 'package:flutter/material.dart';
import 'package:meal_app/widgets/maindrawer.dart';

class Filters extends StatefulWidget {
  static const routeName = '/filter';
  final Function filtersettings;
  final Map<String, bool> filters;
  Filters(this.filters, this.filtersettings);
  @override
  _FiltersState createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  var gf = false;
  var veg = false;
  var vegeterian = false;
  var lac = false;

  @override
  void initState() {
    gf = widget.filters['gf'];
    veg = widget.filters['vag'];
    vegeterian = widget.filters['vegeterian'];
    lac = widget.filters['lac'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
          actions: [
            IconButton(
                icon: Icon(Icons.save),
                onPressed: () {
                  widget.filtersettings({
                    'gf': gf,
                    'vag': veg,
                    'vegeterian': vegeterian,
                    'lac': lac
                  });
                })
          ],
        ),
        drawer: DrawerCustom(),
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Text('ADD your selection',
                  style: Theme.of(context).textTheme.headline6),
            ),
            Expanded(
                child: ListView(
              children: [
                customSwitch(
                  'Gluteen Free',
                  "Include only Gluteen Free",
                  gf,
                  (newvalue) {
                    setState(() {
                      gf = newvalue;
                    });
                  },
                ),
                customSwitch(
                  'Lactose Free',
                  'Include only Lactose Free',
                  lac,
                  (newvalue) {
                    setState(() {
                      lac = newvalue;
                    });
                  },
                ),
                customSwitch(
                  'Vegetarian',
                  'Inclue only Vegeterian meals',
                  vegeterian,
                  (newvalue) {
                    setState(() {
                      vegeterian = newvalue;
                    });
                  },
                ),
                customSwitch(
                  'Vegan',
                  'Include only Vegan Free',
                  veg,
                  (newvalue) {
                    setState(() {
                      veg = newvalue;
                    });
                  },
                )
              ],
            ))
          ],
        ));
  }

  Widget customSwitch(
      String title, String subtitle, bool val, Function update) {
    return SwitchListTile(
      title: Text(title),
      onChanged: (newvalue) {
        update(newvalue);
      },
      value: val,
      subtitle: Text(subtitle),
    );
  }
}
