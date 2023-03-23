import 'package:flutter/material.dart';
import 'package:my_app/store/store.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: const StoreView(),
      ),
    );
  }
}

class StoreView extends StatelessWidget {
  const StoreView({super.key});
  void _handleAddToCart(BuildContext context, int cartId) {
    context.read<ProductBloc>().add(AddProductToCart(cartId: cartId));
  }

  void _handleRemoveFromCart(BuildContext context, int cartId) {
    context.read<ProductBloc>().add(RemoveProductFromCart(cartId: cartId));
  }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    void _viewCart() {
      Navigator.push(
        context,
        PageRouteBuilder(
            transitionsBuilder: (_, animation, __, child) {
              return SlideTransition(
                position: Tween(
                  begin: const Offset(0, 1),
                  end: Offset.zero,
                ).animate(animation),
                child: BlocProvider.value(
                  value: context.read<ProductBloc>(),
                  child: child,
                ),
              );
            },
            pageBuilder: (_, __, ___) => const CartScreen()),
      );
    }

    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state.request == StoreRequest.requestInProcess) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.request == StoreRequest.requestFailure) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("requestFailure"),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<ProductBloc>().add(StoreProductRequest());
                      },
                      child: const Text("try again")),
                )
              ],
            );
          }
          if (state.request == StoreRequest.unknow) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("I don't know"),
                Center(
                  child: ElevatedButton(
                      onPressed: () {
                        context.read<ProductBloc>().add(StoreProductRequest());
                      },
                      child: const Text("try again")),
                )
              ],
            );
          }
          return GridView.builder(
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final product = state.products[index];
              final inCart = state.cartId.contains(product.id);
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
                            onPressed: inCart
                                ? () =>
                                    _handleRemoveFromCart(context, product.id)
                                : () => _handleAddToCart(context, product.id),
                            style: ButtonStyle(
                                backgroundColor: inCart
                                    ? MaterialStatePropertyAll<Color>(
                                        Colors.grey.withOpacity(0.5))
                                    : null),
                            child: Row(
                              children: inCart
                                  ? const [
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
                                    ]
                                  : const [
                                      Icon(Icons.add_shopping_cart),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Add to cart")
                                    ],
                            )),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: 0,
            bottom: 0,
            child: FloatingActionButton(
              onPressed: _viewCart,
              child: const Icon(Icons.shopping_cart),
            ),
          ),
          BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              return Positioned(
                  right: -4,
                  bottom: 35,
                  child: state.cartId.isEmpty
                      ? const SizedBox()
                      : CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                          child: Text("${state.cartId.length}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        ));
            },
          )
        ],
      ),
    );
  }
}
