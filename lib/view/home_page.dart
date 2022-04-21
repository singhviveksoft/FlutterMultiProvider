import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_provider/provider/home_provider.dart';
import 'package:multi_provider/provider/shop_provider.dart';
import 'package:multi_provider/view/add_item.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void dispose() {
    print('MyHomePage_dispose');
    super.dispose();
  }
  @override
  void didChangeDependencies() {
    print('MyHomePage_didChangeDependencies');
    super.didChangeDependencies();
  }
  @override
  void initState() {
    print('MyHomePage_initState');
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print('MyHomePage_build');
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AddItem();
                  }));
                },
                icon: const Icon(Icons.add))
          ],
          title: Text(widget.title),
        ),
        body: SafeArea(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Consumer<ShopProvider>(builder: (context, provider, child) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 8.0, 0.0, .0),
                child: Text(
                  'shop name=${provider.shop_name}',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 25.0,
                  ),
                ),
              );
            }),
            Expanded(
              child: Consumer<HomePageProvider>(
                builder: (context, provider, child) {
                  return ListView.builder(
                    itemCount: provider.itemlist.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          elevation: 5.0,
                          child: ListTile(
                            leading: CircleAvatar(
                              child: Text(index.toString()),
                            ),
                            title: Text(provider.itemlist[index].item),
                            subtitle: Text(index.toString()),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ]),
        ));
  }
}
