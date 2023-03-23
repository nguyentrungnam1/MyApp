// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:my_app/store/repository/product_repository.dart';
import 'package:my_app/store/store.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductRepository api = ProductRepository();
  ProductBloc() : super(ProductState()) {
    on<StoreProductRequest>(
      (event, emit) async {
        try {
          emit(state.copywith1(storeRequest: StoreRequest.requestInProcess));

          final reponse = await api.getProduct();
          emit(state.copywith1(
              storeRequest: StoreRequest.requestSuccess, products: reponse));
        } catch (e) {
          emit(state.copywith1(storeRequest: StoreRequest.requestFailure));
        }
      },
    );
    on<AddProductToCart>((event, emit) async {
      emit(state.copywith1(cartId: {...state.cartId, event.cartId}));
    });
    on<RemoveProductFromCart>((event, emit) async {
      emit(state.copywith1(cartId: {...state.cartId}..remove(event.cartId)));
    });
  }
}

// Future<void> _handleGetProducts(
//     StoreProductRequest event, Emitter<ProductState> emit) async {
//       try {
//         emit()
//       } catch (e) {
        
//       }
//     }
