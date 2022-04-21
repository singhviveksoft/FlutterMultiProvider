import 'package:flutter/cupertino.dart';
import 'package:multi_provider/model/item.dart';

class HomePageProvider extends ChangeNotifier {
List<Item> itemlist=[];

   addItem(String itemName) {
     Item item = Item(itemName);
     itemlist.add(item);
     //  itemlist.add(Item(item));
      notifyListeners();
  }

}
