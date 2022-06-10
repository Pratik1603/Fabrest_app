import 'package:fabrest/phoneAuth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'MainScr.dart';
import 'Services/AuthGoogle.dart';

class SignIn extends StatefulWidget {
   SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  firebase_auth.FirebaseAuth firebaseAuth=firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController =TextEditingController();
  TextEditingController _password =TextEditingController();
  bool circular=false;
  AuthClass authClass = AuthClass();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body:SingleChildScrollView(child:
        Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child:Column(
                children:[
                  Container(child:Center(child: Image.asset('images/fabrests.png',height: 500,)),height:200,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(bottomRight:Radius.circular(60) ,bottomLeft:Radius.circular(60)))),
                  Text("Sign In",style:
                  TextStyle(color:Colors.white,fontWeight: FontWeight.bold,fontSize: 40),),
                  SizedBox(height:20),
                  authButtn(
                      "images/google.png",
                      "Continue With Google",
                      25, () async {
                    await authClass.googleSign(context);
                  }),
                  authButtn(
                      "images/phone.png",
                      "Continue With Phone",
                      35, () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Phone()));
                  }),
                  SizedBox(height:10),
                  Text("Or",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white)),
                  SizedBox(height:10),
                  TextItem("Email..",_emailController,false),
                  TextItem("Password..",_password,true),
                  SizedBox(height :20),
                  Button(),
                  SizedBox(height:10),
                  Row(mainAxisAlignment:MainAxisAlignment.center,children:[
                    Text("If you do not have an account?",style: TextStyle(color:Colors.white,fontSize: 20),),
                    InkWell(
                        onTap: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>AuthPage()));},
                        child: Text("Sign Up",style:TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 20)))
                  ])
                ])
        )
        )

    );
  }

  Widget authButtn(String Imageurl,String text,double size,VoidCallback ontap){
    return
      InkWell(
       onTap: ontap,

        child: Container(
          width: 360,
          height:60,
          child:Card(
            color: Colors.white,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side:BorderSide(width:1,color: Colors.deepPurple,),

            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Imageurl,height: size,
                  width: size,),
                SizedBox(width: 15,),

                Text(text,style: TextStyle(fontWeight: FontWeight.bold),),

              ],
            ),
          ),

        ),
      );
  }

  TextItem(String label,TextEditingController controller,bool obscureText){
    return
      Container(
          height: 60,
          width:360,
          child:Card(
            color: Colors.white,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side:BorderSide(width:1,color: Colors.deepPurple,),

            ),

            child: TextFormField(
              controller: controller,
              obscureText: obscureText,
              decoration: InputDecoration(labelText:(label),labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide:BorderSide(width:1,color: Colors.deepPurple,),
                  ),focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(width: 1.5,color: Colors.amber))),


            ),
          )
      );
  }

  Button(){
    return InkWell(
      onTap: ()async
      {
        setState(() {
          circular = true;
        });
        try {
          firebase_auth.UserCredential userCredential = await firebaseAuth
              .signInWithEmailAndPassword(
              email: _emailController.text, password: _password.text);
          print(userCredential.user?.email);
          setState(() {
            circular = false;
          });
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScr()));
        }
        catch (e) {
          final snackbar = SnackBar(content: Text(e.toString()));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
          setState(() {
            circular = false;
          });
        }
      },
      child: Container(

          height: 60,
          width:240,
          padding: EdgeInsets.all(5),

          child:Card(
            color: Colors.orange,
            elevation: 20,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
              side:BorderSide(width:3,color: Colors.deepPurple,),),
            child:Center(child:circular?CircularProgressIndicator():Text("LogIn",textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),)),
          )

      ),
    );
  }
}
