import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Product extends Equatable {
  final String name;
  final String category;
  final String imageUrl;
  final double price;
  final String description;
  final String units;
  final Color color;
  final bool isfoot;
  final bool iscloth;
  final String delivery;

  const Product({
    required this.name,
    required this.category,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.units,
    required this.color,
    required this.isfoot,
    required this.iscloth,
    required this.delivery,
  });

  @override
  List<Object?> get props => [
        name,
        category,
        imageUrl,
        price,
        units,
      ];
  static List<Product> products = [
    Product(
        name: 'Mango',
        units: "/Kg",
        color: Colors.white,
        description:
            "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
        category: 'Fruits & Vegetables',
        price: 80,
        iscloth: false,
        isfoot: false,
        delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
        imageUrl:
            'https://image.shutterstock.com/image-photo/mango-isolated-on-white-background-600w-610892249.jpg'),
    Product(
      name: 'Orange',
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      units: "/Dozen",
      color: Colors.white,
      iscloth: false,
      isfoot: false,
      category: 'Fruits & Vegetables',
      price: 50,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      imageUrl:
          'https://image.shutterstock.com/image-photo/orange-fruit-slices-leaves-isolated-600w-1386912362.jpg',
    ),
    Product(
      name: 'Grapes',
      units: "/Kg",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      color: Colors.white,
      category: 'Fruits & Vegetables',
      price: 500,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      iscloth: false,
      isfoot: false,
      imageUrl:
          'https://image.shutterstock.com/image-photo/green-grape-leaves-isolated-on-600w-533487490.jpg',
    ),
    Product(
      name: 'Banana',
      units: "/dozen",
      color: Colors.white,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      category: 'Fruits & Vegetables',
      price: 52,
      imageUrl:
          'https://media.istockphoto.com/photos/banana-picture-id1184345169?s=612x612',
    ),
    Product(
      name: 'Cherry',
      units: "/Kg",
      color: Colors.white,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      category: 'Fruits & Vegetables',
      price: 70,
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://media.istockphoto.com/photos/cherry-trio-with-stem-and-leaf-picture-id157428769?s=612x612',
    ),
    Product(
      name: 'Peach',
      units: "/Kg",
      price: 10000,
      color: Colors.white,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      iscloth: false,
      isfoot: false,
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      category: 'Fruits & Vegetables',
      imageUrl:
          'https://media.istockphoto.com/photos/single-whole-peach-fruit-with-leaf-and-slice-isolated-on-white-picture-id1151868959?s=612x612',
    ),
    Product(
      name: 'Mixed Fruit Basket',
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      units: "/Kg",
      price: 300,
      iscloth: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      isfoot: false,
      color: Colors.white,
      category: 'Fruits & Vegetables',
      imageUrl:
          'https://media.istockphoto.com/photos/fruit-background-picture-id529664572?s=612x612',
    ),
    Product(
      name: 'Toned Milk',
      units: "/500 ml",
      color: Colors.white,
      iscloth: false,
      isfoot: false,
      price: 24,
      category: 'MILK PRODUCTS',
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://5.imimg.com/data5/JM/OE/IQ/ANDROID-10279412/product-jpeg-250x250.jpg',
    ),
    Product(
      name: 'Double Toned Milk',
      units: "/500 ml",
      price: 21,
      color: Colors.white,
      iscloth: false,
      isfoot: false,
      category: 'MILK PRODUCTS',
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://n1.sdlcdn.com/imgs/c/3/8/Amul-Toned-Milk-500-ml-SDL536586268-1-1843c.jpg',
    ),
    Product(
      name: 'Full cream',
      units: "/500 ml",
      price: 29,
      color: Colors.white,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      iscloth: false,
      isfoot: false,
      category: 'MILK PRODUCTS',
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://5.imimg.com/data5/XR/MH/YG/SELLER-91413102/amul-gold-full-cream-milk-.jpg',
    ),
    Product(
      name: 'Amul Cool',
      units: "/180 ml",
      price: 30,
      color: Colors.white,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      category: 'MILK PRODUCTS',
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://rozaanaonline.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/1/-/1-1001699_1.jpg',
    ),
    Product(
      name: 'Dahi',
      units: "/200 gm",
      price: 15,
      color: Colors.white,
      category: 'MILK PRODUCTS',
      iscloth: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      isfoot: false,
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl: 'https://4.imimg.com/data4/KB/MX/MY-9600007/dahi.jpg',
    ),
    Product(
      name: 'Butter',
      units: "/100 gm",
      price: 48,
      color: Colors.white,
      iscloth: false,
      isfoot: false,
      category: 'MILK PRODUCTS',
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://th.bing.com/th/id/R.5221bc05d283be08747affe17daffa9b?rik=JMdDe4x%2bv39MTg&riu=http%3a%2f%2fwww.dudhsagardairy.coop%2fwp-content%2fuploads%2f2014%2f04%2f3-Amul-Butter-4.jpg&ehk=iawA3gs9%2fv7md7VwoMg6HA8bf8LuL5xc3YeMt44X6Hg%3d&risl=&pid=ImgRaw&r=0',
    ),
    Product(
      name: 'Cheese',
      units: "/200 gm",
      price: 120,
      color: Colors.white,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description: "Made From Fresh cow milk,amul cheese asli cheese",
      category: 'MILK PRODUCTS',
      imageUrl:
          'https://th.bing.com/th/id/OIP.J0Sc__dUUcQSx0bnCm4LHQHaHa?pid=ImgDet&rs=1',
    ),
    Product(
      name: 'Paneer',
      units: "/200 gm",
      price: 80,
      category: 'MILK PRODUCTS',
      color: Colors.white,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://5.imimg.com/data5/AK/VA/MY-9101930/amul-fresh-paneer-500x500.jpg',
    ),
    Product(
      name: 'Double Bed',
      units: "/per",
      price: 38000,
      category: 'FURNITURE',
      color: Colors.white70,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://ii1.pepperfry.com/media/catalog/product/a/l/800x880/allen-king-size-box-storage-bed-in-taupe-colour--by-hometown-allen-king-size-box-storage-bed-in-taup-j4oru1.jpg',
    ),
    Product(
      name: 'Luxury Single Bed',
      units: "/per",
      price: 11000,
      category: 'FURNITURE',
      iscloth: false,
      isfoot: true,
      color: Colors.white70,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://ii1.pepperfry.com/media/catalog/product/n/a/800x880/native-single-day-bed-in-brown-colour-by-trevi-furniture-native-single-day-bed-in-brown-colour-by-tr-fdj5h7.jpg',
    ),
    Product(
      name: 'Sofa',
      units: "/per",
      price: 22883,
      category: 'FURNITURE',
      color: Colors.white60,
      iscloth: true,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://ii1.pepperfry.com/media/catalog/product/c/a/800x400/caspreo-6-seater--rhs--sofa-set--in-dark-blue-colour-by-furny-caspreo-6-seater--rhs--sofa-set--in-da-chpwmf.jpg',
    ),
    Product(
      name: 'Dining Table',
      units: "/per",
      price: 24950,
      category: 'FURNITURE',
      iscloth: false,
      isfoot: false,
      color: Colors.white70,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://f1af951e8abcbc4c70b9-9997fa854afcb64e87870c0f4e867f1d.lmsin.net/1000009307107-1000009307107-0809_01-750-1.jpg',
    ),
    Product(
      name: 'Arm Chair',
      units: "/per",
      price: 23499,
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      category: 'FURNITURE',
      color: Colors.white,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      iscloth: false,
      isfoot: false,
      imageUrl:
          'https://ii1.pepperfry.com/media/catalog/product/w/e/800x880/weddell-upholstered-armchair-in-tan-colour---bohemiana-by-pepperfry-weddell-upholstered-armchair-in--tsbe8w.jpg',
    ),
    Product(
      name: 'Study Table',
      units: "/per",
      price: 13448,
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      category: 'FURNITURE',
      iscloth: false,
      isfoot: false,
      color: Colors.white30,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      imageUrl:
          'https://ii1.pepperfry.com/media/catalog/product/s/t/800x880/study-table-with-book-shelves---cabinet-in-knotty-wood-finish-by-crystal-furnitech-study-table-with--blhd06.jpg',
    ),
    Product(
      name: 'Office chair',
      units: "/per",
      price: 14430,
      category: 'FURNITURE',
      color: Colors.white,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Mango king of fruits beneficial for all in this summer Mangoes are sweet, creamy fruits that have a range of possible health benefits. They are highly popular around the world. Mangoes are sweet, creamy fruits that have a range of possible health benefits.The mangoes are tropical stone fruits and members of the drupe family. This is a type of plant food with a fleshy outer section that surrounds a shell, or pit. This pit contains a seed.",
      imageUrl:
          'https://ii1.pepperfry.com/media/catalog/product/b/e/800x880/beast-gaming-chair-in-black---yellow-colour-by-green-soul-beast-gaming-chair-in-black---yellow-colou-j4p1qe.jpg',
    ),
    Product(
        name: 'Louis  Jeans',
        units: "/per",
        price: 1539,
        category: 'CLOTHING & FOOTWEAR',
        color: Colors.white24,
        iscloth: true,
        isfoot: false,
        delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
        description:
            "Men Navy Blue Slim Fit Low-Rise Light Fade Stretchable Jeans \n Medium shade, \n light fade navy blue jeans Slim fit, \n low-rise Clean look Stretchable\n 5 pocket Length: regular",
        imageUrl:
            'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16418378/2021/12/22/ae9688c2-e75b-47d7-b22f-22d57f866a091640172863860-Louis-Philippe-Jeans-Men-Jeans-2071640172863258-1.jpg'
        // image1:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16418378/2021/12/22/d5dfd430-68b9-4595-9690-a8129883e2b41640172863813-Louis-Philippe-Jeans-Men-Jeans-2071640172863258-5.jpg"
        //  image 2:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16418378/2021/12/22/9a5f5360-da73-4b80-bb0f-928292a6e4fb1640172863800-Louis-Philippe-Jeans-Men-Jeans-2071640172863258-6.jpg"
        ),
    Product(
      name: 'Louis Blazer',
      units: "/per",
      price: 5949,
      category: 'CLOTHING & FOOTWEAR',
      color: Colors.white,
      iscloth: true,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Grey self-design super slim-fit blazer, has a notched lapel,\n long sleeves, single-breasted with a double button closure, three pockets,\n an attached lining and a double-vented back hem The pocket square has been used from our stylist's collection\n The blazer does not come with a pocket square",
      imageUrl:
          'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/3/25/badf2a5d-ebb6-4b18-97b9-c34b10cddbf01553516913482-1.jpg',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/3/25/47ec31ec-14b2-4cc2-89bf-06e6ee690f841553516913491-2.jpg"
      // image2:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2019/3/25/ab897e77-1c25-4255-a1de-f6b513636f2a1553516913518-4.jpg"
    ),
    Product(
      name: 'Lous Philippe Shirt',
      units: "/per",
      price: 3999,
      category: 'CLOTHING & FOOTWEAR',
      color: Colors.grey,
      iscloth: true,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      isfoot: false,
      description:
          "Blue ethnic motifs woven design opaque semiformal shirt, has a spread collar, full button placket, 1 patch pocket at left chest, long roll-up sleeves, and curved hem",
      imageUrl:
          'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/17205724/2022/3/11/ba5358f9-03f9-49d9-836b-ee982f089df21646984522868-Louis-Philippe-Men-Shirts-8751646984522386-1.jpg',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/17205724/2022/3/11/92ddfa9e-a092-4fbb-86e3-64fb2502db531646984522860-Louis-Philippe-Men-Shirts-8751646984522386-2.jpg ",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/17205724/2022/3/11/e8580fa9-07f7-44d6-9a1e-19ac08f051131646984522834-Louis-Philippe-Men-Shirts-8751646984522386-5.jpg",
    ),
    Product(
      name: 'Saffron Threads',
      units: "/per",
      price: 989,
      category: 'CLOTHING & FOOTWEAR',
      color: Colors.white,
      iscloth: true,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      isfoot: false,
      description:
          "Colour: yellow oven design Mandarin collar Long,\n regular sleeves Both side pockets Straight shape with \n regular style Calf length with straight hem Machine weave regular cotton",
      imageUrl:
          'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/6/26/58372abe-d7b4-476f-be99-9a17b238b0001624680128554-1.jpg',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/6/26/e3ac14c7-f16d-481b-b83f-d58ca4c89cac1624680128564-2.jpg ",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/productimage/2021/6/26/f5aa2c6f-30a2-4803-9ba9-b58839662f951624680128581-4.jpg",
    ),
    Product(
      name: 'KALINI Kurti',
      units: "/per",
      price: 776,
      category: 'CLOTHING & FOOTWEAR',
      color: Colors.grey,
      iscloth: true,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
          "Teal yoke design Kurta with Palazzos with dupatta Kurta design:\n Solid yoke design Straight shape Regular style Round neck, \n three-quarter regular sleeves Calf length ",
      imageUrl:
          'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/f41645f5-e62e-452c-ade0-f132d5de30e51648119245986-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-1.jpg',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/3b8a2360-2004-4507-afc9-dd5b2ca1e7031648119245944-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-3.jpg",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/11de9cc4-7256-4e86-804f-0553ecb7f74f1648119245831-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-11.jpg",
    ),
    Product(
      name: 'Speaker',
      units: "/per",
      price: 40000,
      category: 'ELECTRONICS',
      color: Colors.grey,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
      "Portable\n Bluetooth speaker \n LED lighting and Black color ",
      imageUrl:
      'https://th.bing.com/th/id/OIP.fRafyflLwxceWaBhVnmXcAHaOe?pid=ImgDet&rs=1',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/3b8a2360-2004-4507-afc9-dd5b2ca1e7031648119245944-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-3.jpg",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/11de9cc4-7256-4e86-804f-0553ecb7f74f1648119245831-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-11.jpg",
    ),
    Product(
      name: 'Laptop',
      units: "/per",
      price: 50000,
      category: 'ELECTRONICS',
      color: Colors.grey,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
      "3rd Gen Ci7/ 8GB/ 1TB/ Win8/ 2GB Graph\n 15.6 inch, Metal Finish Midnight Black With Vertical Brushing Pattern, 2.57 kg \n Finger Print Sensor for Faster System Access ",
      imageUrl:
      'https://th.bing.com/th/id/OIP.6XEHntpLQQ6Pl7bwKUttLwHaE3?pid=ImgDet&rs=1',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/3b8a2360-2004-4507-afc9-dd5b2ca1e7031648119245944-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-3.jpg",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/11de9cc4-7256-4e86-804f-0553ecb7f74f1648119245831-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-11.jpg",
    ),
    Product(
      name: 'Smart TV',
      units: "/per",
      price: 30000,
      category: 'ELECTRONICS',
      color: Colors.grey,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
      "50 INCH\n FULL HD  \n Cost and Electricity efficient",
      imageUrl:
      'https://th.bing.com/th/id/OIP.45HpMi6lF_Kesz-G0q06EAHaFN?pid=ImgDet&rs=1',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/3b8a2360-2004-4507-afc9-dd5b2ca1e7031648119245944-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-3.jpg",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/11de9cc4-7256-4e86-804f-0553ecb7f74f1648119245831-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-11.jpg",
    ),
    Product(
      name: 'I Phone',
      units: "/per",
      price: 55000,
      category: 'ELECTRONICS',
      color: Colors.grey,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
      "6.1 inches Display \n Liquid Retina IPS LCD capacitive touchscreen, 16M colors \n Apple A13 Bionic (7 nm+) \n 128GB ROM \n 12 MP Front Camera ",
      imageUrl:
      'https://www.bing.com/th?id=OIP.ZtTxZpcomPqIkQ908XCqGAHaLd&w=200&h=311&c=8&rs=1&qlt=90&o=6&dpr=1.5&pid=3.1&rm=2',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/3b8a2360-2004-4507-afc9-dd5b2ca1e7031648119245944-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-3.jpg",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/11de9cc4-7256-4e86-804f-0553ecb7f74f1648119245831-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-11.jpg",
    ),
    Product(
      name: 'Refregerator',
      units: "/per",
      price: 16000,
      category: 'ELECTRONICS',
      color: Colors.grey,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
      "LG 7.2cu.ft. \n Two-Door No Frost Inverter Refrigerator  \n Save electricity",
      imageUrl:
      'https://th.bing.com/th/id/OIP.dxV4b1p1-_PigMTVAwjvMAHaLL?pid=ImgDet&w=2494&h=3765&rs=1',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/3b8a2360-2004-4507-afc9-dd5b2ca1e7031648119245944-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-3.jpg",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/11de9cc4-7256-4e86-804f-0553ecb7f74f1648119245831-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-11.jpg",
    ),
    Product(
      name: 'Microwave',
      units: "/per",
      price: 6000,
      category: 'ELECTRONICS',
      color: Colors.grey,
      iscloth: false,
      isfoot: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
      "Capacity: 20 litres Suitable for a small family. \n Solo: Can be used for reheating, defrosting and cooking. \n Control: Jog wheel plus button that are easy to use with a long life. ",
      imageUrl:
      'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/f41645f5-e62e-452c-ade0-f132d5de30e51648119245986-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-1.jpg',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/3b8a2360-2004-4507-afc9-dd5b2ca1e7031648119245944-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-3.jpg",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/11de9cc4-7256-4e86-804f-0553ecb7f74f1648119245831-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-11.jpg",
    ),
    Product(
      name: 'Sport Shoes',
      units: "/per",
      price: 600,
      category: 'CLOTHING & FOOTWEAR',
      color: Colors.grey,
      iscloth: false,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      isfoot: true,
      description:
      "Ankle Length \n Dirt Resistant \n Relaxing ",
      imageUrl:
      'https://th.bing.com/th/id/OIP.YguOkIP2xIjpoReX_q0R4gHaHa?pid=ImgDet&rs=1',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/3b8a2360-2004-4507-afc9-dd5b2ca1e7031648119245944-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-3.jpg",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/11de9cc4-7256-4e86-804f-0553ecb7f74f1648119245831-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-11.jpg",
    ),
    Product(
      name: 'Boots',
      units: "/per",
      price: 600,
      category: 'CLOTHING & FOOTWEAR',
      color: Colors.grey,
      iscloth: false,
      isfoot: true,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
      "Capacity: 20 litres Suitable for a small family. \n Solo: Can be used for reheating, defrosting and cooking. \n Control: Jog wheel plus button that are easy to use with a long life. ",
      imageUrl:
      'https://th.bing.com/th/id/OIP.mKLEy1nIXffjSSpxJV13hwHaJE?pid=ImgDet&rs=1',
      // image1:"https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/3b8a2360-2004-4507-afc9-dd5b2ca1e7031648119245944-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-3.jpg",
      // image2:" https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/16836356/2022/3/24/11de9cc4-7256-4e86-804f-0553ecb7f74f1648119245831-KALINI-Women-Blue-Yoke-Design-Kurta-with-Palazzos--With-Dupa-11.jpg",
    ),
    Product(
      name: 'Ladies Heels',
      units: "/per",
      price: 600,
      category: 'CLOTHING & FOOTWEAR',
      color: Colors.grey,
      iscloth: false,
      isfoot: true,
      delivery:"Delivery Date: After 2 days from delivery \n Delivery condition: Fast and Safe \n Vendor Addres: \n   Ram Lal shop,\n   Palam Vihar,\n,  New Delhi,\n  1211101",
      description:
      " Women's Metallic Gold \n Lace Up Barely \n  Heels",
      imageUrl:
      'https://cdna.lystit.com/photos/missguided/5ac9e4c0/missguided-designer-gold-Gold-Lace-Up-Barely-There-Heels.jpeg',

    ),

  ];
}
