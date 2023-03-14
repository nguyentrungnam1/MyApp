part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductLoadedCounter extends ProductEvent {}

class AddProduct extends ProductEvent {
  final Product product;

  const AddProduct({required this.product});

  @override
  List<Object> get props => [product];
}

class RemoveProduct extends ProductEvent {
  final Product product;

  const RemoveProduct({required this.product});

  @override
  List<Object> get props => [product];
}
