import 'package:flutter/material.dart';
import 'package:meal_app/screens/favourites.dart';
import 'package:meal_app/widgets/maindrawer.dart';
import './categry_screen.dart';

class TabScreen extends StatefulWidget {
  final List<String> favid;
  TabScreen(this.favid);
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  List<Map<String, dynamic>> pages;
  @override
  void initState() {
    pages = [
      {
        'page': Categoriescreen(),
        'title': 'Categories',
      },
      {
        'page': Favourites(widget.favid),
        'title': 'Your Favourites',
      }
    ];
    super.initState();
  }

  int selectedindex = 0;
  void _selectpage(int index) {
    setState(() {
      selectedindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return
        //DefaultTabController(
        //       initialIndex: 0,
        //       length: 2,
        //       child: Scaffold(
        //           appBar: AppBar(
        //             title: Text('Meals'),
        //             bottom: TabBar(tabs: [
        //               Tab(
        //                   icon: Icon(
        //                     Icons.category,
        //                   ),
        //                   text: 'categories'),
        //               Tab(icon: Icon(Icons.star), text: 'faverouites')
        //             ]),
        //           ),
        //           body: TabBarView(children: [Categoriescreen(), Favourites()])));
        Scaffold(
      appBar: AppBar(
        title: SafeArea(child: Text(pages[selectedindex]['title'])),
      ),
      drawer: SafeArea(child: DrawerCustom()),
      body: pages[selectedindex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: selectedindex,
        onTap: _selectpage,
        type: BottomNavigationBarType.shifting,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: Text('categories'),
              backgroundColor: Theme.of(context).primaryColor),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Favourites'),
          )
        ],
      ),
    );
  }
}
