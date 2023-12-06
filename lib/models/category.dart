import 'package:flutter/material.dart';

class Category {
 const Category({required this.id, required this.name, this.color = Colors.orange}); 
  //sana herhangi bir değer verilmezse senin rengin orange olsun demiş oluyoruz
  final String id;
  final String name;
  final Color color;
}
