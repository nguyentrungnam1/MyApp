import 'package:flutter/material.dart';
import 'package:my_app/page/cart_page/cart_item.dart';
import 'package:my_app/page/cart_page/widget/app_bar.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const AppBarCart(),
          Container(
            height: 500,
            decoration: BoxDecoration(
                color: Color(0xFFEEEDF3),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: CartItem(),
          )
        ],
      ),
    );
  }
}
