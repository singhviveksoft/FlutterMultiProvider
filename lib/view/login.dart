//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_provider/constant/shared_pref.dart';
import 'package:multi_provider/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _name_input = TextEditingController();
  TextEditingController _pwd_input = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _validate = false;
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  controller: _name_input,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter Name Here',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)))),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                  obscureText: true,
                  controller: _pwd_input,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      hintText: 'Enter Password Here',
                      errorText: _validate?'pwd required':null,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_pwd_input.text.isEmpty) {
                        setState(() {
                          _validate = true;
                        });

                      } else {
                        setState(() {
                          _validate = false;
                        });

                      }

                      if (!_validate) {
                        SharedPref().addUser(_name_input.text);
                        var status = await SharedPref().getName('name');
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => MyHomePage(title: status)));
                      }
/*              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                   return MyHomePage(title: status);
                  }));*/

                      // Navigator.pop(context);
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
