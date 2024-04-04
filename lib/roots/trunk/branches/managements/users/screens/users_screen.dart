


import 'package:ecobioweb/roots/trunk/branches/managements/users/components/users.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../../../../../../market/components/market.dart';
import '../../../../../../market/providers/market_provider.dart';
import '../../../commun_data_utils/responsive/responsive.dart';
import '../../../commun_data_utils/utils/constants/constants.dart';
import '../../../localisation/translation/components/appLocalizations.dart';
import '../menu/side_menu_users.dart';
import '../provider/users_provider.dart';
import '../widgets/header.dart';
import '../widgets/my_fields.dart';
import '../widgets/search_field_users.dart';
import '../widgets/users_data_info.dart';
import '../widgets/storage_details.dart';


class UsersScreen extends StatefulWidget {

  const UsersScreen({super.key});


  @override
  _UsersScreenState createState()=>_UsersScreenState();

}

class _UsersScreenState extends State<UsersScreen>{
  List<Users> users=[];
  List<Users> usersDataFilter=[];
  List<Market> markets=[];

  Map<String, Users> usersItems= UsersProvider().usersItems;

  ScrollController? _controllerScroll;

  final _itemsizeheight = 50.0;

  var posSelected = 0;

   TextEditingController textInputSearch = TextEditingController();





  @override
  void initState(){

    _controllerScroll=ScrollController();
    _controllerScroll!.addListener(_scrollListener);
    usersDataFilter;
    users;
    super.initState();

  }
  // void initState(){
  //       fetchItems().whenComplete(() => print("UsersScreen"));
  // }
  //
  // Future<void>  fetchItems() async {
  //   final loadDataUsers=UsersProvider().getUsersList();
  // }


  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers:  [
      ChangeNotifierProvider<MarketProvider>(create: (_)=>MarketProvider()),
      ChangeNotifierProvider<UsersProvider>(create: (_) => UsersProvider()),

    ],
        child: Navigator(onGenerateRoute: (RouteSettings setting){

          return MaterialPageRoute(builder:(context){
            return const UsersScreen();
          });

        }, ),
        builder: (context,child){

      final usersProvider=Provider.of<UsersProvider>(context);

      if(context.read<UsersProvider>().getUsers.isEmpty) {
          final loadDataUsers = context.read<UsersProvider>().getUsersList();
      }
      ///LIST USER DB
      users=context.read<UsersProvider>().getUsers;

      ///LIST USER FILTER SEARCH
      usersDataFilter=context.read<UsersProvider>().getUserDataFilter;
      usersItems=context.read<UsersProvider>().usersItems;

          return //SafeArea(
           // child: SingleChildScrollView(
            //  primary: false,
            //  padding: const EdgeInsets.all(defaultPadding),
             // child: Column(
              //  children: [

                  CustomScrollView(
                    controller: _controllerScroll,
                   physics: const AlwaysScrollableScrollPhysics(),
                   slivers: [
                     SliverToBoxAdapter(
                       child: Column(
                         children:<Widget> [
                           /// HEADER
                           Header(users,textInputSearch),
                           const SizedBox(height: defaultPadding),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children:<Widget> [
                               Expanded(
                                 flex: 6,
                                 child: Column(
                                   children:<Widget>[
                                      MyFiles(),
                                      const SizedBox(height: defaultPadding),

                                     // const SingleChildScrollView(
                                     //  /// scrollDirection: Axis.horizontal,
                                     //   child:RecentFiles(),
                                     //
                                     // ),
                                     ///  Expanded(child: SearchFiedUsers()),
                                     //
                                     // const Column(
                                     //   children: [
                                     //     Row(
                                     //       children: [
                                     //         Text("UsersScren"),
                                     //
                                     //         ///Expanded(child:   SearchField(users)),
                                     //        /// Expanded(child: SearchFieldUsers()),
                                     //
                                     //       ],
                                     //     )
                                     //   ],
                                     // ),

                                    /// if (!Responsive.isMobile(context))
                                     /// Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
                                      ///  Expanded(child: SearchField(users)),
                                           ////  SearchFieldUsers(textInputSearch),
                                     /// SEARCH FROM TABLE USERS INFO
                                         SizedBox(
                                          /// color: Colors.white,
                                           child:  TextField(
                                             controller: textInputSearch,
                                             cursorColor: Colors.white,
                                             decoration: InputDecoration(
                                               ///  labelText: textInputSearch,
                                               hintText:AppLocalizations.translate("search_point"),
                                               fillColor: secondaryColor,
                                               filled: true,
                                               border: const OutlineInputBorder(
                                                 borderSide: BorderSide.none,
                                                 borderRadius: BorderRadius.all(Radius.circular(10)),
                                               ),
                                               suffixIcon: InkWell(
                                                 onTap: () {
                                                   // print('laat');
                                                   // print(textInputSearch.text);

                                                   setState(() {
                                                     usersDataFilter;

                                                     if ((textInputSearch.text.isEmpty) || (textInputSearch.text == "") || (textInputSearch.text == " ")) {
                                                       /// usersDataFilter.clear();
                                                        usersDataFilter =users;
                                                       UsersProvider().setUpdateUserDataFilter(usersDataFilter);

                                                     }
                                                   });

                                                 },

                                                 child: Container(
                                                   padding: const EdgeInsets.all(defaultPadding * 0.75),
                                                   margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                                                   decoration: const BoxDecoration(
                                                     color: primaryColor,
                                                     borderRadius: BorderRadius.all(Radius.circular(10)),
                                                   ),
                                                   child: SvgPicture.asset("assets/icons/Search.svg"),
                                                 ),
                                               ),
                                             ),

                                             /// filter users from search
                                             onChanged: _onSearchTextChanged,
                                             // onChanged: _filterElements,
                                           ),
                                         ),
                                     const SizedBox(height: defaultPadding),
                                     /// TABLE USERS DATA INFO
                                     UsersDataInfo(textInputSearch),
                                     if (Responsive.isMobile(context))
                                       const SizedBox(height: defaultPadding),
                                     if (Responsive.isMobile(context)) const StorageDetails(),
                                   ],
                                 ),
                               ),
                               if (!Responsive.isMobile(context))
                                 const SizedBox(width: defaultPadding),
                               // On Mobile means if the screen is less than 850 we don't want to show it
                               if (!Responsive.isMobile(context))
                                 const Expanded(
                                   flex: 2,
                                   child: StorageDetails(),
                                 ),
                             ],
                           )
                         ],
                       ),
                     )
                   ]
                  );

                  /// Header(users),

               //  ),
               // ],
              //),
           // ),
         // );
        }
    );
  }

  // @override
  // Widget buildOK(BuildContext context) {
  //   return SafeArea(
  //     child: SingleChildScrollView(
  //       primary: false,
  //       padding: const EdgeInsets.all(defaultPadding),
  //       child: Column(
  //         children: [
  //            Header(users),
  //           const SizedBox(height: defaultPadding),
  //           Row(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Expanded(
  //                 flex: 6,
  //                 child: Column(
  //                   children: [
  //                     const MyFiles(),
  //                     const SizedBox(height: defaultPadding),
  //
  //                     // const SingleChildScrollView(
  //                     //  /// scrollDirection: Axis.horizontal,
  //                     //   child:RecentFiles(),
  //                     //
  //                     // ),
  //                      UsersDataInfo(users),
  //                     if (Responsive.isMobile(context))
  //                       const SizedBox(height: defaultPadding),
  //                     if (Responsive.isMobile(context)) const StorageDetails(),
  //                   ],
  //                 ),
  //               ),
  //               if (!Responsive.isMobile(context))
  //                 const SizedBox(width: defaultPadding),
  //               // On Mobile means if the screen is less than 850 we don't want to show it
  //               if (!Responsive.isMobile(context))
  //                 const Expanded(
  //                   flex: 2,
  //                   child: StorageDetails(),
  //                 ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }



  _scrollListener() {
    int scrollPosition =
    (_controllerScroll!.position.pixels / _itemsizeheight).round();
    if (scrollPosition < usersDataFilter.length) {
      String? userName = usersDataFilter.elementAt(scrollPosition).name;
      setState(() {
        posSelected =
            userName![0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
      });
    }

    if ((_controllerScroll!.offset) >=
        (_controllerScroll!.position.maxScrollExtent)) {}
    if (_controllerScroll!.offset <=
        _controllerScroll!.position.minScrollExtent &&
        !_controllerScroll!.position.outOfRange) {}
  }

  void _onSearchTextChanged(String textSearch) {

    // usersDataFilter.clear();

    // Search empty get all list enabled
    if ((textSearch.isEmpty) || (textSearch == "") || (textSearch == " ")) {

      setState(() {
           usersDataFilter.clear();
        usersDataFilter = users;
        UsersProvider().setUpdateUserDataFilter(usersDataFilter);
      });
    }else {

      usersDataFilter;
      users;


      setState(() {
        usersDataFilter = users.where((e) =>
        e.name.toString().toLowerCase().contains(textSearch.toLowerCase())
            || e.code!.contains(textSearch.toLowerCase())
            || e.email!.contains(textSearch.toLowerCase())
            || e.phone!.contains(textSearch.toLowerCase())
            || e.codeClient!.contains(textSearch.toLowerCase())
            ||e.codeDealer!.contains(textSearch.toLowerCase())
            ||e.codeTeamWorkers!.contains(textSearch.toLowerCase())
            ||e.codeSuppliers!.contains(textSearch.toLowerCase())
        ).toList();

        if (usersDataFilter.isNotEmpty) {
          UsersProvider().setUpdateUserDataFilter(usersDataFilter);
        }

        ///   UsersScreen();
        // filteredData = text.isEmpty
        //     ? users
        //     : users
        //     .where((item) =>
        // item['name'].toLowerCase().contains(text.toLowerCase()) ||
        //     item['code'].toLowerCase().contains(text.toLowerCase()))
        //     .toList();
      });
    }
  }
}
