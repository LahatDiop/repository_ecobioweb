import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../home/models/background.dart';
import '../../localisation/translation/components/appLocalizations.dart';
import '../components/customerCategory.dart';
import '../detailCategory/agricultureBiologique copy.dart';
import '../detailCategory/productHome.dart';
import '../detailCategory/agricultureIntegration.dart';
import '../detailCategory/agricultureKmZero.dart';
import '../detailCategory/infoProducers.dart';
import '../detailCategory/productsBiologique.dart';

//https://stackoverflow.com/questions/51910725/flutter-displaying-two-listviews-on-one-screen

class HomeCategoryViewScreen extends StatefulWidget {
  const HomeCategoryViewScreen({Key? key}) : super(key: key);

  String get title => 'Benvenuti';

  @override
  _HomeCategoryViewScreenState createState() => _HomeCategoryViewScreenState();
}

class _HomeCategoryViewScreenState extends State<HomeCategoryViewScreen> {
  ///List<String> items = ["Biologica", "Biodinamica", "Integrato", "Produttori"];

// CATEGORY HOME "Agricultura Biologica", "Agricultura Biodinamica", "Agricultura Integrato", "KM Zero", "Prodotti Biologici"
  List<String> itemsaBioAgriculture = [
    AppLocalizations.translate('agricultureBiological').toString(),
    AppLocalizations.translate('agricultureBiodynamic').toString(),
    AppLocalizations.translate('agricultureIntegration').toString(),
    AppLocalizations.translate('agricultureKmZero').toString(),
    AppLocalizations.translate('productsBio').toString(),
  ];
  //BEEKEEPING APICOLTURA :"Miel",  "Cera", "Propoli", "Prodotti","Meteriali Apicultura"
  List<String> itemsBioApicoltura = [
    AppLocalizations.translate('honey').toString(),
    AppLocalizations.translate('cara').toString(),
    AppLocalizations.translate('propolis').toString(),
    AppLocalizations.translate('products').toString(),
    AppLocalizations.translate('beekeepingMeterials').toString(),
  ];

  //GREEN BUILDING
  // List<String> itemsBioEdilizia = ["Canapa", "Isolamento", "Produttori"];
  List<String> itemsBioEdilizia = [
    AppLocalizations.translate('honey').toString(),
    AppLocalizations.translate('isolation').toString(),
    AppLocalizations.translate('propolis').toString(),
  ];

  //HOTEL SECTION
  //List<String> itemsBioHotel = ["R&B Bio", "Hotel Bio", "Agroturisme Bio"];
  List<String> itemsBioHotel = [
    AppLocalizations.translate('airBnbBio').toString(),
    AppLocalizations.translate('hotelBio').toString(),
    AppLocalizations.translate('farmHouseBio').toString(),
  ];

  final elementKey = GlobalKey<FormState>();
  //get elementKey => 1020;

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    Axis.vertical;
    // 4;

    //   ------------------------   INITE HEADER AGRICULTURE ----------------------------------

    final List<CustomerCategory> items = <CustomerCategory>[
      CustomerCategory(
        // description: 'agricultureBiologique',
        description:
            AppLocalizations.translate('agricultureBiological').toString(),
        subtitle:
            AppLocalizations.translate('agricultureBiological').toString(),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
        // builder: (context) => const Agricultura(),
      ),
      CustomerCategory(
        description:
            AppLocalizations.translate('agricultureBiodynamic').toString(),
        subtitle:
            AppLocalizations.translate('agricultureBiodynamic').toString(),
        // builder: (context) => const Biodynamique(),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
      CustomerCategory(
        description:
            AppLocalizations.translate('agricultureIntegration').toString(),
        subtitle:
            AppLocalizations.translate('agricultureIntegration').toString(),
        // builder: (context) => const ProfilePage(),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
      CustomerCategory(
        description: AppLocalizations.translate('agricultureKmZero').toString(),
        subtitle: AppLocalizations.translate('agricultureKmZero').toString(),
        // builder: (context) => const ProfilePage(),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
      CustomerCategory(
        description:
            AppLocalizations.translate('productsBiologique').toString(),
        subtitle: AppLocalizations.translate('productsBiologique').toString(),
        // builder: (context) => const ProfilePage(),
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
      CustomerCategory(
        description:
            AppLocalizations.translate('productsBiologique').toString(),
        subtitle: AppLocalizations.translate('productsBiologique').toString(),
        // builder: (context) => const ProfilePage()
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
      CustomerCategory(
        description: AppLocalizations.translate('infoProducts').toString(),
        subtitle: AppLocalizations.translate('infoProducts').toString(),
        // builder: (context) => const ProfileAdmin()
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),
    ];

    final headerListBioAgriculture =  ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 4.0, bottom: 30.0)
            : const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 30.0);

        var itemsaBioAgriculture2 = itemsaBioAgriculture;
        return  Padding(
          padding: padding,
          child:  InkWell(
            onTap: () {
              /*    if (items[index].description == "agricultureBiologique") {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductsScreen(
                            name: 'agricultureBiologique',
                            slug: 'agricultureBiologique',
                            key: elementKey,
                          ),
                        ));
                      }*/
              //ProductDetailScreen
              if (items[index].description ==
                  AppLocalizations.translate('agricultureBiological')
                      .toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AgricultureBiologique(),
                ));
              }
              if (items[index].description ==
                  AppLocalizations.translate('agricultureBiodynamic')
                      .toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AgricultureBiodymamique(),
                ));
              }
              if (items[index].description ==
                  AppLocalizations.translate('agricultureIntegration')
                      .toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AgricultureIntegration(),
                ));
              }
              if (items[index].description ==
                  AppLocalizations.translate('agricultureKmZero').toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AgricultureKmZero(),
                ));
              }
              if (items[index].description ==
                  AppLocalizations.translate('productsBiologique').toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductsBiologique(),
                ));
              } //list des producteurs agriculture biologique
              if (items[index].description ==
                  AppLocalizations.translate('infoProducts').toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const InfoProducers(),
                ));
              }
              // debug
              // if (kDebugMode) {
              //  print('Card selected');
              //  }
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
              //height: 200.0,
              width: 160.0,
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
                                  index % itemsaBioAgriculture2.length],
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

              // height: 200.0,
              //width: 200.0,
              width: 160.0,
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
              // height: 200.0,
              //width: 200.0,
              width: 160.0,
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

              // height: 200.0,
              //width: 200.0,
              width: 160.0,
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
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        //  height: 850.0,
        // scrollDirection: Axis.vertical,

        // child: SizedBox(
        // width: 600,
        // height: 150,

        // child: Center(
        //child: OverflowBox(
        child: new Stack(
          // child: ListView(
          // overflow: Overflow.visible,

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
                        // SearchWidget(), // SEARCHE
                        // ok const TopPromoSlider(), // MENU PROMOTION HOME
                        //const CategoryHomePageWidget() ,               // GRID GESTION CATEGORY HOME
                        // const HomeListViewAgriculureScree(),
                        // PopularMenu(), // MENU POPULA FRESH EVALY STOR VAOUCHER
                        SizedBox(
                          height: 10,
                          child: Container(
                            color: const Color(0xFFf5f6f7),
                          ),
                        ),
                      ],
                    ),
                  ),

                  new Align(
                    alignment: Alignment.centerLeft,
                    child: new Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: const Text(
                          ' Agricoltura , Apicoltura, Bioedilizia, Hotel ',
                          // ignore: unnecessary_const
                          style: const TextStyle(
                              color: Color.fromARGB(179, 36, 11, 145)),
                        )),
                  ),
                  Expanded(
                      //flex: 10,
                      // height: 300.0,
                      //width: _width,
                      child: ListView(
                          // This next line does the trick.
                          scrollDirection: Axis.vertical,
                          children: <Widget>[
                        /* Container(
                          width: 100.0,
                          margin: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                          color: Color.fromARGB(255, 245, 242, 241),
                          child: Text(
                            "Il mercato Biologica online number on :)",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 202, 61, 14),
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                        */
                        Container(
                          width: 160.0,
                          margin: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                          color: Color.fromARGB(255, 131, 224, 131),
                          child: Text(
                            "AGRICULTURA BIOlOGICA",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            height: 200.0,
                            width: 60,
                            // width: _width,
                            child: headerListBioAgriculture),
                        Container(
                          width: 90.0,
                          margin: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                          color: Color.fromARGB(255, 233, 219, 31),
                          child: Text("APICOLTURA BIOLOGICA",
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        new SizedBox(
                            height: 200.0,
                            width: 60,
                            // width: _width,
                            child: headerListApicoltura),
                        Container(
                          //  width: 90.0,
                          margin: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 5.0, bottom: 8.0),
                          color: Color.fromARGB(255, 182, 146, 79),
                          child:
                              Text("BIOEDILIZIA", textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        new SizedBox(
                            height: 200.0,
                            width: 60,
                            // width: _width,
                            // width: _width,
                            child: headerListBioEdilizia),
                        Container(
                          width: 90.0,
                          margin: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 5.0, bottom: 8.0),
                          color: Color.fromARGB(255, 163, 185, 245),
                          child: Text("HOTEL BIOLOGICA",
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        new SizedBox(
                            height: 200.0,
                            width: 60,
                            // width: _width,
                            child: headerListBioHotel),
                        const SizedBox(
                          height: 15,
                        ),

                        new SizedBox(
                          height: 350.0,
                          // width: 150,
                          width: _width,
                          child: new Expanded(child:
                              ListView.builder(itemBuilder: (context, index) {
                            return new ListTile(
                              title: new Column(
                                children: <Widget>[
                                  new Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      new Container(
                                        height: 72.0,
                                        width: 72.0,
                                        decoration: new BoxDecoration(
                                            color: Colors.lightGreen,
                                            boxShadow: [
                                              new BoxShadow(
                                                  color: Colors.black
                                                      .withAlpha(70),
                                                  offset:
                                                      const Offset(2.0, 2.0),
                                                  blurRadius: 2.0)
                                            ],
                                            borderRadius: const BorderRadius
                                                    .all(
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                        ),

                        //-------------------------------------- INIT MY ITEM HEADER  -----------------------------------

                        const Icon(
                          Icons.shopping_cart,
                          color: Color(0xFF273A48),
                        )

                        //-------------------------------------- INIT MY ITEM HEADER  -----------------------------------
                      ])),

                  /*  new Expanded(child:
                          ListView.builder(itemBuilder: (context, index) {
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

                                  /* OK  new Expanded(
                                      child: new Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      */
                                  //-------------------------------------- INIT MY ITEM HEADER  -----------------------------------
                                ],
                              ),
                              const Divider(),
                            ],
                          ),
                        );
                      }*/

                  //  )),

                  //***************************** ***********************
                ],

                //***************************** END ITEMS  ***********************
              ),
            ),
          ],
        ),
        // )
        // )
        // Axis.vertical;
        //scrollDirection: Axis.horizontal,
        //itemCount: itemsBioHotel.length,
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

/* okk class _HomeCategoryViewScreenState
    extends State<HomeCategoryViewScreen> {
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
