import 'package:flutter/material.dart';
import 'package:meals_app/data/datas.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/meal_list.dart';
import 'package:meals_app/widgets/category_card.dart';
import 'package:meals_app/widgets/drawer_menu.dart';

class Categories extends StatelessWidget {
  const Categories({Key? key}) : super(key: key);

  // Stful widgetlarda => context globaldir
  // Stless widgetlarda => Sadece build fonksiyonunda context'e erişilebilir.
  void _selectCategory(BuildContext context, Category category) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealList(
            meals: meals
                .where((element) => element.categoryId == category.id)
                .toList())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(title: const Text("Bir kategori seçin")),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 2),
        children: [
          for (final category in categories)
            CategoryCard(
              category: category,
              onSelectCategory: () {
                _selectCategory(context, category);
              },
            )
        ],
      ),
    );
  }
}
