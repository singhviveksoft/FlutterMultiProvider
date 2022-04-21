import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_provider/constant/shared_pref.dart';
import 'package:multi_provider/view/home_page.dart';
import 'package:multi_provider/view/login.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold();
  }
@override
  void dispose() {
  print('dispose');
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    print('didChangeDependencies');
    super.didChangeDependencies();
  }
  @override
  void initState() {
print('initState');
    Timer(Duration(seconds: 3), ()async {
    var status = await  SharedPref().getName('name');
    print('status--$status');
      if (status == "" ||
          status == null) {
      /*  Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return const LoginPage();
          }),
        );
*/
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) =>const LoginPage()));
      } else {
       /* Navigator.push(
          context,
          MaterialPageRoute(builder: (context) {
            return MyHomePage(title: status);
          }),
        );*/
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MyHomePage(title: status)));

      }
    });

    super.initState();
  }
}
