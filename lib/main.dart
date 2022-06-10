import 'dart:async';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:fabrest/Services/AuthGoogle.dart';
import 'package:fabrest/bloc/cart_bloc.dart';
import 'package:fabrest/bloc/cart_event.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'MainScr.dart';
import 'package:fabrest/Models/Product_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'SignUp.dart';
import 'Services/AuthGoogle.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CartBLoc()..add(CartStarted()))
        ],
        child: MaterialApp(
          initialRoute: SplashScreen.id,
          routes: {
            SplashScreen.id: (context) => const SplashScreen(),
            MainScr.id: (context) => const IntroScr()
          },
        ));
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 4),
        () => Navigator.pushReplacementNamed(context, MainScr.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(child: Image.asset('images/fabrests.png')));
  }
}

class IntroScr extends StatefulWidget {
  const IntroScr({Key? key}) : super(key: key);

  @override
  State<IntroScr> createState() => _IntroScrState();
}

class _IntroScrState extends State<IntroScr> {
  double scrollerPosition = 0;

  @override
  Widget CurrentPage = AuthPage();
  AuthClass authClass = AuthClass();

  void initState() {
    super.initState();
  }

  void CheckLogin() async {
    String? token = await authClass.getToken();
    if (token != null) {
      setState(() {
        CurrentPage == MainScr();
      });
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          SizedBox(
            height: 550,
            child: PageView(
              onPageChanged: (val) {
                setState(() {
                  scrollerPosition = val.toDouble();
                });
              },
              scrollDirection: Axis.horizontal,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("WELCOME TO FABREST",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white)),
                      Image.asset(
                        'images/smart1.png',
                        height: 400,
                        width: 400,
                      ),
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("ENJOY SECURE PAYMENTS",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white)),
                      Image.asset('images/safe1.png', height: 400, width: 400),
                    ]),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("FREE & FAST DELIVERY",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white)),
                      Image.asset('images/fast.png', height: 400, width: 400),
                    ]),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
                height: 110,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(200),
                        topRight: Radius.circular(200)),
                    border: Border.all(color: Colors.black12)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DotsIndicator(
                        dotsCount: 3,
                        position: scrollerPosition,
                        decorator: DotsDecorator(
                            color: Colors.blueGrey, activeColor: Colors.white),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20, right: 20),
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                              shadowColor:
                                  MaterialStateProperty.all(Colors.blue)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CurrentPage));
                          },
                          child: Text(
                            "LET'S EXPLORE ...",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic,
                                fontSize: 20),
                          ))
                    ])),
          )
        ]));
  }
}
