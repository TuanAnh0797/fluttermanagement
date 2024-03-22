import 'package:flutter/material.dart';
import 'package:managerrestaurant/loginform.dart';
import 'package:managerrestaurant/management.dart';
import 'package:managerrestaurant/menu.dart';
const listroute = ['/login','/menu','/management'];

void main() {
  ColorScheme kColorschem = ColorScheme.fromSeed(seedColor: Color.fromARGB(10, 20, 30, 40));
  runApp( MaterialApp(

    theme: ThemeData().copyWith(
      cardTheme: CardTheme().copyWith(color: Colors.white)
    ),
    initialRoute: listroute[0],
    routes: {
      listroute[0]: (context) => const loginform(),
      listroute[1]: (context) => const menuform(),
      listroute[2]: (context) => const management(),
    },
    debugShowCheckedModeBanner: false,
  )
  );
}



