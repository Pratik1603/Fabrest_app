import 'package:fabrest/SignUp.dart';
import 'package:fabrest/CartShow.dart';
import 'package:fabrest/Services/AuthGoogle.dart';
import 'Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:fabrest/Models/Product_model.dart';
import 'package:flutter/rendering.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'Models/Category_model.dart';
import 'Category_scr.dart';
import 'package:badges/badges.dart';
import 'Product_scr.dart';

class MainScr extends StatefulWidget {
  const MainScr({Key? key}) : super(key: key);
  static const String id = 'mainscr';

  @override
  State<MainScr> createState() => _MainScrState();
}

class _MainScrState extends State<MainScr> {
  @override
  AuthClass authClass = AuthClass();

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "           Fabrest",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 30,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: ()  {

                },
                icon: Icon(Icons.notifications, color: Colors.white, size: 20)),
            IconButton(
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
          ],
        ),
        drawer: Drawer(elevation: 8,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(border: Border.all(color: Colors.white,width: 3),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://img.freepik.com/free-vector/sale-banner-template-design_74379-121.jpg?w=1060'))),
                      ),

                    ],
                  ),
                ),
              ),
              Card(elevation:10,
                child: ListTile(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>MyProfile()));},leading:Icon(Icons.account_circle,size: 50,color:Colors.blue),title: Text("   My Profile",style:TextStyle(color:Colors.blue,
                    fontWeight: FontWeight.bold, fontSize: 20) ,),),
              ),
              Card(elevation:10,
                child: ListTile(onTap:(){Navigator.push(context,MaterialPageRoute(builder: (context)=>CartScreen()));},leading:Icon(Icons.shopping_cart,size: 50,color:Colors.blue),title: Text("   My Cart",style:TextStyle(color:Colors.blue,
                    fontWeight: FontWeight.bold, fontSize: 20) ,),),
              ),
              Card(elevation:10,
                child: ListTile(onTap:() async {
                  await authClass.SignOut();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AuthPage()));
                },
                  leading:Icon(Icons.logout,size: 50,color:Colors.blue),title: Text("   Log Out",style:TextStyle(color:Colors.blue,
                    fontWeight: FontWeight.bold, fontSize: 20) ,),),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            MyBody(),
            Container(
                height: 240,
                child: Card(
                    child: ListView.builder(
                        itemCount: Category.category.length,
                        itemBuilder: (context, index) {
                          return Categories(
                            category: Category.category[index],
                          );
                        })))
          ],
        ));
  }
}

class CustomSearchDelegate extends SearchDelegate<Product> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
    throw UnimplementedError();
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainScr()));
        },
        icon: Icon(Icons.arrow_back));
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(
    BuildContext context,
  ) {
    final myList = query.isEmpty
        ? Product.products
        : Product.products
            .where((element) => element.name.startsWith(query))
            .toList();
    return myList.isEmpty
        ? Text(
            "No Result Found....",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        : ListView.builder(
            itemCount: myList.length,
            itemBuilder: (context, index) {
              final Product product = myList[index];

              return ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Product_Scr(product: product)));
                },
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      product.category,
                      style: TextStyle(fontSize: 10),
                    ),
                    Divider(
                      height: 20,
                      color: Colors.black,
                    )
                  ],
                ),
              );
            });
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}

class MyBody extends StatefulWidget {
  MyBody({Key? key}) : super(key: key);

  @override
  State<MyBody> createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  double scrollerPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 5,
      ),
      Padding(
        padding: EdgeInsets.only(left: 8, right: 8),
        child: Container(
          color: Colors.blue,
          height: 30,
          child: Card(
            color: Colors.blue,
            child: InkWell(
              onTap: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
              child: Container(
                color: Colors.white,
                height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Search for Products...    ",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.black87),
                    ),
                    SizedBox(width: 90),
                    Container(
                        color: Colors.yellow,
                        width: 80,
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      Container(
        height: 300,
        child: PageView(
          onPageChanged: (val) {
            setState(() {
              scrollerPosition = val.toDouble();
            });
          },
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Image.network(
              'https://img.freepik.com/free-vector/sale-banner-template-design_74379-121.jpg?w=1060',
              width: 400,
            ),
            Image.network(
              'https://th.bing.com/th/id/OIP.3aPsHmwogdO-9pUT8XfM7wHaFS?pid=ImgDet&rs=1',
              width:450,
            ),
          ],
        ),
      ),
      DotsIndicator(
        dotsCount: 2,
        position: scrollerPosition,
        decorator:
            DotsDecorator(color: Colors.black, activeColor: Colors.blueAccent),
      ),
    ]);
  }
}

class Categories extends StatelessWidget {
  final Category category;

  const Categories({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CatalogScr(category: category)));
      },
      child: Card(
          color: Colors.blueAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                category.name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 20,
              ),
              CircleAvatar(radius: 55,backgroundColor: Colors.white,
                child: Image.network(
                  category.image,
                  height: 90,
                  width: 80,
                ),
              ),
            ],
          )),
    );
  }
}
