/*
import 'package:ecobio/database/objectbox/order_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:ecobio/database/objectbox/item_model.dart';
import 'package:ecobio/database/objectbox/order_model.dart';
import 'package:objectbox/objectbox.dart';
//import 'package:objectbox_sync_flutter_libs/objectbox_sync_flutter_libs.dart';
import 'package:quiver/strings.dart';

import '../../locatization/components/appLocalizations.dart';
// https://www.youtube.com/watch?v=r9Lc2r22KBk

class CounterObjectBox extends StatefulWidget {
  const CounterObjectBox({Key? key}) : super(key: key);

  @override
  State<CounterObjectBox> createState() => _CounterObjectBoxState();
}

class _CounterObjectBoxState extends State<CounterObjectBox> {
  // TO 6: Initialize store, orderBox and ItemBox
  Store? _store;
  Stream? stream;
  Box<OrderModel>? orderBox;
  Box<ItemModel>? itemBox;

  @override
  void initState() {
    super.initState();
    //TO 7: Sync: check for corret IP address for sync
    //TO 8: Open store and connect Sync server
    //TO 9. Open and order from store
    //TO 7: Sync: check for corret IP address for sync
    //TO 8: Open store and connect Sync server
    //TO 9. Open and order from store

    openStore().then((Store store) {
      _store = store;
      var syncServerIp = Platform.isAndroid ? '10.0.2.2' : '127.0.0.1';
      Sync.client(
        store,
        'ws:syncServerIp:9999',
        SyncCredentials.none(),
      ).start();

      orderBox = store.box<OrderModel>();
      stream = _store?.watch<OrderModel>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.translate('localization').toString(),
          style: const TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
          child: StreamBuilder<void>(
        stream: stream,
        builder: (context, AsyncSnapshot<void> snapshot) {
          List<OrderModel>? orders = orderBox?.getAll().reversed.toList() ?? [];

          if (orders.isNotEmpty) {
            return ListView.separated(
                scrollDirection: Axis.vertical,
                itemCount: orders.length,
                separatorBuilder: (context, index) => const Divider(
                    height: 5, color: Color.fromARGB(255, 57, 81, 214)),
                itemBuilder: (BuildContext context, int index) {
                  final children = <Widget>[];
                  for (final item in orders[index].items) {
                    children.add(Row(
                      children: [
                        Expanded(
                            child: Text(
                          item.itemCount.toString(),
                          textAlign: TextAlign.center,
                        ))
                      ],
                    ));
                  }
                  return Card(
                    color:
                        orders[index].ordered ? Colors.green : Colors.redAccent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text('Order no:${orders[index].id}'),
                          ...children,
                        ],
                      ),
                    ),
                  );
                });
          }
          if (snapshot.hasError) {
            return const Text("Errore CountObjectBox");
          }
          return const CircularProgressIndicator();
        },
      )),
    );
  }

  @override
  Widget build1(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.translate('localization').toString(),
          style: const TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                AppLocalizations.translate('countryLocation').toString(),
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.translate('agricolturaBio').toString(),
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final orderModel = OrderModel();
                  MaterialPageRoute(
                      builder: (context) => OrderScreen(
                          orderModel: orderModel, orderBox: orderBox!));
                },
                child: Text(
                  AppLocalizations.translate('slogan').toString(),
                  style: const TextStyle(fontSize: 25),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  openStore() {}

  void dispose() {
    // TO 10: close the store
    super.dispose();
    _store?.close();
  }
}

/*OrderScren(
  {required Box<OrderModel> orderBox,
     required OrderModel orderModel}) {}
*/

*/
