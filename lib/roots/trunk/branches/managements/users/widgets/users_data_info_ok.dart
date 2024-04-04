//
//
// import 'package:ecobioweb/roots/trunk/branches/managements/users/components/recent_file.dart';
// import 'package:ecobioweb/roots/trunk/branches/managements/users/widgets/search_field_users.dart';
// import 'package:ecobioweb/roots/trunk/branches/menu/menu_settings/settings/dashboard/widgets/header.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
//
// import '../../../commun_data_utils/responsive/responsive.dart';
// import '../../../commun_data_utils/utils/constants/constants.dart';
// import '../../../localisation/translation/components/appLocalizations.dart';
// import '../components/users.dart';
// import '../provider/users_provider.dart';
//
//
//
// class UsersDataInfo extends StatelessWidget {
//
//    // UsersDataInfo(this.users,this.usersDataFilter, { Key? key}) : super(key: key);
//   // UsersDataInfo(this.users,{ Key? key}) : super(key: key);
//   UsersDataInfo({ Key? key}) : super(key: key);
//
//   List<Users>? users;
//   List<Users> usersDataFilter=[];
//   List<Users> usersDataFilteFinal=[];
//   Map<String, Users> usersItems= {};
//
//   @override
//   Widget build(BuildContext context) {
//     final TextEditingController searchController = TextEditingController();
//     ScrollController? _controllerScroll;
//     var diff = 0.0;
//
//     var posSelected = 0;
//     var height = 0.0;
//     final bool useUiOverlay;
//     final bool useSafeArea;
//
//     bool isShow = true;
//
//     String search = "";
//     String search_point = "";
//     String last_pick = "";
//     return MultiProvider(providers:  [
//       ChangeNotifierProvider<UsersProvider>(create: (_)=>UsersProvider()),
//     ],
//         child: Navigator(onGenerateRoute: (RouteSettings settings){
//
//           return MaterialPageRoute(builder: (context){
//             return UsersDataInfo();
//           });
//         },
//         ),
//
//         builder: (context,child){
//
//
//           height = MediaQuery.of(context).size.height;
//           search = AppLocalizations.translate('search');
//           search_point =
//           // AppLocalizations.of(context)!.translate('search_point');
//           AppLocalizations.translate('search_point');
//           last_pick = AppLocalizations.translate('last_picks');
//           //search_point = Translation.search(context)!;
//
//           final usersProvider=Provider.of<UsersProvider>(context);
//
//           if(context.read<UsersProvider>().getUsers.isEmpty) {
//             final loadDataUsers = context.read<UsersProvider>().getUsersList();
//           }
//           ///LIST USER DB
//           users=context.read<UsersProvider>().getUsers;
//
//           ///LIST USER FILTER SEARCH
//           usersDataFilter=context.read<UsersProvider>().getUserDataFilter;
//           usersItems=context.read<UsersProvider>().usersItems;
//
//           // var up=context.read<UsersProvider>().usersDataFilter
//           /// var up=  Provider<List<UsersProvider>>.value(value: usersDataFilter);
//           ///
//           return  SafeArea(
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               ///  primary: false,
//               /// padding: const EdgeInsets.all(defaultPadding),
//
//               child: Container(
//                   padding: const EdgeInsets.all(defaultPadding),
//                   decoration: const BoxDecoration(
//                     color: secondaryColor,
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                   ),
//                   /// height: 500,
//                   /// child: users!.isNotEmpty?
//                  /// child: usersDataFilter.isNotEmpty?
//               child:
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//
//
//                     //  const Row(
//                     //     children: [
//                     //              Text("data Test q"),
//                     //        // TextField(
//                     //        //   decoration: InputDecoration(
//                     //        //     ///  labelText: textInputSearch,
//                     //        //     hintText:"...",
//                     //        //   ),
//                     //        // ),
//                     //        /// SearchField(),
//                     //       // Expanded(child: SearchFieldUsers()),
//                     //     ],
//                     // ),
//                           /// const SearchFieldUsers(),
//                            // const Row(
//                            //   children: [
//                            //     if (!Responsive.isMobile(context))
//                            //       Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
//                            //     ///Expanded(child: SearchField(users)),
//                            //     const Expanded(child: SearchFieldUsers()),
//                            //   ],
//                            // ),
//
//                       Text(
//                         "All Users",
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//
//                       //   SingleChildScrollView(
//                       // physics: const BouncingScrollPhysics(),
//                       // scrollDirection: Axis.horizontal,
//                       //  SingleChildScrollView(
//                       //   scrollDirection: Axis.horizontal,
//                       // child: Expanded(
//
//                       SingleChildScrollView(
//
//                         scrollDirection: Axis.horizontal,
//                         child: DataTable(
//                           showCheckboxColumn: true,
//                           sortAscending: true,
//                           // sortColumnIndex: 3,
//
//                           columnSpacing: defaultPadding,
//                           // minWidth: 600,
//                           columns: const <DataColumn>[
//                             DataColumn(
//                               label: Text("Name"),
//                             ),
//                             DataColumn(
//                               label: Text("Code"),
//                             ),
//                             DataColumn(
//                               label: Text("email"),
//                             ),
//                             DataColumn(
//                               label: Text("Phone"),
//                             ),
//                             DataColumn(
//                               label: Text("Code Client"),
//                             ),
//                             DataColumn(
//                               label: Text("Code Dealer"),
//                             ),
//                             DataColumn(
//                               label: Text("Market"),
//                             ),
//                             DataColumn(
//                               label: Text("dateCreation"),
//                             ),
//                             // DataColumn(
//                             //   label: Text("Email"),
//                             // ),
//                             // DataColumn(
//                             //   label: Text("Phone"),
//                             // ),
//                             // DataColumn(
//                             //   label: Text("Role"),
//                             // ),
//                             // DataColumn(
//                             //   label: Text("Enabled"),
//                             // ),
//                             // DataColumn(
//                             //   label: Text("Market"),
//                             // ),
//                           ],
//                           // rows: List.generate(
//                           //   demoRecentFilesUsers.length,
//                           //   (index) => recentFileDataRow(demoRecentFilesUsers[index]),
//                           // ),
//                           rows: List.generate(usersDataFilter.length,(index) => usersDataRow(listFilesUsers[index]),
//                             ///  rows: List.generate( listFilesUsers.length,(index) => usersDataRow(listFilesUsers[index]),
//                           ),
//                         ),
//                       ),
//                       // width: double.infinity,
//                       //width: double.maxFinite,
//                       // child: DataTable(
//                       //
//                       //
//                       //   columnSpacing: defaultPadding,
//                       //   // minWidth: 600,
//                       //   columns: const <DataColumn>[
//                       //     DataColumn(
//                       //       label: Text("Name"),
//                       //     ),
//                       //     DataColumn(
//                       //       label: Text("Code"),
//                       //     ),
//                       //     DataColumn(
//                       //       label: Text("email"),
//                       //     ),
//                       //     DataColumn(
//                       //       label: Text("Phone"),
//                       //     ),
//                       //     DataColumn(
//                       //       label: Text("Code Client"),
//                       //     ),
//                       //     DataColumn(
//                       //       label: Text("Code Dealer"),
//                       //     ),
//                       //     DataColumn(
//                       //       label: Text("Market"),
//                       //     ),
//                       //     DataColumn(
//                       //       label: Text("dateCreation"),
//                       //     ),
//                       //     // DataColumn(
//                       //     //   label: Text("Email"),
//                       //     // ),
//                       //     // DataColumn(
//                       //     //   label: Text("Phone"),
//                       //     // ),
//                       //     // DataColumn(
//                       //     //   label: Text("Role"),
//                       //     // ),
//                       //     // DataColumn(
//                       //     //   label: Text("Enabled"),
//                       //     // ),
//                       //     // DataColumn(
//                       //     //   label: Text("Market"),
//                       //     // ),
//                       //   ],
//                       //   // rows: List.generate(
//                       //   //   demoRecentFilesUsers.length,
//                       //   //   (index) => recentFileDataRow(demoRecentFilesUsers[index]),
//                       //   // ),
//                       //   rows: List.generate(
//                       //     listFilesUsers.length,
//                       //         (index) => recentFileDataRow(listFilesUsers[index]),
//                       //   ),
//                       // ),
//                       // ),
//                       //),
//                       // ),
//                       //),
//                       // SizedBox(
//                       //   width: double.infinity,
//                       //   child: DataTable(
//                       //     columnSpacing: defaultPadding,
//                       //     // minWidth: 600,
//                       //     columns: const <DataColumn>[
//                       //       DataColumn(
//                       //         label: Text("Code"),
//                       //       ),
//                       //       DataColumn(
//                       //         label: Text("Name "),
//                       //       ),
//                       //       DataColumn(
//                       //         label: Text("Date"),
//                       //       ),
//                       //       // DataColumn(
//                       //       //   label: Text("Email"),
//                       //       // ),
//                       //       // DataColumn(
//                       //       //   label: Text("Phone"),
//                       //       // ),
//                       //       // DataColumn(
//                       //       //   label: Text("Role"),
//                       //       // ),
//                       //       // DataColumn(
//                       //       //   label: Text("Enabled"),
//                       //       // ),
//                       //       // DataColumn(
//                       //       //   label: Text("Market"),
//                       //       // ),
//                       //     ],
//                       //     rows: List.generate(
//                       //       demoRecentFilesUsers.length,
//                       //       (index) => recentFileDataRow(demoRecentFilesUsers[index]),
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                       ///:Container()
//               ),
//             ),
//           );
//
//
//         }
//     );
//   }
//
//   // @override
//   // Widget buildOK(BuildContext context){
//   //
//   //   // List<Users>? users=allUsers;
//   //   return  SafeArea(
//   //     child: SingleChildScrollView(
//   //       scrollDirection: Axis.horizontal,
//   //       ///  primary: false,
//   //       /// padding: const EdgeInsets.all(defaultPadding),
//   //
//   //       child: Container(
//   //         padding: const EdgeInsets.all(defaultPadding),
//   //         decoration: const BoxDecoration(
//   //           color: secondaryColor,
//   //           borderRadius: BorderRadius.all(Radius.circular(10)),
//   //         ),
//   //        /// height: 500,
//   //       /// child: users!.isNotEmpty?
//   //         child: usersDataFilter.isNotEmpty?
//   //
//   //         Column(
//   //           crossAxisAlignment: CrossAxisAlignment.start,
//   //           children: [
//   //             Text(
//   //               "All Users",
//   //               style: Theme.of(context).textTheme.titleMedium,
//   //             ),
//   //             //   SingleChildScrollView(
//   //             // physics: const BouncingScrollPhysics(),
//   //             // scrollDirection: Axis.horizontal,
//   //             //  SingleChildScrollView(
//   //             //   scrollDirection: Axis.horizontal,
//   //             // child: Expanded(
//   //
//   //             SingleChildScrollView(
//   //
//   //               scrollDirection: Axis.horizontal,
//   //               child: DataTable(
//   //                 showCheckboxColumn: true,
//   //                 sortAscending: true,
//   //                 // sortColumnIndex: 3,
//   //
//   //                 columnSpacing: defaultPadding,
//   //                 // minWidth: 600,
//   //                 columns: const <DataColumn>[
//   //                   DataColumn(
//   //                     label: Text("Name"),
//   //                   ),
//   //                   DataColumn(
//   //                     label: Text("Code"),
//   //                   ),
//   //                   DataColumn(
//   //                     label: Text("email"),
//   //                   ),
//   //                   DataColumn(
//   //                     label: Text("Phone"),
//   //                   ),
//   //                   DataColumn(
//   //                     label: Text("Code Client"),
//   //                   ),
//   //                   DataColumn(
//   //                     label: Text("Code Dealer"),
//   //                   ),
//   //                   DataColumn(
//   //                     label: Text("Market"),
//   //                   ),
//   //                   DataColumn(
//   //                     label: Text("dateCreation"),
//   //                   ),
//   //                   // DataColumn(
//   //                   //   label: Text("Email"),
//   //                   // ),
//   //                   // DataColumn(
//   //                   //   label: Text("Phone"),
//   //                   // ),
//   //                   // DataColumn(
//   //                   //   label: Text("Role"),
//   //                   // ),
//   //                   // DataColumn(
//   //                   //   label: Text("Enabled"),
//   //                   // ),
//   //                   // DataColumn(
//   //                   //   label: Text("Market"),
//   //                   // ),
//   //                 ],
//   //                 // rows: List.generate(
//   //                 //   demoRecentFilesUsers.length,
//   //                 //   (index) => recentFileDataRow(demoRecentFilesUsers[index]),
//   //                 // ),
//   //                 rows: List.generate(users!.length,(index) => usersDataRow(listFilesUsers[index]),
//   //               ///  rows: List.generate( listFilesUsers.length,(index) => usersDataRow(listFilesUsers[index]),
//   //                 ),
//   //               ),
//   //             ),
//   //             // width: double.infinity,
//   //             //width: double.maxFinite,
//   //             // child: DataTable(
//   //             //
//   //             //
//   //             //   columnSpacing: defaultPadding,
//   //             //   // minWidth: 600,
//   //             //   columns: const <DataColumn>[
//   //             //     DataColumn(
//   //             //       label: Text("Name"),
//   //             //     ),
//   //             //     DataColumn(
//   //             //       label: Text("Code"),
//   //             //     ),
//   //             //     DataColumn(
//   //             //       label: Text("email"),
//   //             //     ),
//   //             //     DataColumn(
//   //             //       label: Text("Phone"),
//   //             //     ),
//   //             //     DataColumn(
//   //             //       label: Text("Code Client"),
//   //             //     ),
//   //             //     DataColumn(
//   //             //       label: Text("Code Dealer"),
//   //             //     ),
//   //             //     DataColumn(
//   //             //       label: Text("Market"),
//   //             //     ),
//   //             //     DataColumn(
//   //             //       label: Text("dateCreation"),
//   //             //     ),
//   //             //     // DataColumn(
//   //             //     //   label: Text("Email"),
//   //             //     // ),
//   //             //     // DataColumn(
//   //             //     //   label: Text("Phone"),
//   //             //     // ),
//   //             //     // DataColumn(
//   //             //     //   label: Text("Role"),
//   //             //     // ),
//   //             //     // DataColumn(
//   //             //     //   label: Text("Enabled"),
//   //             //     // ),
//   //             //     // DataColumn(
//   //             //     //   label: Text("Market"),
//   //             //     // ),
//   //             //   ],
//   //             //   // rows: List.generate(
//   //             //   //   demoRecentFilesUsers.length,
//   //             //   //   (index) => recentFileDataRow(demoRecentFilesUsers[index]),
//   //             //   // ),
//   //             //   rows: List.generate(
//   //             //     listFilesUsers.length,
//   //             //         (index) => recentFileDataRow(listFilesUsers[index]),
//   //             //   ),
//   //             // ),
//   //             // ),
//   //             //),
//   //             // ),
//   //             //),
//   //             // SizedBox(
//   //             //   width: double.infinity,
//   //             //   child: DataTable(
//   //             //     columnSpacing: defaultPadding,
//   //             //     // minWidth: 600,
//   //             //     columns: const <DataColumn>[
//   //             //       DataColumn(
//   //             //         label: Text("Code"),
//   //             //       ),
//   //             //       DataColumn(
//   //             //         label: Text("Name "),
//   //             //       ),
//   //             //       DataColumn(
//   //             //         label: Text("Date"),
//   //             //       ),
//   //             //       // DataColumn(
//   //             //       //   label: Text("Email"),
//   //             //       // ),
//   //             //       // DataColumn(
//   //             //       //   label: Text("Phone"),
//   //             //       // ),
//   //             //       // DataColumn(
//   //             //       //   label: Text("Role"),
//   //             //       // ),
//   //             //       // DataColumn(
//   //             //       //   label: Text("Enabled"),
//   //             //       // ),
//   //             //       // DataColumn(
//   //             //       //   label: Text("Market"),
//   //             //       // ),
//   //             //     ],
//   //             //     rows: List.generate(
//   //             //       demoRecentFilesUsers.length,
//   //             //       (index) => recentFileDataRow(demoRecentFilesUsers[index]),
//   //             //     ),
//   //             //   ),
//   //             // ),
//   //           ],
//   //         ):Container()
//   //       ),
//   //     ),
//   //   );
//   //
//   // }
//
//
//   // Widget buildOK1(BuildContext context) {
//   //   return Container(
//   //     padding: const EdgeInsets.all(defaultPadding),
//   //     decoration: const BoxDecoration(
//   //       color: secondaryColor,
//   //       borderRadius: BorderRadius.all(Radius.circular(10)),
//   //     ),
//   //     child: Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         Text(
//   //           "All Users",
//   //           style: Theme.of(context).textTheme.titleMedium,
//   //         ),
//   //         SingleChildScrollView(
//   //
//   //           physics: const BouncingScrollPhysics(),
//   //           scrollDirection: Axis.horizontal,
//   //           child: SingleChildScrollView(
//   //             scrollDirection: Axis.horizontal,
//   //             child: Expanded(
//   //
//   //               child: SingleChildScrollView(
//   //
//   //                 scrollDirection: Axis.horizontal,
//   //                 child: DataTable(
//   //
//   //                   //     sortAscending: true,
//   //                   //     sortColumnIndex: 3,
//   //                   //
//   //                   columnSpacing: defaultPadding,
//   //                   // minWidth: 600,
//   //                   columns: const <DataColumn>[
//   //                     DataColumn(
//   //                       label: Text("Name"),
//   //                     ),
//   //                     DataColumn(
//   //                       label: Text("Code"),
//   //                     ),
//   //                     DataColumn(
//   //                       label: Text("email"),
//   //                     ),
//   //                     DataColumn(
//   //                       label: Text("Phone"),
//   //                     ),
//   //                     DataColumn(
//   //                       label: Text("Code Client"),
//   //                     ),
//   //                     DataColumn(
//   //                       label: Text("Code Dealer"),
//   //                     ),
//   //                     DataColumn(
//   //                       label: Text("Market"),
//   //                     ),
//   //                     DataColumn(
//   //                       label: Text("dateCreation"),
//   //                     ),
//   //
//   //                   ],
//   //
//   //                   rows: List.generate(
//   //                     listFilesUsers.length,  (index) => usersDataRow(listFilesUsers[index]),
//   //                   ),
//   //                 ),
//   //               ),
//   //
//   //
//   //               // width: double.infinity,
//   //               //width: double.maxFinite,
//   //               // child: DataTable(
//   //               //
//   //               //
//   //               //   columnSpacing: defaultPadding,
//   //               //   // minWidth: 600,
//   //               //   columns: const <DataColumn>[
//   //               //     DataColumn(
//   //               //       label: Text("Name"),
//   //               //     ),
//   //               //     DataColumn(
//   //               //       label: Text("Code"),
//   //               //     ),
//   //               //     DataColumn(
//   //               //       label: Text("email"),
//   //               //     ),
//   //               //     DataColumn(
//   //               //       label: Text("Phone"),
//   //               //     ),
//   //               //     DataColumn(
//   //               //       label: Text("Code Client"),
//   //               //     ),
//   //               //     DataColumn(
//   //               //       label: Text("Code Dealer"),
//   //               //     ),
//   //               //     DataColumn(
//   //               //       label: Text("Market"),
//   //               //     ),
//   //               //     DataColumn(
//   //               //       label: Text("dateCreation"),
//   //               //     ),
//   //               //     // DataColumn(
//   //               //     //   label: Text("Email"),
//   //               //     // ),
//   //               //     // DataColumn(
//   //               //     //   label: Text("Phone"),
//   //               //     // ),
//   //               //     // DataColumn(
//   //               //     //   label: Text("Role"),
//   //               //     // ),
//   //               //     // DataColumn(
//   //               //     //   label: Text("Enabled"),
//   //               //     // ),
//   //               //     // DataColumn(
//   //               //     //   label: Text("Market"),
//   //               //     // ),
//   //               //   ],
//   //               //   // rows: List.generate(
//   //               //   //   demoRecentFilesUsers.length,
//   //               //   //   (index) => recentFileDataRow(demoRecentFilesUsers[index]),
//   //               //   // ),
//   //               //   rows: List.generate(
//   //               //     listFilesUsers.length,
//   //               //         (index) => recentFileDataRow(listFilesUsers[index]),
//   //               //   ),
//   //               // ),
//   //             ),
//   //           ),
//   //         ),
//   //         //),
//   //         // SizedBox(
//   //         //   width: double.infinity,
//   //         //   child: DataTable(
//   //         //     columnSpacing: defaultPadding,
//   //         //     // minWidth: 600,
//   //         //     columns: const <DataColumn>[
//   //         //       DataColumn(
//   //         //         label: Text("Code"),
//   //         //       ),
//   //         //       DataColumn(
//   //         //         label: Text("Name "),
//   //         //       ),
//   //         //       DataColumn(
//   //         //         label: Text("Date"),
//   //         //       ),
//   //         //       // DataColumn(
//   //         //       //   label: Text("Email"),
//   //         //       // ),
//   //         //       // DataColumn(
//   //         //       //   label: Text("Phone"),
//   //         //       // ),
//   //         //       // DataColumn(
//   //         //       //   label: Text("Role"),
//   //         //       // ),
//   //         //       // DataColumn(
//   //         //       //   label: Text("Enabled"),
//   //         //       // ),
//   //         //       // DataColumn(
//   //         //       //   label: Text("Market"),
//   //         //       // ),
//   //         //     ],
//   //         //     rows: List.generate(
//   //         //       demoRecentFilesUsers.length,
//   //         //       (index) => recentFileDataRow(demoRecentFilesUsers[index]),
//   //         //     ),
//   //         //   ),
//   //         // ),
//   //       ],
//   //     ),
//   //   );
//   // }
// }
//
// // DataRow recentFileDataRow(RecentFile fileInfo) {
// DataRow usersDataRow(Users usersInfo) {
//   return DataRow(
//     cells: [
//       DataCell(
//         Row(
//           children: [
//             SvgPicture.asset(
//               usersInfo.image!,
//               height: 30,
//               width: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
//               child: Text(usersInfo.name!),
//             ),
//           ],
//         ),
//       ),
//       DataCell(Text(usersInfo.code!)),
//       DataCell(Text(usersInfo.email!)),
//       DataCell(Text(usersInfo.phone!)),
//       DataCell(Text(usersInfo.codeClient!)),
//       DataCell(Text(usersInfo.codeDealer!)),
//       DataCell(Text(usersInfo.market!.name)),
//       DataCell(Text(usersInfo.dateCreation!.toString())),
//     ],
//
//     onSelectChanged: (usersInfo){
//       if (kDebugMode) {
//         print('row 2 pressed$usersInfo');
//       }
//     }
//   );
// }
//
//
