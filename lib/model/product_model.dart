import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final String id;
  final String name;
  final Image image;
  Product({required this.id, required this.name, required this.image});
  @override
  List<Object?> get props => [id, name, image];

  static List<Product> products = [
    Product(id: "1", name: "test1", image: Image.asset("assets/images/1.png")),
    Product(id: "2", name: "test2", image: Image.asset("assets/images/2.png"))
  ];
}
