import 'package:equatable/equatable.dart';
import 'package:fabrest/CartShow.dart';

import '../Models/Product_model.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object > get props =>[];
}

class CartStarted extends CartEvent{
  @override
  List<Object > get props =>[];

}
class ProductAdded extends CartEvent{
  final Product product;
  ProductAdded(this.product);
  @override
  List<Object > get props =>[product];
}
class ProductRemoved extends CartEvent{
  final Product product;
  ProductRemoved(this.product);
  @override
  List<Object > get props =>[product];
}
