import 'package:flutter/material.dart';
import 'package:managerrestaurant/loginform.dart';
import 'package:managerrestaurant/management.dart';
import 'package:managerrestaurant/menu.dart';
const listroute = ['/login','/menu','/management'];

void main() {
  runApp( MaterialApp(

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



