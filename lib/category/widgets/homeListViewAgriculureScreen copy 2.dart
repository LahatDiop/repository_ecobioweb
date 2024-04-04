// // ignore_for_file: unnecessary_new, prefer_const_constructors, deprecated_member_use
//
// import 'package:flutter/material.dart';
//
// //https://stackoverflow.com/questions/51910725/flutter-displaying-two-listviews-on-one-screen
//
// class HomeListViewAgriculureScree extends StatefulWidget {
//   const HomeListViewAgriculureScree({Key? key}) : super(key: key);
//
//   String get title => 'lahat';
//
//   @override
//   _HomeListViewAgriculureScreeState createState() =>
//       _HomeListViewAgriculureScreeState();
// }
//
// /*class _HomeListViewAgriculureScreeState
//     extends State<HomeListViewAgriculureScree> {
//   ///List<String> items = ["Biologica", "Biodinamica", "Integrato", "Produttori"];
//
//   List<String> itemsaBioAgriculture = [
//     "Biologica",
//     "Biodinamica",
//     "Integrato",
//     "Produttori"
//   ];
//   //beekeeping
//   List<String> itemsBioApicoltura = ["Miel", "Cera", "Propoli", "Produttori"];
//
//   //green buildin
//   List<String> itemsBioEdilizia = ["Canapa", "Isolamento", "Produttori"];
//
//   //green buildin
//   List<String> itemsBioHotel = ["R&B", "Hotel"];
//
//   get posts => null;
//
// @override
//   Widget build(BuildContext context) {
//     final _width = MediaQuery.of(context).size.width;
//     final _height = MediaQuery.of(context).size.height;
//     Axis.vertical;
//     //4;
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           Container(
//               color: Colors.white.withOpacity(0.95),
//               width: 400,
//               height: 400,
//               child: Text("ggggrf")),
//           ListView(
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true, physics: const BouncingScrollPhysics(),
//             primary: false,
//             children: posts,
//           ),
//         ],
//       ),
//     );
//   }
// }
// */
//
// class _HomeListViewAgriculureScreeState
//     extends State<HomeListViewAgriculureScree> {
//   //list category groups home page
//
//   // agricultura
//   List<String> itemsaBioAgriculture = [
//     "Biologica",
//     "Biodinamica",
//     "Integrato",
//     "Produttori"
//   ];
//   //beekeeping
//   List<String> itemsBioApicoltura = ["Miel", "Cera", "Propoli", "Produttori"];
//
//   //green buildin
//   List<String> itemsBioEdilizia = ["Canapa", "Isolamento", "Produttori"];
//
//   //Hotel B&B
//   List<String> itemsBioHotel = ["R&B", "Hotel"];
//
//   @override
//   Widget build(BuildContext context) {
//     //return SafeArea();
//     //const MyApp({Key? key}) : super(key: key);
//
//     // const title = 'Horizontal List';
//
//     // return MaterialApp(
//     // title: title,
//     // home: Scaffold(
//     // appBar: AppBar(
//     //    title: const Text(title),
//     //  ),
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20.0),
//         height: 850.0,
//         child: ListView(
//           // This next line does the trick.
//           scrollDirection: Axis.vertical,
//           children: <Widget>[
//             Container(
//               width: 100.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Color.fromARGB(255, 196, 183, 182),
//               child: Text("Il mercatoo biologica online"),
//             ),
//             Container(
//               width: 100.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Colors.blue,
//               child: Text(
//                   "Agroltura Bio, Apicoltuta Bio, Bioedilizia, Hoter R&B BIo"),
//             ),
//
//             // -----------------------------------------------------------INIT HOME AGRICULTUR-----------------------------------------------------------------------
//             Container(
//               width: 160.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Color.fromARGB(255, 131, 224, 131),
//               child: Text(
//                 "AGRICULTURA",
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             SizedBox(
//               height: 300.0,
//               child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const <Widget>[
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("Km 0"),
//                     ),
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("Integrato"),
//                     ),
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("Naturale"),
//                     ),
//                     /* OutlineButton(onPressed: null, child: Text("Km 0")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Integrato")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Naturale"))
//                     */
//                   ]),
//             ),
//
//             // -----------------------------------------------------------END HOME AGRICULTUR-----------------------------------------------------------------------
//
//             // -----------------------------------------------------------INIT HOME APICULTURE---------------------------------------------------------------------
//             Container(
//               width: 90.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Color.fromARGB(255, 233, 219, 31),
//               child: Text("APICOLTURA", textAlign: TextAlign.center),
//             ),
//             SizedBox(
//               height: 300.0,
//               child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const <Widget>[
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("Miele"),
//                     ),
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("Prodotti"),
//                     ),
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("Materiali"),
//                     ),
//
//                     /*  OutlineButton(onPressed: null, child: Text("Miele")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Prodotti")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Materiali"))
//                  */
//                   ]),
//             ),
//
//             // -----------------------------------------------------------END HOME APICULTURE-----------------------------------------------------------------------
//
//             // -----------------------------------------------------------INIT HOME BIOEDILIZIA---------------------------------------------------------------------
//             Container(
//               width: 90.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Color.fromARGB(255, 211, 221, 191),
//               child: Text("BIOEDILIZIA", textAlign: TextAlign.center),
//             ),
//             SizedBox(
//               height: 300.0,
//               child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const <Widget>[
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("Materiali"),
//                     ),
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("Isolamento"),
//                     ),
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("Materiali"),
//                     ),
//                     /*  OutlineButton(onPressed: null, child: Text("Materiali")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Isolamento")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Materiali"))
//                  */
//                   ]),
//             ),
//
//             // -----------------------------------------------------------END HOME BIOEDILIZIA-----------------------------------------------------------------------
//
//             // -----------------------------------------------------------INIT HOME HOTEL R&B-----------------------------------------------------------------------
//             Container(
//               width: 90.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Color.fromARGB(255, 241, 60, 181),
//               child: Text("HOTEL R&B", textAlign: TextAlign.center),
//             ),
//             SizedBox(
//               height: 300.0,
//               child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const <Widget>[
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("Hotel"),
//                     ),
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("R"),
//                     ),
//                     OutlinedButton(
//                       onPressed: null,
//                       style: ButtonStyle(
//                           // shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
//                           ),
//                       child: Text("B&B"),
//                     ),
//                     /*  OutlineButton(onPressed: null, child: Text("Hotel")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("R&B")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("B&B"))
//                  */
//                   ]),
//             ),
//
//             // -----------------------------------------------------------END HOME HOTEL R&B-----------------------------------------------------------------------
//           ],
//         ),
//       ),
//       //  ),
//     );
//   }
// }
//
// /* OK
// class _HomeListViewAgriculureScreeState
//     extends State<HomeListViewAgriculureScree> {
//   @override
//   Widget build(BuildContext context) {
//     //return SafeArea();
//     //const MyApp({Key? key}) : super(key: key);
//
//     const title = 'Horizontal List';
//
//     // return MaterialApp(
//     // title: title,
//     // home: Scaffold(
//     // appBar: AppBar(
//     //    title: const Text(title),
//     //  ),
//     return Scaffold(
//       body: Container(
//         margin: const EdgeInsets.symmetric(vertical: 20.0),
//         height: 850.0,
//         child: ListView(
//           // This next line does the trick.
//           scrollDirection: Axis.vertical,
//           children: <Widget>[
//             Container(
//               width: 100.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Color.fromARGB(255, 196, 183, 182),
//               child: Text("Il mercatoo biologica online"),
//             ),
//             Container(
//               width: 100.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Colors.blue,
//               child: Text(
//                   "Agroltura Bio, Apicoltuta Bio, Bioedilizia, Hoter R&B BIo"),
//             ),
//             Container(
//               width: 160.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Color.fromARGB(255, 131, 224, 131),
//               child: Text(
//                 "AGRICULTURA",
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             SizedBox(
//               height: 300.0,
//               child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const <Widget>[
//                     OutlineButton(onPressed: null, child: Text("Km 0")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Integrato")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Naturale"))
//                   ]),
//             ),
//             Container(
//               width: 90.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Color.fromARGB(255, 233, 219, 31),
//               child: Text("APICOLTURA", textAlign: TextAlign.center),
//             ),
//             SizedBox(
//               height: 300.0,
//               child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const <Widget>[
//                     OutlineButton(onPressed: null, child: Text("Miele")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Prodotti")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Materiali"))
//                   ]),
//             ),
//             Container(
//               width: 90.0,
//               margin: const EdgeInsets.only(
//                   left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
//               color: Color.fromARGB(255, 211, 221, 191),
//               child: Text("BIOEDILIZIA", textAlign: TextAlign.center),
//             ),
//             SizedBox(
//               height: 300.0,
//               child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: const <Widget>[
//                     OutlineButton(onPressed: null, child: Text("Materiali")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Isolamento")),
//                     Padding(padding: EdgeInsets.all(5.00)),
//                     OutlineButton(onPressed: null, child: Text("Materiali"))
//                   ]),
//             ),
//           ],
//         ),
//       ),
//       //  ),
//     );
//   }
// }
//
// */
