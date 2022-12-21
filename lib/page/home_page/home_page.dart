import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:my_app/common/colors.dart';
import 'package:my_app/page/home_page/widget/app_bar_home.dart';
import 'package:my_app/page/home_page/widget/body_home.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          AppBarHome(),
          BodyHomePage(),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          color: AppColors.primaryColor,
          backgroundColor: Colors.transparent,
          items: const [
            Icon(
              Icons.shopping_cart,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.home,
              size: 30,
              color: Colors.white,
            ),
            Icon(
              Icons.list,
              size: 30,
              color: Colors.white,
            ),
          ]),
    );
  }
}
