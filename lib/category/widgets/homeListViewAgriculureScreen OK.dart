// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../home/models/background.dart';

//https://stackoverflow.com/questions/51910725/flutter-displaying-two-listviews-on-one-screen

class HomeListViewAgriculureScree extends StatefulWidget {
  const HomeListViewAgriculureScree({Key? key}) : super(key: key);

  String get title => 'lahat';

  @override
  _HomeListViewAgriculureScreeState createState() =>
      _HomeListViewAgriculureScreeState();
}

class _HomeListViewAgriculureScreeState
    extends State<HomeListViewAgriculureScree> {
  ///List<String> items = ["Biologica", "Biodinamica", "Integrato", "Produttori"];

  List<String> itemsaBioAgriculture = [
    "Biologica",
    "Biodinamica",
    "Integrato",
    "Produttori"
  ];
  //beekeeping
  List<String> itemsBioApicoltura = ["Miel", "Cera", "Propoli", "Produttori"];

  //green buildin
  List<String> itemsBioEdilizia = ["Canapa", "Isolamento", "Produttori"];

  //green buildin
  List<String> itemsBioHotel = ["R&B", "Hotel"];

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    Axis.vertical;
    4;

    //Axis.vertical;

    // Axis.horizontal;

    //   ------------------------   INITE HEADER AGRICULTURE ----------------------------------

    final headerListBioAgriculture = new ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 4.0, bottom: 30.0)
            : const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);

        return new Padding(
          padding: padding,
          child: new InkWell(
            onTap: () {
              if (kDebugMode) {
                print('Card selected');
              }
            },
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.lightGreen,
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: new DecorationImage(
                  image: new ExactAssetImage(
                      //   'assets/images/agriculture/img_${index % itemsaBioAgriculture.length}.png'),
                      'images/agriculture/agriculture_${index % itemsaBioAgriculture.length}.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),

              //  height: 200.0,
              width: 200.0,
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF273A48),
                            // ignore: unnecessary_const
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        height: 30.0,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              itemsaBioAgriculture[
                                  index % itemsaBioAgriculture.length],
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: itemsaBioAgriculture.length,
    );

    //   ------------------------  END INITE HEADER AGRICULTURE ----------------------------------
    //   ------------------------   INITE HEADER APICOLTURA ----------------------------------
    final headerListApicoltura = new ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 4.0, bottom: 30.0)
            : const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);

        return new Padding(
          padding: padding,
          child: new InkWell(
            onTap: () {
              if (kDebugMode) {
                print('Card selected');
              }
            },
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.lightGreen,
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: new DecorationImage(
                  image: new ExactAssetImage(
                      //'assets/images/apiculture/img_${index % itemsBioApicoltura.length}.jpg'),
                      'images/apiculture/apiculture_${index % itemsBioApicoltura.length}.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),

              //                                    height: 200.0,
              width: 200.0,
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF273A48),
                            // ignore: unnecessary_const
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        height: 30.0,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              itemsBioApicoltura[
                                  index % itemsBioApicoltura.length],
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: itemsBioApicoltura.length,
    );

    //   ------------------------ END  INITE HEADER APICOLTURA ----------------------------------

    //   ------------------------ END  INITE HEADER BIOEDILIZIA ----------------------------------

    final headerListBioEdilizia = new ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 4.0, bottom: 30.0)
            : const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);

        return new Padding(
          padding: padding,
          child: new InkWell(
            onTap: () {
              if (kDebugMode) {
                print('Card selected');
              }
            },
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.lightGreen,
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: new DecorationImage(
                  image: new ExactAssetImage(
                      // 'assets/images/bioedilizia/img_${index % itemsBioEdilizia.length}.jpg'),
                      'images/bioedilizia/bioedilizia_${index % itemsBioEdilizia.length}.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),

              //                                    height: 200.0,
              width: 200.0,
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF273A48),
                            // ignore: unnecessary_const
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        height: 30.0,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              itemsBioEdilizia[index % itemsBioEdilizia.length],
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: itemsBioEdilizia.length,
    );

    //   ------------------------ END  INITE HEADER BIOEDILIZIA ----------------------------------

    //   ------------------------ END  INITE HEADER BIOHOTEL ----------------------------------

    final headerListBioHotel = new ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 4.0, bottom: 30.0)
            : const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);

        return new Padding(
          padding: padding,
          child: new InkWell(
            onTap: () {
              if (kDebugMode) {
                print('Card selected');
              }
            },
            child: new Container(
              decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(10.0),
                color: Colors.lightGreen,
                boxShadow: [
                  new BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: new DecorationImage(
                  image: new ExactAssetImage(
                      'images/hotel/hotel_${index % itemsBioHotel.length}.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),

              //                                    height: 200.0,
              width: 200.0,
              child: new Stack(
                children: <Widget>[
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF273A48),
                            // ignore: unnecessary_const
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        height: 30.0,
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Text(
                              itemsBioHotel[index % itemsBioHotel.length],
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemCount: itemsBioHotel.length,
    );

    //   ------------------------ END  INITE HEADER BIOHOTEL ----------------------------------

    final body = new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
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
        child: new Stack(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: const Text(
                          'Agricoltura',
                          // ignore: unnecessary_const
                          style: const TextStyle(color: Colors.white70),
                        )),
                  ),
                  new SizedBox(
                      //   height: 300.0,
                      height: 280.0,
                      width: _width,
                      child: headerListBioAgriculture),

                  new Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                    return new ListTile(
                      title: new Column(
                        children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                height: 72.0,
                                width: 72.0,
                                decoration: new BoxDecoration(
                                    color: Colors.lightGreen,
                                    boxShadow: [
                                      new BoxShadow(
                                          color: Colors.black.withAlpha(70),
                                          offset: const Offset(2.0, 2.0),
                                          blurRadius: 2.0)
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        // ignore: unnecessary_const
                                        const Radius.circular(12.0)),
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                        'images/agriculture/agriculture_${index % itemsaBioAgriculture.length}.png',
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),

                              //-------------------------------------- INIT MY ITEM HEADER  -----------------------------------

                              new Expanded(
                                  child: new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const <Widget>[
                                  Text(
                                    'My item header',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Item Subheader goes here\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.black54,
                                        fontWeight: FontWeight.normal),
                                  )
                                ],
                              )),
                              const Icon(
                                Icons.shopping_cart,
                                color: Color(0xFF273A48),
                              )

                              //-------------------------------------- INIT MY ITEM HEADER  -----------------------------------
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  })),

                  //***************************** init itemsApicoltura ***********************

                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: const Text(
                          'Apicoltura',
                          // ignore: unnecessary_const
                          style: const TextStyle(color: Colors.white70),
                        )),
                  ),

                  new SizedBox(
                      // height: 300.0,
                      height: 250.0,
                      width: _width,
                      child: headerListApicoltura),
                  new Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                    return new ListTile(
                      title: new Column(
                        children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                height: 72.0,
                                width: 72.0,
                                decoration: new BoxDecoration(
                                    color: Colors.lightGreen,
                                    boxShadow: [
                                      new BoxShadow(
                                          color: Colors.black.withAlpha(70),
                                          offset: const Offset(2.0, 2.0),
                                          blurRadius: 2.0)
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        // ignore: unnecessary_const
                                        const Radius.circular(12.0)),
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                        // 'assets/images/home/img_${index %r itemsBioApicoltura.length}.jpg',
                                        'images/apiculture/apiculture_${index % itemsBioApicoltura.length}.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  }))

//

                  //***************************** INIT ITEMS BIOEDILIZIA ***********************

                  ,
                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: const Text(
                          'BioEdilizia',
                          // ignore: unnecessary_const
                          style: const TextStyle(color: Colors.white70),
                        )),
                  ),

                  new SizedBox(
                      // height: 300.0,
                      height: 280.0,
                      width: _width,
                      child: headerListBioEdilizia),
                  new Expanded(
                      child: ListView.builder(itemBuilder: (context, index) {
                    return new ListTile(
                      title: new Column(
                        children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Container(
                                height: 72.0,
                                width: 72.0,
                                decoration: new BoxDecoration(
                                    color: Colors.lightGreen,
                                    boxShadow: [
                                      new BoxShadow(
                                          color: Colors.black.withAlpha(70),
                                          offset: const Offset(2.0, 2.0),
                                          blurRadius: 2.0)
                                    ],
                                    borderRadius: const BorderRadius.all(
                                        // ignore: unnecessary_const
                                        const Radius.circular(12.0)),
                                    image: new DecorationImage(
                                      image: new ExactAssetImage(
                                        //'assets/images/home/img_${index % itemsBioEdilizia.length}.jpg',
                                        'images/bioedilizia/bioedilizia_${index % itemsBioEdilizia.length}.jpg',
                                      ),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(
                                width: 4.0,
                              ),
                            ],
                          ),
                          const Divider(),
                        ],
                      ),
                    );
                  }))

                  //***************************** END ITEMS BIOEDILIZIA ***********************
                ],
              ),
            ),
          ],
        ),
      ),
    );

    return new Container(
      decoration: const BoxDecoration(
        color: Color(0xFF273A48),
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

    /*  return new LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
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
          ),
        );
      },
    );
*/
    /* return new Container(
      decoration: const BoxDecoration(
        color: Color(0xFF273A48),
      ),
      //child: new Stack(
      child: SingleChildScrollView(
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
      ),
    );

    */
  }
}



/* okk class _HomeListViewAgriculureScreeState
    extends State<HomeListViewAgriculureScree> {
  @override
  Widget build(BuildContext context) {
    //return SafeArea();
    //const MyApp({Key? key}) : super(key: key);

    const title = 'Horizontal List';

    // return MaterialApp(
    // title: title,
    // home: Scaffold(
    // appBar: AppBar(
    //    title: const Text(title),
    //  ),
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 20.0),
        height: 200.0,
        child: ListView(
          // This next line does the trick.
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 160.0,
              color: Colors.red,
            ),
            Container(
              width: 160.0,
              color: Colors.blue,
            ),
            Container(
              width: 160.0,
              color: Colors.green,
            ),
            Container(
              width: 160.0,
              color: Colors.yellow,
            ),
            Container(
              width: 160.0,
              color: Colors.orange,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 80.0,
              child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const <Widget>[
                    OutlineButton(onPressed: null, child: Text("Shopify")),
                    Padding(padding: EdgeInsets.all(5.00)),
                    OutlineButton(onPressed: null, child: Text("Yahoo")),
                    Padding(padding: EdgeInsets.all(5.00)),
                    OutlineButton(onPressed: null, child: Text("LinkedIn"))
                  ]),
            ),
          ],
        ),
      ),
      //  ),
    );
  }

  
}*/
