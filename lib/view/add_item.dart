

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_provider/provider/home_provider.dart';
import 'package:multi_provider/provider/shop_provider.dart';
import 'package:provider/provider.dart';

class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController item_input = TextEditingController();
  TextEditingController shop_input = TextEditingController();
  @override
  void dispose() {
    print('_AddItemState_dispose');
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('add item'),),
      body:   Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                controller: item_input,
                decoration: InputDecoration(
                    labelText: 'item',
                    hintText: 'add item',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)))
            ),
          ),
          ElevatedButton(onPressed: () async{
            await Provider.of<HomePageProvider>(context, listen: false)
                .addItem(item_input.text);
            Navigator.pop(context);

          }, child: const Text('add item')),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
                controller: shop_input,
                decoration: InputDecoration(
                    labelText: 'shop',
                    hintText: 'shop name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)))
            ),
          ),
          ElevatedButton(onPressed: () async {
           await Provider.of<ShopProvider>(context, listen: false)
                .shopName(shop_input.text);
           Navigator.pop(context);
          }, child: const Text('add shop name'))
        ],
      )
    );

  }
}
