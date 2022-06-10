import 'package:flutter/material.dart';
import 'Models/Product_model.dart';
import 'Models/Category_model.dart';
import 'package:badges/badges.dart';
import 'package:fabrest/bloc/cart_bloc.dart';
import 'package:fabrest/bloc/cart_event.dart';
import 'package:fabrest/bloc/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:fabrest/CartShow.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Models/Product_model.dart';
import 'Product_scr.dart';

class CatalogScr extends StatelessWidget {
  final Category category;

  const CatalogScr({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<Product> CategoryProduct = Product.products
        .where((product) => product.category == category.name )
        .toList();
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: Text(
          category.name,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
        actions: [IconButton(
            onPressed: () {
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => CartScreen()));
    },
      icon: Badge(
          badgeColor: Colors.red,
          child: Icon(
            Icons.shopping_cart,
            color: Colors.white,
            size: 20,
          )),
    )
    ],),

        body:


              ListView.builder(
                  itemCount: CategoryProduct.length,
                  itemBuilder: (context, index) {
                    return ProductCard(product: CategoryProduct[index]);
                  })
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Product_Scr(product: product)));},
                    child: Image(
                        height: 100,
                        width: 100,
                        image: NetworkImage(product.imageUrl)),
                  ),
                  Expanded(
                      child: Column(children: [
                    Text(
                      product.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      product.price.toString() +
                          " " +
                          r"Rs" +
                          product.units.toString(),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    BlocBuilder<CartBLoc, CartState>(builder: (context, state) {
                      if (state is Cartloading)
                        return CircularProgressIndicator();
                      if (state is Cartloaded) {
                        return Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                              onPressed: () {
                                context.read<CartBLoc>().add(
                                      ProductAdded(product),
                                    );
                                final snackbar = SnackBar(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 5, horizontal: 5),
                                    backgroundColor: Colors.blueAccent,
                                    elevation: 6,
                                    content: Text(
                                      "Product Added to cart",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackbar);
                              },
                              icon: Icon(
                                Icons.add_shopping_cart_outlined,
                                color: Colors.green,
                                size: 40,
                              )),
                        );
                      } else
                        return Text("Something Went wrong");
                    })
                  ])),
                ]),
          ]),
    );
  }
}
