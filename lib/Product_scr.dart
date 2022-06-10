import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_nullsafety/carousel_nullsafety.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Models/Product_model.dart';
import 'bloc/cart_bloc.dart';
import 'bloc/cart_event.dart';
import 'bloc/cart_state.dart';
import 'CartShow.dart';

class Product_Scr extends StatelessWidget {
  final Product product;

  const Product_Scr({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
          actions:[IconButton(
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
          ]
      ),
      body: Card(
        elevation: 10,
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [

            Center(
                child: Text(
              product.name,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  fontStyle: FontStyle.italic),
            )),

            favourite(),
          ]),
          Card(
            elevation: 20,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: 215,
                decoration: BoxDecoration(
                  color: product.color,
                ),
                child: Column(children: [
                  SizedBox(height: 15),
                  Container(
                    height: 200,
                    child: Carousel(images: [
                      Image.network(
                        product.imageUrl,
                        width: 500,
                      ),
                      Image.network(
                        product.imageUrl,
                        width:500 ,
                      ),
                    ]),
                  ),
                ])),
          ),
          SizedBox(
            height: 7,
          ),
          product.isfoot == true
              ? Align(alignment: Alignment.centerLeft, child: Dsize())
              : product.iscloth == true
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Csize(),
                    )
                  : SizedBox(height: 17),
          SizedBox(
            height: 20,
          ),
          Divider(
            thickness: 5,
            color: Colors.deepPurple,
          ),
          Container(
              height: 200,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(children: [
                  Text(
                    "PRODUCT DESCRIPTION",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.all(7),
                    width: 370,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Color(0xC8E0ECFF),
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Text(
                          product.description,
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        )),
                  ),
                  SizedBox(height: 15),
                  Text(
                    "DELIVERY AND VENDER DETAILS",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      padding: EdgeInsets.all(7),
                      width: 370,
                      height: 150,
                      decoration: BoxDecoration(
                          color: Color(0xC8E0ECFF),
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Text(
                        product.delivery,
                        style: TextStyle(fontSize: 17, color: Colors.black),
                      ),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Price: ${product.price.toString() + product.units.toString()}",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        SizedBox(width: 10),
                        Card(
                          elevation: 20,
                          child: BlocBuilder<CartBLoc, CartState>(
                              builder: (context, state) {
                            if (state is Cartloading)
                              return CircularProgressIndicator();
                            if (state is Cartloaded) {
                              return InkWell(
                                onTap: () {
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
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: 60,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      border: Border.all(
                                          color: Colors.deepPurple, width: 4),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(5),
                                      child: Text("ADD TO CART",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                            fontSize: 17,
                                            color: Colors.black,
                                          )),
                                    )),
                              );
                            } else {
                              return Text("Something Went wrong");
                            }
                          }),
                        )
                      ]),
                  SizedBox(
                    height: 20,
                  ),
                  Row(children: [
                    Icon(
                      Icons.call,
                      color: Colors.green,
                      size: 30,
                    ),
                    // SizedBox(width: 20),
                    // Container(child:AddReview(),),
                    //
                    // StreamBuilder(
                    //   stream: FirebaseFirestore.instance.collection('Cart').snapshots(),
                    //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    //     if (!snapshot.hasData) {
                    //       return Center(
                    //         child: CircularProgressIndicator(),
                    //       );
                    //     }
                    //     return ListView(children: <Widget>[
                    //       ...snapshot.data!.docs.map(
                    //             (document) {
                    //           return Container(
                    //             child: Display(name: document['name'], num: document['num'],),
                    //           );
                    //         },
                    //       ),
                    //     ]);
                    //   },
                    // ),
                    SizedBox(width: 20),
                    Text(
                      "Contact Me:",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "9900112233",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    )
                  ])
                ]),
              ))
        ]),
      ),
    );
  }
}
// class ImageDes extends StatefulWidget {
//   const ImageDes({Key? key,required this.product}) : super(key: key);
//   final Product product;
//   @override
//   State<ImageDes> createState() => _ImageDesState();
// }
//
// class _ImageDesState extends State<ImageDes> {
//
//   double scrollerPosition = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column( children:[SizedBox(height :30),Container(
//       height: 200,
//       child: PageView(
//         onPageChanged: (val) {
//           setState(() {
//             scrollerPosition = val.toDouble();
//           });
//         },
//         scrollDirection: Axis.horizontal,
//         children: <Widget>[
//           Image.network(
//             'https://th.bing.com/th/id/OIP.3aPsHmwogdO-9pUT8XfM7wHaFS?pid=ImgDet&rs=1',
//             width: 400,
//           ),
//           Image.network(
//             'https://th.bing.com/th/id/OIP.3aPsHmwogdO-9pUT8XfM7wHaFS?pid=ImgDet&rs=1',
//             width: 450,
//           ),
//         ],
//       ),
//     ),
//         DotsIndicator(
//           dotsCount: 2,
//           position: scrollerPosition,
//           decorator:
//           DotsDecorator(color: Colors.black, activeColor: Colors.blueAccent),
//         ),
//         ]);
//
//   }
// }

class Csize extends StatefulWidget {
  const Csize({Key? key}) : super(key: key);

  @override
  State<Csize> createState() => _CsizeState();
}

class _CsizeState extends State<Csize> {
  Color _color = Colors.black;
  Color _color1 = Colors.black;
  Color _color2 = Colors.black;
  Color _color3 = Colors.black;
  Color _color4 = Colors.black;
  Color _r = Colors.black;
  Color _g = Colors.black;
  Color _b = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 78,
        color: Colors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Choose Size",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text("Choose Color",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.white,),

              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          _color =
                              _color == Colors.red ? Colors.black : Colors.red;
                        });
                      },
                      child: Container(
                        height: 60,
                        width: 40,
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)),
                            color: Colors.white,
                            border: Border.all(color: _color, width: 2)),
                        child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Image.network(
                                "https://th.bing.com/th/id/OIP._BBRYmXILeOynsk_x_4xHwHaHa?pid=ImgDet&rs=1",
                                height: 25)),
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _color1 =
                              _color1 == Colors.red ? Colors.black : Colors.red;
                        });
                      },

                      child: Container(
                          height: 60,
                          width: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)),
                              color: Colors.white,
                              border: Border.all(color: _color1, width: 2)),
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Image.network(
                                  "https://www.bing.com/th?id=OIP.sYl3K4tAiL355Dq5fbiaOwHaHa&w=250&h=250&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2",
                                  height: 25)))),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _color2 =
                              _color2 == Colors.red ? Colors.black : Colors.red;
                        });
                      },
                      child: Container(
                          height: 60,
                          width: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)),
                              color: Colors.white,
                              border: Border.all(color: _color2, width: 2)),
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Image.network(
                                  "https://th.bing.com/th/id/OIP.VSej7FGuyJ_oIRglcsra1QAAAA?pid=ImgDet&rs=1",
                                  height: 25)))),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _color3 =
                              _color3 == Colors.red ? Colors.black : Colors.red;
                        });
                      },
                      child: Container(
                          height: 60,
                          width: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)),
                              color: Colors.white,
                              border: Border.all(color: _color3, width: 2)),
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                 'images/XLicon.png',
                                  height: 25)))),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _color4 =
                              _color4 == Colors.red ? Colors.black : Colors.red;
                        });
                      },
                      child: Container(
                          height: 60,
                          width: 40,
                          decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight:Radius.circular(20)),
                              color: Colors.white,
                              border: Border.all(color: _color4, width: 2)),
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Image.asset(
                                  "images/XXLicon.png" ,
                                  height: 25)))),
                ]),
              ),
            ),
            Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              _r = _r == Colors.red ? Colors.black : Colors.red;
                            });
                          },
                          child: Container(
                            width: 30,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: _r, blurRadius: 7, spreadRadius: 1)
                                ],
                                shape: BoxShape.circle,
                                color: Colors.black,
                                border: Border.all(color: _r, width: 2)),
                          )),
                      SizedBox(
                        width: 2,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _g = _g == Colors.red ? Colors.black : Colors.red;
                            });
                          },
                          child: Container(
                            width: 30,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: _g, blurRadius: 7, spreadRadius: 1)
                                ],
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                border: Border.all(color: _g, width: 2)),
                          )),
                      SizedBox(
                        width: 2,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _b = _b == Colors.red ? Colors.black : Colors.red;
                            });
                          },
                          child: Container(
                            width: 30,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: _b, blurRadius: 7, spreadRadius: 1)
                                ],
                                shape: BoxShape.circle,
                                color: Colors.red,
                                border: Border.all(color: _b, width: 2)),
                          )),
                    ])))
          ]),
        ]));
  }
}

class Dsize extends StatefulWidget {
  const Dsize({Key? key}) : super(key: key);

  @override
  State<Dsize> createState() => _DsizeState();
}

class _DsizeState extends State<Dsize> {
  Color _colour = Colors.black;
  Color _colour1 = Colors.black;
  Color _colour2 = Colors.black;
  Color _colour3 = Colors.black;
  Color _colour4 = Colors.black;
  Color _1r = Colors.black;
  Color _1g = Colors.black;
  Color _1b = Colors.black;
  bool cis = true;
  int a=1;


  @override
  Widget build(BuildContext context) {

    return Container(
        width: MediaQuery.of(context).size.width,
        height: 62,
        color: Colors.white,
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                "Choose Size",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text("Choose Color",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15))
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Container(
              width: 140,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2)),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  InkWell(
                      onTap: () {setState(() {
                        _colour =
                        _colour == Colors.red && cis==true ? Colors.black : Colors.red;

                      } );},
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 2, right: 0, top: 2, bottom: 2),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: _colour, width: 2)),
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Text("7",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25)),
                          ))),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _colour1 =
                              _colour1 == Colors.red ? Colors.black : Colors.red;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 2, right: 0, top: 2, bottom: 2),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: _colour1, width: 2)),
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text("8",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25))))),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _colour2 = _colour2 == Colors.red
                              ? Colors.black
                              : Colors.red;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 2, right: 0, top: 2, bottom: 2),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: _colour2, width: 2)),
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text("9",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25))))),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _colour3 = _colour3 == Colors.red
                              ? Colors.black
                              : Colors.red;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 2, right: 0, top: 2, bottom: 2),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: _colour3, width: 2)),
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text("10",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))))),
                  InkWell(
                      onTap: () {
                        setState(() {
                          _colour4 = _colour4 == Colors.red
                              ? Colors.black
                              : Colors.red;
                        });
                      },
                      child: Container(
                          padding: EdgeInsets.only(
                              left: 2, right: 0, top: 2, bottom: 2),
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: _colour4, width: 2)),
                          child: Padding(
                              padding: EdgeInsets.all(5),
                              child: Text("11",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20))))),

                ]),
              ),
            ),
            Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              _1r =
                                  _1r == Colors.red ? Colors.black : Colors.red;
                            });
                          },
                          child: Container(
                            width: 30,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: _1r,
                                      blurRadius: 7,
                                      spreadRadius: 1)
                                ],
                                shape: BoxShape.circle,
                                color: Colors.black,
                                border: Border.all(color: _1r, width: 2)),
                          )),
                      SizedBox(
                        width: 2,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _1g =
                                  _1g == Colors.red ? Colors.black : Colors.red;
                            });
                          },
                          child: Container(
                            width: 30,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: _1g,
                                      blurRadius: 7,
                                      spreadRadius: 1)
                                ],
                                shape: BoxShape.circle,
                                color: Colors.blue,
                                border: Border.all(color: _1g, width: 2)),
                          )),
                      SizedBox(
                        width: 2,
                      ),
                      InkWell(
                          onTap: () {
                            setState(() {
                              _1b =
                                  _1b == Colors.red ? Colors.black : Colors.red;
                            });
                          },
                          child: Container(
                            width: 30,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: _1b,
                                      blurRadius: 7,
                                      spreadRadius: 1)
                                ],
                                shape: BoxShape.circle,
                                color: Colors.red,
                                border: Border.all(color: _1b, width: 2)),
                          )),
                    ])))
          ]),
        ]));
  }
}

class favourite extends StatefulWidget {
  const favourite({Key? key}) : super(key: key);

  @override
  State<favourite> createState() => _favouriteState();
}

class _favouriteState extends State<favourite> {
  Color _color = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: IconButton(
      onPressed: () {
        setState(() {
          _color = _color == Colors.red ? Colors.grey : Colors.red;
        });
      },
      icon: Icon(
        Icons.favorite,
        color: _color,
        size: 30,
      ),

    ));
  }
}


// class AddReview extends StatelessWidget {
//   AddReview({Key? key}) : super(key: key);
//
//   final _formKey = GlobalKey<FormState>();
//
//   final nameController = TextEditingController();
//   final numberController = TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(height: 60,width :400,
//       child:Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             Text("Views about product "),
//             Expanded(
//               child: TextFormField(
//
//                 controller: nameController,
//                 maxLength: 10,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please add your review';
//                   }
//                   return null;
//                 },
//               ),
//             ),
//             Text("Number"),
//             Expanded(child:
//             TextFormField(
//               controller: numberController,
//               keyboardType: TextInputType.number,
//               maxLength: 10,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter number';
//                 }
//                 return null;
//               },
//             ),),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   contact.updateList(Review(
//                       name: nameController.value.text,
//                       num: numberController.value.text));
//                 }
//               },
//               child: Text("SUBMIT REVIEW"),
//             ),
//           ],
//         ),
//     )
//       );

//   }
// }
// class Display extends StatelessWidget {
//   final String name;
//   final String num;
//   const Display({Key? key,required this.name,required this.num}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(title:Text(name),subtitle:Text(num),)
//       );
//   }
// }



