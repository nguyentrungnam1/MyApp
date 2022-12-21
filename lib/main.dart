import 'package:flutter/material.dart';
import 'package:my_app/page/cart_page/CartPage.dart';
import 'package:my_app/page/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/": (context) => const MyHomePage(),
        "cartPage": (context) => const CartPage()
      },
      // home: const MyHomePage(),
    );
  }
}
