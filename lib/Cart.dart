import 'package:equatable/equatable.dart';
import 'package:fabrest/Models/Product_model.dart';

class Cart extends Equatable {
  final List<Product> products;

  const Cart({this.products = const<Product>[]}); // empty list of products

  @override
  // TODO: implement props
  List<Object?> get props => [products];
  Map ProductQuantity (products){
    var quantity=Map();
    products.forEach((product){
      if(!quantity.containsKey(product)){
        quantity[product]=1;
      }
      else
        {
          quantity[product]+=1;
        }
    });
    return quantity;
  }

  double get subtotal =>
      products.fold(0, (total, current) => total + current.price);

  double delievryFee(subtotal) {
    if (subtotal >= 500) {
      return 0;
    }

    else {
      return 10;
    }
  }

  double total(subtotal, delievryFee) {
    return subtotal + delievryFee(subtotal);
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get delieveryFeeString => delievryFee(subtotal).toStringAsFixed(2);

  String get totalString => total(subtotal, delievryFee).toStringAsFixed(2);
}





