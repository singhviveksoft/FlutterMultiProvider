import 'package:flutter/cupertino.dart';

class ShopProvider with ChangeNotifier{
   String shop_name='';
    shopName(String shop_name){
     this.shop_name=shop_name;
     notifyListeners();
   }

}