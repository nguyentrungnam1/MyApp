import 'package:my_app/store/store.dart';

enum StoreRequest { unknow, requestInProcess, requestSuccess, requestFailure }

class ProductState {
  List<Product> products;

  StoreRequest request;
  Set<int> cartId;

  ProductState(
      {this.products = const [],
      this.request = StoreRequest.unknow,
      this.cartId = const {}});
  ProductState copywith1(
          {List<Product>? products,
          StoreRequest? storeRequest,
          Set<int>? cartId}) =>
      ProductState(
          products: products ?? this.products,
          request: storeRequest ?? request,
          cartId: cartId ?? this.cartId);
}
