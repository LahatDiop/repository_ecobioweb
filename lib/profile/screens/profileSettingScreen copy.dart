// ignore_for_file: unnecessary_new, unnecessary_const

import 'dart:core';

import 'package:flutter/material.dart';


class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  String get title => 'Setting Profile';

  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  get child => null;

  // final items = ['Privacy', 'Norme', 'Regole', 'Note Legali', 'Goat'];

  final itemsLocalisation = ['Paese', 'Notifiche Push', 'Seleziona il Design'];
  // final List<String> items;

  // const ProfileSettingScreen({Key? key, required this.items}) : super(key: key);

  ///items: List<String>.generate(10000, (i) => 'Item $i'),
  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    Axis.vertical;
    // const title = 'Setting';

    final items = ['Privacy', 'Norme', 'Regole', 'Note Legali', 'Goat'];
    final body = new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        elevation: 0.0,
        // backgroundColor: Colors.transparent,
        actions: <Widget>[
          new IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      backgroundColor: Colors.transparent,
      body: new Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        child: new Stack(
            // child: ListView(
            children: <Widget>[
              new Padding(
                // padding: const EdgeInsets.only(top: 40.0),
                padding: const EdgeInsets.only(top: 0.0),
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new SizedBox(
                        child: Column(
                          children: <Widget>[
                            //  const SearchWidget(), // SEARCHE
                            // const TopPromoSlider(), // MENU PROMOTION HOME
                            //const CategoryHomePageWidget() ,               // GRID GESTION CATEGORY HOME
                            // const HomeListViewAgriculureScree(),
                            // PopularMenu(), // MENU POPULA FRESH EVALY STOR VAOUCHER
                            SizedBox(
                              height: 5,
                              child: Container(
                                color: const Color.fromARGB(255, 207, 52, 52),
                              ),
                            ),
                            new SizedBox(
                                child: ListView.builder(
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  children: <Widget>[
                                    ListTile(
                                      // title: Text(items[index]),
                                      title: Text(items[index]),
                                    ),
                                    const Divider(), //                           <-- Divider
                                  ],
                                );
                              },
                            )),
                          ],
                        ),
                      ),
                      new SizedBox(
                          child: ListView.builder(
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(items[index]),
                              ),
                              const Divider(), //                           <-- Divider
                            ],
                          );
                        },
                      )),
                      Expanded(
                        //flex: 10,
                        // height: 300.0,
                        //width: _width,
                        child: ListView(
                            // This next line does the trick.
                            scrollDirection: Axis.vertical,
                            children: <Widget>[
                              Container(
                                  child: ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    decoration: const BoxDecoration(
                                      //                    <-- BoxDecoration
                                      border: Border(bottom: BorderSide()),
                                    ),
                                    child: ListTile(
                                      title: Text(items[index]),
                                    ),
                                  );
                                },
                              )),
                              Container(
                                width: 100.0,
                                margin: const EdgeInsets.only(
                                    left: 5.0,
                                    right: 5.0,
                                    top: 5.0,
                                    bottom: 5.0),
                                color: const Color.fromARGB(255, 245, 242, 241),
                                child: const Text(
                                  "Il mercato Biologica online number on :)",
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 202, 61, 14),
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              Container(
                                width: 160.0,
                                margin: const EdgeInsets.only(
                                    left: 5.0,
                                    right: 5.0,
                                    top: 5.0,
                                    bottom: 5.0),
                                color: const Color.fromARGB(255, 131, 224, 131),
                                child: const Text(
                                  "AGRICULTURA BIOlOGICA",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ]),
                      ),
                    ]),
              )
            ]),
      ),
    );

    return new Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
        decoration: const BoxDecoration(
            // color: Color(0xFF273A48),
            //color: Color.fromARGB(255, 142, 238, 241),
            ),
        child: SizedBox(
            child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Column(
              children: <Widget>[
                ListTile(
                  title: Text(items[index]),
                ),
                const Divider(),
                //new CustomPaint(
                /// size: new Size(_width, _height),
                //painter: new Background(),
                // painter: new Background(),
                //),
                // body,
              ],
            );
          },
        )));

    /*  return new Container(
      decoration: const BoxDecoration(
          //color: Color(0xFF273A48),
          //color: Color.fromARGB(255, 142, 238, 241),
          ),
      child: new Stack(
        children: <Widget>[
          new CustomPaint(
            size: new Size(_width, _height),
            //painter: new Background(),
            painter: new Background(),
          ),
          body,
        ],
      ),
    );

    */
  }
}
