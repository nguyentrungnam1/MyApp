import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:my_app/model/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductLoadedCounter>((event, emit) async {
      await Future.delayed(Duration(seconds: 2));
      emit(const ProductLoaded(product: <Product>[]));
    });

    on<AddProduct>((event, emit) {
      if (state is ProductLoaded) {
        final state = this.state as ProductLoaded;
        emit(ProductLoaded(
            product: List.from(state.product)..add(event.product)));
      }
    });

    on<RemoveProduct>((event, emit) {
      if (state is ProductLoaded) {
        final state = this.state as ProductLoaded;
        emit(ProductLoaded(
            product: List.from(state.product)..remove(event.product)));
      }
    });
  }
}
