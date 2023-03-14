import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/bloc/bloc/product_bloc.dart';
import 'package:my_app/model/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductBloc()..add(ProductLoadedCounter()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            if (state is ProductInitial) {
              return const CircularProgressIndicator();
            }
            if (state is ProductLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    color: Colors.orange,
                  ),
                  Text(
                    "${state.product.length}",
                    style: TextStyle(color: Colors.orange, fontSize: 30),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      alignment: Alignment.center,
                      clipBehavior: Clip.none,
                      children: [
                        for (int index = 0;
                            index < state.product.length;
                            index++)
                          Positioned(
                              left: Random().nextInt(250).toDouble(),
                              right: Random().nextInt(400).toDouble(),
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: state.product[index].image,
                              ))
                      ],
                    ),
                  )
                ],
              );
            } else {
              return Text("something wrong");
            }
          },
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  context
                      .read<ProductBloc>()
                      .add(AddProduct(product: Product.products[1]));
                },
                child: Icon(Icons.add)),
            ElevatedButton(
                onPressed: () {
                  context
                      .read<ProductBloc>()
                      .add(RemoveProduct(product: Product.products[1]));
                },
                child: Icon(Icons.remove)),
          ],
        ));
  }
}
