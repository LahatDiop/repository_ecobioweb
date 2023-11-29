// import 'package:flutter/material.dart';
// import '../../../../../../category/screens/categorySlider.dart';
// import '../../../../../../promotion/widgets/TopPromoSlider.dart';
// import '../../../search/widgets/search_widget.dart';
// import '../../widgets/popularMenu.dart';
// import '../components/brand_home_page.dart';
// import '../components/shop_home_page.dart';
//
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Column(
//         children: <Widget>[
//           const SearchWidget(), // SEARCHE
//           const TopPromoSlider(), // MENU PROMOTION
//           //const CategoryHomePageWidget() ,               // GRID GESTION CATEGORY HOME
//           // const HomeListViewAgriculureScree(),
//           PopularMenu(), // MENU POPULA FRESH EVALY STOR VAOUCHER
//           SizedBox(
//             height: 10,
//             child: Container(
//               color: const Color(0xFFf5f6f7),
//             ),
//           ),
//           const PreferredSize(
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
//           ),
//           SizedBox(
//             height: 10,
//             child: Container(
//               color: const Color(0xFFf5f6f7),
//             ),
//           ),
//           Expanded(
//             child: TabBarView(
//               children: [
//                 Container(
//                   color: Colors.white24,
//                   child: CategoryPage(slug: 'categories/'),
//                 ),
//                 Container(
//                   color: Colors.white24,
//                   child: BrandHomePage(slug: 'brands/?limit=20&page=1'),
//                 ),
//                 Container(
//                   color: Colors.white24,
//                   child: ShopHomePage(
//                     slug: 'custom/shops/?page=1&limit=15',
//                   ),
//                 ) // class name
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
