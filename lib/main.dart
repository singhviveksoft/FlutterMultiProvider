import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_provider/provider/home_provider.dart';
import 'package:multi_provider/provider/shop_provider.dart';
import 'package:multi_provider/view/splash.dart';
import 'package:provider/provider.dart';

import 'view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return
      MultiProvider(providers: [
        ChangeNotifierProvider<HomePageProvider>(create: (context){
        return HomePageProvider();
        },),
        ChangeNotifierProvider<ShopProvider>(create: (context){
          return ShopProvider();
        },)
      ],
        child:  MaterialApp(
          debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: Splash(),
      ),);


  }
}


