import 'package:ecobioweb/category/components/gestion_agriculture_bio.dart';
import 'package:ecobioweb/category/detailCategory/agriculture_biologique.dart';
import 'package:ecobioweb/roots/trunk/branches/business/agricultures/agriculture_biological/screens/agriculture_biologique_screenOK.dart';
import 'package:ecobioweb/roots/trunk/branches/business/honey/honet_Propolis_bio/screens/honey_biological_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../roots/trunk/branches/business/agricultures/agriculture_biodynamica/screens/agriculture_biodynamica_screen.dart';
import '../../roots/trunk/branches/business/agricultures/agriculture_biological/screens/agriculture_biologique_screen.dart';
import '../../roots/trunk/branches/localisation/translation/components/appLocalizations.dart';
import '../../roots/trunk/branches/menu/menu_home/models/background.dart';
import '../../roots/trunk/branches/menu/navigation_bar/components/customerCategory.dart';
import '../detailCategory/product_home.dart';
import '../detailCategory/agriculture_integration.dart';
import '../detailCategory/agriculture_km_zero.dart';
import '../detailCategory/info_producers.dart';
import '../detailCategory/products_biologique.dart';

//https://stackoverflow.com/questions/51910725/flutter-displaying-two-listviews-on-one-screen

class HomeCategoryViewScreen extends StatefulWidget {
  const HomeCategoryViewScreen({Key? key}) : super(key: key);

  String get title => 'Benvenuti';

  @override
  //_HomeCategoryViewScreenState createState() => _HomeCategoryViewScreenState();
  _HomeCategoryViewScreenState createState() {
    return _HomeCategoryViewScreenState();
  }
}

class _HomeCategoryViewScreenState extends State<HomeCategoryViewScreen> {
  ///List<String> items = ["Biologica", "Biodinamica", "Integrato", "Produttori"];

// CATEGORY HOME "Agricultura Biologica", "Agricultura Biodinamica", "Agricultura Integrato", "KM Zero", "Prodotti Biologici"
  List<String> itemsaBioAgriculture = [
    AppLocalizations.translate('agricultureBiological').toString(),
    AppLocalizations.translate('agricultureBiodynamic').toString(),
    AppLocalizations.translate('agricultureIntegration').toString(),
    AppLocalizations.translate('agricultureBioVegan').toString(),
    AppLocalizations.translate('agricultureKmZero').toString(),
    AppLocalizations.translate('productsBiologiques').toString(),
  ];
  //BEEKEEPING APICOLTURA :"Miel",  "Cera", "Propoli", "Prodotti","Meteriali Apicultura"
  List<String> itemsBioApicoltura = [
    AppLocalizations.translate('honey').toString(),
    AppLocalizations.translate('cara').toString(),
    AppLocalizations.translate('propolis').toString(),
    AppLocalizations.translate('products').toString(),
    AppLocalizations.translate('beekeepingMeterials').toString(),
    AppLocalizations.translate('cooperativesBiological').toString(),
  ];

  //GREEN BUILDING
  // List<String> itemsBioEdilizia = ["Canapa", "Isolamento", "Produttori"];
  List<String> itemsBioEdilizia = [
    AppLocalizations.translate('hanf').toString(),
    AppLocalizations.translate('greenBuilderProducts').toString(),
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

    Axis.horizontal;
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
        // builder: (context) => const AdminScreen()
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),

      CustomerCategory(
        description: AppLocalizations.translate('honey').toString(),
        subtitle: AppLocalizations.translate('honey').toString(),
        // builder: (context) => const ProfileAdmin()
        trailing: const Icon(Icons.arrow_forward_ios_outlined),
      ),

    ];


    //   ------------------------  INITE HEADER AGRICULTURE ----------------------------------

    final headerListBioAgriculture =  ListView.builder(

      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: itemsaBioAgriculture.length,

      itemBuilder: (context, index) {
        final _width = MediaQuery.of(context).size.width;
        final _heigth=MediaQuery.of(context).size.height;

            EdgeInsets padding;
            EdgeInsets scroll =const EdgeInsets.symmetric(horizontal: 15);
        if (index == 0) {
          padding = const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 4.0, bottom: 10.0);
        } else {
          padding = const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 4.0, bottom: 10.0);
        }

       // var itemsaBioAgriculture2 = itemsaBioAgriculture;
       //  return  Padding(
        return  Container(
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
                // Navigator.of(context).push(MaterialPageRoute(
                //  builder: (context) => GestionAgriBio(),
                // ));


                Navigator.of(context).push(MaterialPageRoute(
                 /// builder: (context) => AgricultureBiologique(item: GestionAgricultureBio().product, itemCart: GestionAgricultureBio().itemCart)
                  //builder: (context) => AgricultureBiologique(item: GestionAgricultureBio().product),
                    builder: (context) => AgricultureBiologiqueScreen(item: GestionAgricultureBio().product),
                ));
              }
              if (items[index].description ==
                  AppLocalizations.translate('agricultureBiodynamic')
                      .toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  // builder: (context) => const AgricultureBiodymamique(),
                  builder: (context) =>  AgricultureBiodynamicaScreen(),
                ));
              }
              if (items[index].description ==
                  AppLocalizations.translate('agricultureIntegration')
                      .toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AgricultureIntegration(),
                ));
              }
              if (items[index].description ==
                  AppLocalizations.translate('agricultureKmZero').toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const AgricultureKmZero(),
                ));
              }
              if (items[index].description ==
                  AppLocalizations.translate('productsBiologiques').toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ProductsBiologique(),
                ));
              } //list des producteurs agriculture biologique
              if (items[index].description ==
                  AppLocalizations.translate('infoProducts').toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const InfoProducers(),
                ));
              }

              if (items[index].description ==
                  AppLocalizations.translate('honey').toString()) {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>  HoneyBiologicalScreen(),
                ));
              }
              // debug
              // if (kDebugMode) {
              //  print('Card selected');
              //  }
            },
              // child: Container(
              //     height: 200,
              //     width:_width,
              //     child: const SingleChildScrollView(
              //         scrollDirection:Axis.horizontal,
              //         child: Text(
              //             "Long text here which is longer than the container height")))
            // child: Row(children:<Widget> [
            //   Flexible(
            //       flex: 5,
            //       child:  Text(AppLocalizations.translate('agricolturaBio').toString().toUpperCase(),
            //           textAlign: TextAlign.center
            //       )
            //   )
            // ],),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightGreen,

                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: DecorationImage(
                  image: ExactAssetImage(
                       //  'assets/images/agriculture/img_${index % itemsaBioAgriculture.length}.png'),
                      // ok all
                      './assets/images/agriculture/agriculture_${index % itemsaBioAgriculture.length}.png'),
                    //  '/images/agriculture/agriculture_${index % itemsaBioAgriculture.length}.png'),
                     /// '.../agriculture_${index % itemsaBioAgriculture.length}.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              height: 200.0,
              width: 165.0,
              // width: 160.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF273A48),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        height: 30.0,
                        //width: _width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text( itemsaBioAgriculture[index % itemsaBioAgriculture.length],
                              style: const TextStyle(color: Colors.white,fontSize: 12),
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
      // scrollDirection: Axis.horizontal,
      // shrinkWrap: true,
      // itemCount: itemsaBioAgriculture.length,
    );

    //   ------------------------  END  HEADER AGRICULTURE ----------------------------------
    //   ------------------------   INITE HEADER APICOLTURA ----------------------------------
    final headerListApicoltura = ListView.builder(
      itemBuilder: (context, index) {

      //  EdgeInsets padding= EdgeInsets.all(MediaQuery.of(context).size.width);
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 4.0, bottom: 4.0)
            : const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 4.0);

        return Padding(
          padding: padding,
          child: InkWell(
            onTap: () {
              if (kDebugMode) {
                print('Card selected');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightGreen,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: DecorationImage(
                  image: ExactAssetImage(
                    //  'assets/images/apiculture/img_${index % itemsBioApicoltura.length}.jpg'),
                    // ok all
                       './assets/images/apiculture/apiculture_${index % itemsBioApicoltura.length}.jpg'),
                    //  '/images/apiculture/apiculture_${index % itemsBioApicoltura.length}.jpg'),
                     // '.../apiculture_${index % itemsBioApicoltura.length}.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),

              height: 200.0,
              //width: 200.0,
              width: 165.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF273A48),
                            // ignore: unnecessary_const
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        height: 30.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(child: Text(
                              itemsBioApicoltura[index% itemsBioApicoltura.length],
                              style: const TextStyle(color: Colors.white,fontSize: 12),
                              ),
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

    final headerListBioEdilizia = ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 4.0, bottom: 4.0)
            : const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 4.0, bottom: 4.0);

        return Padding(
          padding: padding,
          child: InkWell(
            onTap: () {
              if (kDebugMode) {
                print('Card selected');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightGreen,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: DecorationImage(
                
                  image: ExactAssetImage(
                   'assets/images/bioedilizia/img_${index% itemsBioEdilizia.length}.jpg'),
                  //  './assets/images/bioedilizia/bioedilizia_${index % itemsBioEdilizia.length}.jpg'),
                      //'.../bioedilizia_${index % itemsBioEdilizia.length}.jpg'),
                    //  'images/bioedilizia/bioedilizia_${index % itemsBioEdilizia.length}.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),

               height: 200.0,
              // height: 200.0,
              //width: 200.0,
              width: 165.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF273A48),
                            // ignore: unnecessary_const
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        height: 30.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              itemsBioEdilizia[index % itemsBioEdilizia.length],
                              style: const TextStyle(color: Colors.white,fontSize: 12),
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

    final headerListBioHotel = ListView.builder(
      itemBuilder: (context, index) {
        EdgeInsets padding = index == 0
            ? const EdgeInsets.only(
                left: 20.0, right: 10.0, top: 4.0, bottom: 4.0)
            : const EdgeInsets.only(
                left: 10.0, right: 10.0, top: 4.0, bottom: 4.0);

        return Padding(
          padding: padding,
          child: InkWell(
            onTap: () {
              if (kDebugMode) {
                print('Card selected');
              }
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.lightGreen,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withAlpha(70),
                      offset: const Offset(3.0, 10.0),
                      blurRadius: 15.0)
                ],
                image: DecorationImage(
                 image: ExactAssetImage('./assets/images/hotel/hotel_${index % itemsBioHotel.length}.jpg'),
                  //image: ExactAssetImage('.../hotel/hotel_${index % itemsBioHotel.length}.jpg'),
                  fit: BoxFit.fitHeight,
                ),
              ),

               height: 200.0,
              //width: 200.0,
              width: 165.0,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Color(0xFF273A48),
                            // ignore: unnecessary_const
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0))),
                        height: 30.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              itemsBioHotel[index % itemsBioHotel.length],
                              style: const TextStyle(color: Colors.white,fontSize: 12),
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

    final body = Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
              icon: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      backgroundColor: Colors.transparent,
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        //  height: 850.0,
        // scrollDirection: Axis.vertical,

        // child: SizedBox(
        // width: 600,
        // height: 150,

        // child: Center(
        //child: OverflowBox(
        child: Stack(
          // child: ListView(
          // overflow: Overflow.visible,

          children: <Widget>[
            Padding(
              // padding: const EdgeInsets.only(top: 40.0),
              padding: const EdgeInsets.only(top: 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
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

                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          ' Agricoltura , Apicoltura, Bioedilizia, Hotel ',
                          // ignore: unnecessary_const
                          style: TextStyle(
                              color: Color.fromARGB(179, 36, 11, 145)),
                        )),
                  ),
                  Expanded(
                      flex: 5,
                      // height: 300.0,
                     // width: _width,
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
                        //  width: 180.0,
                          margin: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                          color: const Color.fromARGB(255, 131, 224, 131),
                          // child: const Text(
                          //   "AGRICULTURA BIOlOGICA",
                          //   textAlign: TextAlign.center,
                          // ),
                        // child: Text(AppLocalizations.translate('agricolturaBio').toString().toUpperCase(),
                        //     textAlign: TextAlign.center),
                          
                          child: Row(children:<Widget> [
                            Flexible(
                                flex: 5,
                                child:  Text(AppLocalizations.translate('agricolturaBio').toString().toUpperCase(),
                                   textAlign: TextAlign.center))
                          ],),
                        ),

                        const SizedBox(
                          height: 15,
                        ),

                        SizedBox(
                            height: 200.0,
                             width: 60,
                             // height: _height,
                           //  width: _width,
                            child: headerListBioAgriculture),
                        //     SizedBox(
                        //       height: 200.0,
                        //         width: 60,
                        //       // height: _height,
                        //       //  width: _width,
                        //       // child: headerListBioAgriculture
                        //       child: SingleChildScrollView(
                        //         //scrollDirection: Axis.horizontal,
                        //         child: headerListBioAgriculture,
                        //       ),
                        //     ),

                        Container(
                          width: 90.0,
                          margin: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                          color: const Color.fromARGB(255, 233, 219, 31),
                          //child: const Text("APICOLTURA BIOLOGICA",  AppLocalizations.translate('pickCountry').toString()),
                            child: Text(AppLocalizations.translate('beekeepingBio').toString().toUpperCase(),
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            height: 200.0,
                            width: 60,
                            // width: _width,
                            child: headerListApicoltura),
                        Container(
                          //  width: 90.0,
                          margin: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 5.0, bottom: 8.0),
                          color: const Color.fromARGB(255, 182, 146, 79),
                          child:
                             // const Text("BIOEDILIZIA", textAlign: TextAlign.center),
                            Text(AppLocalizations.translate('greenBuilding').toString().toUpperCase(),
                                textAlign: TextAlign.center),
                            ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            height: 200.0,
                            width: 60,
                            // width: _width,
                            // width: _width,
                            child: headerListBioEdilizia),
                        Container(
                          width: 90.0,
                          margin: const EdgeInsets.only(
                              left: 5.0, right: 5.0, top: 5.0, bottom: 8.0),
                          color: const Color.fromARGB(255, 163, 185, 245),
                        //   child: const Text("HOTEL BIOLOGICA",
                        //       textAlign: TextAlign.center),
                        // ),
                          child:
                          Text(AppLocalizations.translate('hotelBio').toString().toUpperCase(),
                              textAlign: TextAlign.center),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            height: 200.0,
                            width: 60,
                            // width: _width,
                            child: headerListBioHotel),
                        const SizedBox(
                          height: 15,
                        ),

                        SizedBox(
                          height: 350.0,
                          // width: 150,
                          width: _width,
                          child: Expanded(
                              child:
                              ListView.builder(itemBuilder: (context, index) {
                            return ListTile(
                              title: Column(
                                children: <Widget>[
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 72.0,
                                        width: 72.0,
                                        decoration: BoxDecoration(
                                            color: Colors.lightGreen,
                                            boxShadow: [
                                              BoxShadow(
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
                                            image: DecorationImage(
                                              image: ExactAssetImage(
                                                 // './assets/images/agriculture/agriculture_${index % itemsaBioAgriculture.length}.png',
                                               // 'images/agriculture/agriculture_${index % itemsaBioAgriculture.length}.png',
                                                '.../agriculture/agriculture_${index % itemsaBioAgriculture.length}.png',
                                              ),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      const SizedBox(
                                        width: 8.0,
                                      ),

                                      //-------------------------------------- INIT MY ITEM HEADER  -----------------------------------

                                      const Expanded(
                                          child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
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
                      ]
                      )
                  ),


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

    /// backgroud black and with home app
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF273A48),
      ),
      child: Stack(
        children: <Widget>[
          CustomPaint(
            size: Size(_width, _height),
            //painter: new Background(),
            painter: Background(),
          ),
          body,
        ],
      ),
    );

 /* return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Stack(
              children: <Widget>[
                CustomPaint(
                  size: Size(_width, _height),
                  //painter: new Background(),
                  painter: Background(),
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
