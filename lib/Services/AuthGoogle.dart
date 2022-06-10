import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';

import '../MainScr.dart';
class AuthClass{
GoogleSignIn _googleSignIn = GoogleSignIn(
scopes: [
'email',
'https://www.googleapis.com/auth/contacts.readonly',
],
);
final storage=new FlutterSecureStorage();
FirebaseAuth auth=FirebaseAuth.instance; //initialize the firbase Auth
Future<void> googleSign(BuildContext context) async {//creating a future async of google sign in.
  try {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount != null) { //googleSignInAccount is a function of the package
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
          .authentication;//GoogleSignInAuthentication is a function of the package.
      AuthCredential credential = await GoogleAuthProvider.credential(//AuthCredential is function of FirebaseAuth
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      try {
        UserCredential userCredential = await auth.signInWithCredential(
            credential);
        storeTokenAndData(userCredential);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainScr()));
      }
      catch (e) {
        final snackbar = SnackBar(content: Text(e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      };
    }
    else {
      final snackbar = SnackBar(content: Text("Unable to SignIn"));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  } catch (e) {
    final snackbar = SnackBar(content: Text(e.toString()));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

  Future<void> storeTokenAndData(UserCredential userCredential) async {
    await storage.write(
        key: "token", value: userCredential.credential?.token.toString());

    await storage.write(
        key: "userCredential", value: userCredential.credential?.token.toString());
  }
  Future<String?>getToken()async{
  return await storage.read(key: "token"); //like reading a token mapping with key.
  }
  Future<void>SignOut()async{ // sign Out
  try {
    await _googleSignIn.signOut();
    await auth.signOut();
    await storage.delete(key: "token");
  }
  catch(e){}
  }




Future<void> verifyPhoneNumber(String phoneNumber,BuildContext context,Function setData) async {
  PhoneVerificationCompleted verificationCompleted = (
      PhoneAuthCredential phoneAuthCredential) async {
        ShowSnackbar(context, "Verification Completed");

  };

  PhoneVerificationFailed verificationFailed=(FirebaseAuthException exception)async{
    ShowSnackbar(context,exception.toString());
  };
  PhoneCodeSent codeSent=(String verificationID,[int ?forceResendingtoken]){
    ShowSnackbar(context, "Verification Completed");
    setData(verificationID);
  };
  PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout=(String verificationID){
    ShowSnackbar(context, "Time Out");
  };


  try{
      await auth.verifyPhoneNumber(
        phoneNumber:phoneNumber,
        verificationCompleted:verificationCompleted,
        verificationFailed:verificationFailed,
        codeSent:codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,

      );
  }
  catch(e){
    ShowSnackbar(context,e.toString() );
  }

}
Future<void>signInwithPhoneNumber(String verificationId,String smsCode,BuildContext context)async{
  try{
    AuthCredential credential= PhoneAuthProvider.credential(verificationId: verificationId,smsCode: smsCode);
      UserCredential userCredential = await auth.signInWithCredential(
          credential);
    storeTokenAndData(userCredential);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => MainScr()));
    ShowSnackbar(context,"Logged in" );
  }
  catch(e){
    ShowSnackbar(context,e.toString() );
  };
}
void ShowSnackbar(BuildContext context,String text){
  final snackbar = SnackBar(content: Text(text));
  ScaffoldMessenger.of(context).showSnackBar(snackbar);
}
}
