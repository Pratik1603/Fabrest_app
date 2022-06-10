import 'package:fabrest/bloc/cart_event.dart';
import 'package:fabrest/bloc/cart_state.dart';
import 'package:fabrest/Cart.dart';
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartBLoc extends Bloc<CartEvent, CartState> {
  CartBLoc() : super(Cartloading());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is CartStarted) {
      yield* _mapCartStartedToState();
    } else if (event is ProductAdded) {
      yield* _mapProductAddedToState(event, state);
    } else if (event is ProductRemoved) {
      yield* _mapProductRemovedToState(event, state);
    }
  }

  Stream<CartState> _mapCartStartedToState() async* {
    yield Cartloading();
    try {
      await Future<void>.delayed(Duration(seconds: 1));
      yield Cartloaded();
    } catch (_) {}
  }

  Stream<CartState> _mapProductAddedToState(
      ProductAdded event, CartState state) async* {
    if (state is Cartloaded) {
      try {
        yield Cartloaded(
            cart: Cart(
                products: List.from(state.cart.products)..add(event.product)));
      } catch (_) {}
    }
  }

  Stream<CartState> _mapProductRemovedToState(
      ProductRemoved event, CartState state) async* {
    if (state is Cartloaded) {
      try {
        yield Cartloaded(
            cart: Cart(
                products: List.from(state.cart.products)
                  ..remove(event.product)));
      } catch (_) {}
    }
  }
}
