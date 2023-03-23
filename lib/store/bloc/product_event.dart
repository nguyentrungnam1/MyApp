abstract class ProductEvent {}

class StoreProductRequest extends ProductEvent {}

class AddProductToCart extends ProductEvent {
  int cartId;
  AddProductToCart({required this.cartId});
}

class RemoveProductFromCart extends ProductEvent {
  int cartId;
  RemoveProductFromCart({required this.cartId});
}
