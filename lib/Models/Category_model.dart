import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String image;

  const Category({
    required this.name,
    required this.image,
}
);


  @override
  // TODO: implement props
  List<Object?> get props => [
    name,
    image,
  ];

  static List<Category> category=[
    Category(
      name:"Fruits & Vegetables",
      image: 'https://th.bing.com/th/id/OIP.vCKIg48ccVjnwcHET7lB2gHaGI?pid=ImgDet&rs=1',
    ),
    Category(
      name:"MILK PRODUCTS",
      image: 'https://www.bing.com/th/id/OIP.-cRB0tyRZGovptqhbtLQdAHaDs?w=328&h=174&c=7&r=0&o=5&dpr=1.5&pid=1.7',
    ),
    Category(
      name:"CLOTHING & FOOTWEAR",
      image: 'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/3/25/badf2a5d-ebb6-4b18-97b9-c34b10cddbf01553516913482-1.jpg',
    ),
    Category(
      name:"ELECTRONICS",
      image: 'https://th.bing.com/th/id/OIP.h57TswrkyeEWHqN_9iVa9AHaFj?pid=ImgDet&rs=1',
    ),
    Category(
      name:"FURNITURE",
      image: 'https://th.bing.com/th/id/OIP.4ev-DQ-S7ITICxPleRXtrQHaCg?pid=ImgDet&rs=1',
    )
  ];
}
