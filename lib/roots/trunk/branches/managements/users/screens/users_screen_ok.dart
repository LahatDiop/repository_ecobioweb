//
//
//
// import 'package:ecobioweb/roots/trunk/branches/managements/users/components/users.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
// import '../../../../../../market/components/market.dart';
// import '../../../../../../market/providers/market_provider.dart';
// import '../../../commun_data_utils/responsive/responsive.dart';
// import '../../../commun_data_utils/utils/constants/constants.dart';
// import '../menu/side_menu_users.dart';
// import '../provider/users_provider.dart';
// import '../widgets/header.dart';
// import '../widgets/my_fields.dart';
// import '../widgets/search_field_users.dart';
// import '../widgets/users_data_info.dart';
// import '../widgets/storage_details.dart';
//
//
// class UsersScreen extends StatelessWidget {
//
//
//
//   List<Users> users=[];
//   List<Users> usersDataFilter=[];
//   List<Market> markets=[];
//
//   Map<String, Users> usersItems= UsersProvider().usersItems;
//
//   // void initState(){
//   //       fetchItems().whenComplete(() => print("UsersScreen"));
//   // }
//   //
//   // Future<void>  fetchItems() async {
//   //   final loadDataUsers=UsersProvider().getUsersList();
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return MultiProvider(providers:  [
//       ChangeNotifierProvider<MarketProvider>(create: (_)=>MarketProvider()),
//       ChangeNotifierProvider<UsersProvider>(create: (_) => UsersProvider()),
//
//     ],
//         child: Navigator(onGenerateRoute: (RouteSettings setting){
//
//           return MaterialPageRoute(builder:(context){
//             return UsersScreen();
//           });
//
//         }, ),
//         builder: (context,child){
//
//       final usersProvider=Provider.of<UsersProvider>(context);
//
//       if(context.read<UsersProvider>().getUsers.isEmpty) {
//           final loadDataUsers = context.read<UsersProvider>().getUsersList();
//       }
//       ///LIST USER DB
//       users=context.read<UsersProvider>().getUsers;
//
//       ///LIST USER FILTER SEARCH
//       usersDataFilter=context.read<UsersProvider>().getUserDataFilter;
//       usersItems=context.read<UsersProvider>().usersItems;
//
//           return SafeArea(
//             child: SingleChildScrollView(
//               primary: false,
//               padding: const EdgeInsets.all(defaultPadding),
//               child: Column(
//                 children: [
//                    Header(users),
//                   const SizedBox(height: defaultPadding),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         flex: 6,
//                         child: Column(
//                           children: [
//                             const MyFiles(),
//                             const SizedBox(height: defaultPadding),
//
//                             // const SingleChildScrollView(
//                             //  /// scrollDirection: Axis.horizontal,
//                             //   child:RecentFiles(),
//                             //
//                             // ),
//                            ///  Expanded(child: SearchFiedUsers()),
//                             //
//                                const Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Text("UsersScren"),
//
//                                         ///Expanded(child:   SearchField(users)),
//                                        ///  Expanded(child: SearchFieldUsers()),
//
//                                       ],
//                                     )
//                                   ],
//                                ),
//                               /// TABLE USERS DATA INFO
//                               UsersDataInfo(),
//                             if (Responsive.isMobile(context))
//                               const SizedBox(height: defaultPadding),
//                             if (Responsive.isMobile(context)) const StorageDetails(),
//                           ],
//                         ),
//                       ),
//                       if (!Responsive.isMobile(context))
//                         const SizedBox(width: defaultPadding),
//                       // On Mobile means if the screen is less than 850 we don't want to show it
//                       if (!Responsive.isMobile(context))
//                         const Expanded(
//                           flex: 2,
//                           child: StorageDetails(),
//                         ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           );
//         }
//     );
//   }
//
//   // @override
//   // Widget buildOK(BuildContext context) {
//   //   return SafeArea(
//   //     child: SingleChildScrollView(
//   //       primary: false,
//   //       padding: const EdgeInsets.all(defaultPadding),
//   //       child: Column(
//   //         children: [
//   //            Header(users),
//   //           const SizedBox(height: defaultPadding),
//   //           Row(
//   //             crossAxisAlignment: CrossAxisAlignment.start,
//   //             children: [
//   //               Expanded(
//   //                 flex: 6,
//   //                 child: Column(
//   //                   children: [
//   //                     const MyFiles(),
//   //                     const SizedBox(height: defaultPadding),
//   //
//   //                     // const SingleChildScrollView(
//   //                     //  /// scrollDirection: Axis.horizontal,
//   //                     //   child:RecentFiles(),
//   //                     //
//   //                     // ),
//   //                      UsersDataInfo(users),
//   //                     if (Responsive.isMobile(context))
//   //                       const SizedBox(height: defaultPadding),
//   //                     if (Responsive.isMobile(context)) const StorageDetails(),
//   //                   ],
//   //                 ),
//   //               ),
//   //               if (!Responsive.isMobile(context))
//   //                 const SizedBox(width: defaultPadding),
//   //               // On Mobile means if the screen is less than 850 we don't want to show it
//   //               if (!Responsive.isMobile(context))
//   //                 const Expanded(
//   //                   flex: 2,
//   //                   child: StorageDetails(),
//   //                 ),
//   //             ],
//   //           )
//   //         ],
//   //       ),
//   //     ),
//   //   );
//   // }
//
//
// }
