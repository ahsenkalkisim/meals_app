import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/providers/meals_provider.dart';
import 'package:meals_app/widgets/meal_card.dart';

// Provider'a erişmek isteyen widgetlar
// RiverPod widgetları olmalı.

// StatelessWidget => ConsumerWidget
class MealList extends ConsumerWidget {
  const MealList({Key? key, required this.meals}) : super(key: key);
  final List<Meal> meals;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsFromState =
        ref.watch(mealsProvider); // global stateden veri okumak

    Widget widget = ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: meals.length,
        itemBuilder: (ctx, index) => MealCard(meal: meals[index]));

    if (meals.isEmpty) {
      widget = const Center(
        child: Text("Bu kategoride hiç bir içerik bulunmamaktadır."),
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text("Yemek Listesi"),
        ),
        body: widget);
  }
}
