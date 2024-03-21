//import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final formatdate = DateFormat.yMd();
const uuid = Uuid();
enum Category {StickyRice, Bread, Drink}
const IconCategory = {
  Category.Bread : 'assets/pngimage/bread.png',
  Category.StickyRice : 'assets/pngimage/stickyrice.png',
  Category.Drink: 'assets/pngimage/drinks.png'
};
const NameCategory = {
  Category.Bread: 'Bánh mì',
  Category.Drink: 'Đồ uống',
  Category.StickyRice: 'Xôi'
};
// - assets/pngimage/bread.png
// - assets/pngimage/drinks.png
// - assets/pngimage/stickyrice.png
class product{
  final String id;
  final String title;
  final int amount;
  final DateTime date;
  final Category cate;

  product({required this.title, required this.amount, required this.date, required this.cate}):id=uuid.v4();

  String get formattedDate{
    return formatdate.format(date);
  }
}