import 'dart:convert';

import 'package:fabrest/bloc/cart_bloc.dart';
import 'package:fabrest/bloc/cart_event.dart';
import 'package:fabrest/bloc/cart_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fabrest/Models/Product_model.dart';
import 'package:fabrest/Cart.dart';

//
//
class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MY CART"),
          centerTitle: true,

        ),
        body: BlocBuilder<CartBLoc, CartState>(builder: (context, state) {
          if (state is Cartloading)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (state is Cartloaded)
            return Column(children: [
              SizedBox(
                  height: 410,
                  child: ListView.builder(
                      itemCount: state.cart
                          .ProductQuantity(state.cart.products)
                          .keys
                          .length,
                      itemBuilder: (context, index) {
                        return CartProductCard(
                          product: state.cart
                              .ProductQuantity(state.cart.products)
                              .keys
                              .elementAt(index),
                          quantity: state.cart
                              .ProductQuantity(state.cart.products)
                              .values
                              .elementAt(index),
                        );
                      })),



              Container(height:193,

                decoration: BoxDecoration( color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Subtotal",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text('${state.cart.subtotalString.toString()} Rs',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Delivery Charges",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text('${state.cart.delieveryFeeString.toString()} Rs',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Card(
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: BorderSide(
                            width: 3,
                            color: Colors.deepPurple,
                          ),
                        ),
                        child: Container(

                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.orange,

                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "Total = ${state.cart.totalString} Rs",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            height: 50,
                            width: 440,
                            padding: EdgeInsets.all(5),
                            child: Card(
                              color: Colors.orange,
                              elevation: 20,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: BorderSide(
                                  width: 3,
                                  color: Colors.deepPurple,
                                ),
                              ),
                              child: Center(
                                  child: Text(
                                "MAKE PAYMENT",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Colors.white),
                              )),
                            )),
                      )
                    ]),
              ),
            ]);
          else
            return Text("Some error is there");
        }));

//     //
  }
}

//
class CartProductCard extends StatelessWidget {
  final Product product;
  final int quantity;

  const CartProductCard(
      {Key? key, required this.product, required this.quantity})
      : super(key: key);

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
                  Image(
                      height: 100,
                      width: 100,
                      image: NetworkImage(product.imageUrl)),
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
                            child: Row(children: [
                              SizedBox(width: 180),
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read<CartBLoc>()
                                        .add(ProductAdded(product));
                                  },
                                  icon: Icon(
                                    Icons.add_circle_sharp,
                                    color: Colors.green,
                                    size: 40,
                                  )),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '$quantity',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              IconButton(
                                  onPressed: () {
                                    context
                                        .read<CartBLoc>()
                                        .add(ProductRemoved(product));
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_sharp,
                                    color: Colors.green,
                                    size: 40,
                                  ))
                            ]));
                      } else {
                        return Text("Something Went Wrong");
                      }
                    })
                  ])),
                ]),
          ]),
    );
  }
}
