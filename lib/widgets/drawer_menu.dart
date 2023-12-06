import 'package:flutter/material.dart';
import 'package:meals_app/data/datas.dart';
import 'package:meals_app/screens/meal_list.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Text(
              'Menü',
              style: TextStyle(
                color: Colors.brown,
                fontSize: 24,
              ),
            ),
          ),
          for (var item in categories)
            ListTile(
              leading: const Icon(Icons.home),
              title: Text(item.name),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MealList(
                        meals: meals
                            .where((element) => element.categoryId == item.id)
                            .toList(),
                      ),
                    ));
              },
            )
        ],
      ),
    );
  }
}
