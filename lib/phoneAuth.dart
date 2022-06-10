import 'dart:async';
import 'package:fabrest/Services/AuthGoogle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class Phone extends StatefulWidget {
  const Phone({Key? key}) : super(key: key);

  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  int start = 30;
  bool wait = false;
  String ButtonName = "Send";
  TextEditingController phoneController = TextEditingController();
  String verificationIdFinal = "";
  String smsCode = "";
  AuthClass authClass = AuthClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.blue,
                child: Column(

                    children: [
                      Container(child:Center(child: Image.asset('images/fabrests.png',height: 500,)),height:200,width: MediaQuery.of(context).size.width,decoration:BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(bottomRight:Radius.circular(60) ,bottomLeft:Radius.circular(60)))),
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      SizedBox(height: 40),
                      Text_Field(),
                      SizedBox(height: 30),
                      Container(
                        width: MediaQuery.of(context).size.width - 30,
                        child: Row(children: [
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                          ),

                          Text("Enter 6 digit OTP",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: Colors.white,
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      OTP_TextField(),
                      SizedBox(height: 40),
                      RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "Send OTP again in",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                                color: Colors.white70)),
                        TextSpan(
                            text: "00:${start}",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: "sec",
                            style: TextStyle(
                                color: Colors.white70,
                                fontSize: 17,
                                fontWeight: FontWeight.bold))
                      ])),
                      SizedBox(height: 20,),
                      Bttn()
                    ]))));
  }

  void StartTimer() {
    const onsec = Duration(seconds: 1);
    Timer timer = Timer.periodic(onsec, (timer) {
      if (start == 0) {
        setState(() {
          timer.cancel();
          wait = false;
        });
      } else {
        setState(() {
          start--;
        });
      }
    });
  }

  Widget Bttn() {
    return InkWell(
      onTap: () async {
        authClass.signInwithPhoneNumber(verificationIdFinal, smsCode, context);
      },
      child: Container(
          height: 60,
          width: 240,
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
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white),
            )),
          )),
    );
  }

  Widget Text_Field() {
    return Container(
      width: MediaQuery.of(context).size.width-30,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
          border: Border.all(color: Colors.deepPurple)),
      child: TextFormField(
        controller: phoneController,
        decoration: InputDecoration(
          hintText: "Enter your mobile no.",
          hintStyle: TextStyle(color: Colors.black, fontSize: 17),
          prefixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
              child: Text(
                "(+91)",
                style: TextStyle(color: Colors.black, fontSize: 17),
              )),
          contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 8),
          suffixIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
              child: InkWell(
                onTap: wait
                    ? null
                    : () async {
                        StartTimer();
                        setState(() {
                          start = 30;
                          wait = true;
                          ButtonName = "Resend";
                        });
                        await authClass.verifyPhoneNumber(
                            "+91${phoneController.text}", context, setData);
                      },
                child: Text(
                  ButtonName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              )),
        ),
      ),
    );
  }

  Widget OTP_TextField() {
    return OTPTextField(
      length: 6,
      width: MediaQuery.of(context).size.width,
      fieldWidth: 60,
      otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.white),
      style: TextStyle(fontSize: 17),
      textFieldAlignment: MainAxisAlignment.spaceAround,
      fieldStyle: FieldStyle.underline,
      onCompleted: (pin) {
        setState(() {
          smsCode = pin;
        });
        print("Completed: " + pin);
      },
    );
  }

  void setData(String verificationId) {
    setState(() {
      verificationIdFinal = verificationId;
    });
    StartTimer();
  }
}
