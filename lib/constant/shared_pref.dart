import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
 /* SharedPreferences? prefs;
   initPref() async{
     prefs  = await SharedPreferences.getInstance();
  }*/

  //String
  addUser(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', value);
  }
  addPwd(String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pwd', value);
  }

  getName(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString(key)??'';
    return stringValue;
  }


}