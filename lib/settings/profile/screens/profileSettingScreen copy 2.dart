// // ignore_for_file: unnecessary_new, unnecessary_const
//
// import 'dart:core';
// import 'package:flutter/material.dart';
// //import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';
// import '../../../search/widgets/search_widget.dart';
//
//
// class ProfileSettingScreen extends StatefulWidget {
//   const ProfileSettingScreen({Key? key}) : super(key: key);
//
//   String get title => 'Setting Profile';
//
//   @override
//   _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
// }
//
// class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
//   get child => null;
//
//   // final items = ['Privacy', 'Norme', 'Regole', 'Note Legali', 'Goat'];
//
//   final itemsLocalisation = ['Paese', 'Notifiche Push', 'Seleziona il Design'];
//   // final List<String> items;
//   @override
//   Widget build(BuildContext context) {
//     final items = ['Privacy', 'Norme', 'Regole', 'Note Legali', 'Goat'];
//
//     return SafeArea(
//       child: Column(
//         children: <Widget>[
//           const SearchWidget(), // SEARCHE
//           //  TopPromoSlider(), // MENU PROMOTION
//           //  PopularMenu(), // MENU AMBURGER
//           SizedBox(
//             height: 10,
//             child: Container(
//               color: const Color.fromARGB(255, 216, 136, 163),
//             ),
//           ),
//           Expanded(
//             child: SizedBox(
//               child: ListView.builder(
//                 itemCount: items.length,
//                 prototypeItem: const SizedBox(
//                   child: SearchWidget(),
//                 ),
//                 itemBuilder: (context, index) {
//                   return Column(
//                     children: <Widget>[
//                       // const SearchWidget(), // SEARCHE
//                       // const TopPromoSlider(), // MENU PROMOTION HOME
//                       //const CategoryHomePageWidget() ,               // GRID GESTION CATEGORY HOME
//                       // const HomeListViewAgriculureScree(),
//                       // PopularMenu(), // MENU POPULA FRESH EVALY STOR VAOUCHER
//                       ListTile(
//                         title: Text(items[index]),
//                       ),
//                       const Divider(), //
//                     ],
//                   );
//                 },
//               ),
//             ),
//           ),
//
//           SizedBox(
//             height: 10,
//             child: Container(
//               color: const Color.fromARGB(255, 216, 136, 163),
//               child: const Text(
//                 "Localization",
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ),
//
//           /* const PreferredSize(
//             preferredSize: Size.fromHeight(50.0),
//             child: TabBar(
//               labelColor: Colors.black,
//               tabs: [
//                 Tab(
//                   text: 'Categories',
//                 ),
//                 Tab(
//                   text: 'Brands',
//                 ),
//                 Tab(
//                   text: 'Shops',
//                 )
//               ], // list of tabs
//             ),
//           ),*/
//           SizedBox(
//             height: 10,
//             child: Container(
//               color: const Color(0xFFf5f6f7),
//             ),
//           ),
//           /* Expanded(
//              child: TabBarView(
//             children: [
//                 Container(
//                   color: Colors.white24,
//                   // child: CategoryPage(slug: 'categories/'),
//                 ),
//                 Container(
//                   color: Colors.white24,
//                   // child: BrandHomePage(slug: 'brands/?limit=20&page=1'),
//                 ),
//                 Container(
//                   color: Colors.white24,
//                   // child: ShopHomePage(
//                   // slug: 'custom/shops/?page=1&limit=15',
//                   //),
//                 ) // class name
//               ],
//             ),
//
//           ),*/
//         ],
//       ),
//     );
//
//     /* ok return SizedBox(
//       //  padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 10),
//       child: SizedBox(
//         child: ListView.builder(
//           itemCount: items.length,
//           prototypeItem: const SizedBox(
//             child: SearchWidget(),
//           ),
//           itemBuilder: (context, index) {
//             return Column(
//               children: <Widget>[
//                 // const SearchWidget(), // SEARCHE
//                 // const TopPromoSlider(), // MENU PROMOTION HOME
//                 //const CategoryHomePageWidget() ,               // GRID GESTION CATEGORY HOME
//                 // const HomeListViewAgriculureScree(),
//                 // PopularMenu(), // MENU POPULA FRESH EVALY STOR VAOUCHER
//                 ListTile(
//                   title: Text(items[index]),
//                 ),
//                 const Divider(), //                           <-- Divider
//               ],
//             );
//           },
//         ),
//       ),
//     );
//
//     */
//   }
// }
