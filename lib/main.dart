import 'package:flutter/material.dart';
import 'package:meals_app/models/category.dart';
import 'package:meals_app/screens/categories.dart';

final theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
        brightness: Brightness.dark,
        seedColor: const Color.fromARGB(255, 212, 212, 30)));

void main() {
  runApp(MaterialApp(theme: theme, home: const Categories()));
}