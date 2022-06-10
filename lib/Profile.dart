import 'dart:io';
import 'package:fabrest/MainScr.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';


class MyProfile extends StatefulWidget {
  MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final ImagePicker _picker = ImagePicker();
  XFile? image;


  @override
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  bool Edit = false;
  bool EditA = false;
  String Name = "My Name";
  String Addresse="Contact Address";

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(elevation: 8,
                child: Container(padding: EdgeInsets.all(8),
                    color: Colors.white,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: 50,
                    child: Row(children: [
                      IconButton(onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MainScr()));
                      }, icon: Icon(Icons.arrow_back, color: Colors.blue,),),
                      SizedBox(width: 100),
                      Text("PROFILE", style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.blue),)
                    ],)),
              ),
              Card(elevation: 8,
                  child: Container(decoration: BoxDecoration(color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(70),
                          bottomRight: Radius.circular(70))), width: MediaQuery
                      .of(context)
                      .size
                      .width, height: 370,
                    child: Center(
                      child: Column(
                        children: [
                          Text("WELCOME", style: TextStyle(fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white)),
                          SizedBox(height: 10),
                          Row(mainAxisAlignment:MainAxisAlignment.center,children:[Align(
                          child:CircleAvatar(radius: 100,backgroundImage: getImage(),),),
                          Padding(padding: EdgeInsets.only(top:60),child:

                          IconButton(onPressed: () async {
                            image = (await _picker.pickImage(source: ImageSource
                                .gallery))!;
                            setState(() {
                              image = image;
                            });

                          },
                            icon: Icon(
                              Icons.camera_alt_rounded, color: Colors.white,
                              size: 40,),)),]),
                          SizedBox(height: 10),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [Text(
                                "${Name}",
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                                IconButton(onPressed: () {
                                  setState(() {
                                    Edit = true;
                                  });
                                }, icon: Icon(Icons.edit, size: 30, color: Colors
                                    .white))
                              ]),
                          Edit ? NameEdit() : SizedBox(height: 2,),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 20,),
              Text("Contact Address",style:TextStyle(fontStyle:FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 30,color:Colors.indigo)),
              SizedBox(height: 20,),
              Column(children:[
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [Text(
                    "${Addresse}",
                    style: TextStyle(color: Colors.indigoAccent,
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                    IconButton(onPressed: () {
                      setState(() {
                        EditA = true;
                      });
                    }, icon: Icon(Icons.edit, size: 30, color: Colors
                        .blue))
                  ]),
              EditA ? Address() : SizedBox(height: 2,),
            ],
          ),
          ]
          )
        )
    );
  }

  ImageProvider  getImage() {
    if (image != null) {
      return FileImage(File(image!.path));

    }
    return NetworkImage("https://img.freepik.com/free-vector/sale-banner-template-design_74379-121.jpg?w=1060");
  }
  Widget Address(){
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 100,
            width: 270,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  width: 1,
                  color: Colors.deepPurple,
                ),
              ),
              child: TextFormField(maxLines:null,minLines: null,    expands: true,           controller: _address,

                decoration: InputDecoration(
                    labelText: ("Contact Address"),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 1.5, color: Colors.amber))),
              ),
            )),
        SizedBox(width: 20,),
        Card(color: Colors.blue,
            elevation: 8,
            child: Container(height: 40,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: IconButton(onPressed: () {
                  setState(() {
                    EditA = false;
                    Addresse = _address.text;
                  });
                }, icon: Icon(Icons.save, size: 20, color: Colors.white,))))

      ],
    );
  }


  Widget NameEdit() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(height: 60,
            width: 270,
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: BorderSide(
                  width: 1,
                  color: Colors.deepPurple,
                ),
              ),
              child: TextFormField(
                controller: _name,

                decoration: InputDecoration(
                    labelText: ("What I Call you ?"),
                    labelStyle: TextStyle(fontWeight: FontWeight.bold),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.deepPurple,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 1.5, color: Colors.amber))),
              ),
            )),
        SizedBox(width: 20,),
        Card(color: Colors.blue,
            elevation: 8,
            child: Container(height: 40,
                width: 60,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: IconButton(onPressed: () {
                  setState(() {
                    Edit = false;
                    Name = _name.text;
                  });
                }, icon: Icon(Icons.save, size: 20, color: Colors.white,))))

      ],
    );
  }
}






