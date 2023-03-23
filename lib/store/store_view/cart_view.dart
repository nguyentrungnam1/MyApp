import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:my_app/store/store.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cartProduct = context.select<ProductBloc, List<Product>>(
      (value) {
        return value.state.products
            // ignore: iterable_contains_unrelated_type
            .where((element) => value.state.cartId.contains(element.id))
            .toList();
      },
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My Cart",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: GridView.builder(
          itemCount: cartProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            final product = cartProduct[index];

            return Padding(
              padding: const EdgeInsets.all(5),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 1,
                        spreadRadius: 2,
                        offset: Offset(0, 2), // Shadow position
                      ),
                    ]),
                width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  children: [
                    Flexible(
                        child: Image.network(
                      product.image,
                      width: 150,
                      height: 150,
                    )),
                    Text(
                      product.title,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton(
                          onPressed: () {
                            context
                                .read<ProductBloc>()
                                .add(RemoveProductFromCart(cartId: product.id));
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll<Color>(
                                  Colors.grey.withOpacity(0.5))),
                          child: Row(children: const [
                            Icon(
                              Icons.remove_shopping_cart,
                              color: Colors.grey,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Remove From cart",
                              style: TextStyle(color: Colors.grey),
                            )
                          ])),
                    )
                  ],
                ),
              ),
            );
          },
        ));
  }
}
