
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../../../../products/screen/products_screen.dart';
import '../../../commun_data_utils/utils/constants/constants.dart';
import '../../../localisation/translation/components/appLocalizations.dart';
import '../components/users.dart';
import '../provider/users_provider.dart';
import '../screens/users_screen.dart';

class SearchFieldUsers extends StatefulWidget  {


   SearchFieldUsers(this.textInputSearch, {super.key});

   TextEditingController? textInputSearch = TextEditingController();


  _SearchFieldUsers createState()=>_SearchFieldUsers();

}

class _SearchFieldUsers extends State<SearchFieldUsers> {

  List<Users>? users;
  List<Users> usersDataFilter=[];
  List<Users> usersDataFilteFinal=[];
  Map<String, Users> usersItems= {};

  ScrollController? _controllerScroll;

  // TextEditingController textInputSearch=this.textInputSearch!;

  final elementKey = GlobalKey<FormState>();

  String slug="test";

  var posSelected = 0;
  final _itemsizeheight = 50.0;

  TextEditingController? textInputSearch;






  ///_SearchFieldUsers(TextEditingController textInputSearch);



  @override
  void initState(){

    _controllerScroll=ScrollController();
    _controllerScroll!.addListener(_scrollListener);

    super.initState();

  }


   @override
  Widget build(BuildContext context) {

    var diff = 0.0;

    var posSelected = 0;
    var height = 0.0;
    final bool useUiOverlay;
    final bool useSafeArea;

    bool isShow = true;

    String search = "";
    String search_point = "";
    String last_pick = "";
    return MultiProvider(providers:  [
      ChangeNotifierProvider<UsersProvider>(create: (_)=>UsersProvider()),
    ],
        child: Navigator(onGenerateRoute: (RouteSettings settings){

          return MaterialPageRoute(builder: (context){
            return SearchFieldUsers(textInputSearch!);
          });
        },
        ),

        builder: (context,child){


          height = MediaQuery.of(context).size.height;
          search = AppLocalizations.translate('search');
          search_point =
          // AppLocalizations.of(context)!.translate('search_point');
          AppLocalizations.translate('search_point');
          last_pick = AppLocalizations.translate('last_picks');
          //search_point = Translation.search(context)!;

          final usersProvider=Provider.of<UsersProvider>(context);

          if(context.read<UsersProvider>().getUsers.isEmpty) {
            final loadDataUsers = context.read<UsersProvider>().getUsersList();
          }
          ///LIST USER DB
          users=context.read<UsersProvider>().getUsers;

          ///LIST USER FILTER SEARCH
          usersDataFilter=context.read<UsersProvider>().getUserDataFilter;
          usersItems=context.read<UsersProvider>().usersItems;

          // var up=context.read<UsersProvider>().usersDataFilter
          /// var up=  Provider<List<UsersProvider>>.value(value: usersDataFilter);
          ///
          return TextField(
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
                  print('laat');
                  print(textInputSearch!.text);

                  setState(() {
                    usersDataFilter;

                    if ((textInputSearch!.text.isEmpty) || (textInputSearch!.text == "") || (textInputSearch!.text == " ")) {
                      usersDataFilter.clear();
                      // usersDataFilter =users;
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
          );

        }
    );
  }

  void _onSearchTextChanged(String textSearch) {

    usersDataFilter.clear();

    // Search empty get all list enabled
    if ((textSearch.isEmpty) || (textSearch == "") || (textSearch == " ")) {

      setState(() {
        /// usersDataFilter.clear();
        /// usersDataFilter = users;
        UsersProvider().setUpdateUserDataFilter(usersDataFilter);
      });
    }else {

      usersDataFilter;
      users;


      setState(() {
        usersDataFilter = users!.where((e) =>
               e.name.toString().toLowerCase().contains(textSearch.toLowerCase())
            || e.code!.contains(textSearch.toLowerCase())
            || e.email!.contains(textSearch.toLowerCase())
            || e.phone!.contains(textSearch.toLowerCase())
            || e.codeClient!.contains(textSearch.toLowerCase())
            ||e.codeDealer!.contains(textSearch.toLowerCase())
            ||e.codeTeamWorkers!.contains(textSearch.toLowerCase())
            ||e.codeSuppliers!.contains(textSearch.toLowerCase())
        ).toList();

        usersDataFilter;

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
  void _onSearchTextChanged2222(String textSearch) {

    usersDataFilter;
    users;

    usersDataFilter= users!.where((e) =>
    e.name.toString().toLowerCase().contains(textSearch.toLowerCase()) ||
        e.code!.contains(textSearch.toLowerCase()) ||
        e.codeClient!.contains(textSearch.toLowerCase())

    ).toList();

    usersDataFilter;

    if(usersDataFilter.isNotEmpty){
      UsersProvider().setUpdateUserDataFilter(usersDataFilter);
    }

  }

  _scrollListener() {
    int scrollPosition =
    (_controllerScroll!.position.pixels / _itemsizeheight).round();
    if (scrollPosition < usersDataFilter.length) {
      String? marketName = usersDataFilter.elementAt(scrollPosition).name;
      setState(() {
        posSelected =
            marketName![0].toUpperCase().codeUnitAt(0) - 'A'.codeUnitAt(0);
      });
    }

    if ((_controllerScroll!.offset) >=
        (_controllerScroll!.position.maxScrollExtent)) {}
    if (_controllerScroll!.offset <=
        _controllerScroll!.position.minScrollExtent &&
        !_controllerScroll!.position.outOfRange) {}
  }



// Widget build(BuildContext context) {
//   final TextEditingController textInputSearch = TextEditingController();
//
//   var diff = 0.0;
//
//   var posSelected = 0;
//   var height = 0.0;
//   final bool useUiOverlay;
//   final bool useSafeArea;
//
//   bool isShow = true;
//
//   String search = "";
//   String search_point = "";
//   String last_pick = "";
//   return MultiProvider(providers:  [
//     ChangeNotifierProvider<UsersProvider>(create: (_)=>UsersProvider()),
//   ],
//       child: Navigator(onGenerateRoute: (RouteSettings settings){
//
//         return MaterialPageRoute(builder: (context){
//           return SearchFieldUsers();
//         });
//       },
//       ),
//
//       builder: (context,child){
//
//
//         height = MediaQuery.of(context).size.height;
//         search = AppLocalizations.translate('search');
//         search_point =
//         // AppLocalizations.of(context)!.translate('search_point');
//         AppLocalizations.translate('search_point');
//         last_pick = AppLocalizations.translate('last_picks');
//         //search_point = Translation.search(context)!;
//
//         final usersProvider=Provider.of<UsersProvider>(context);
//
//         if(context.read<UsersProvider>().getUsers.isEmpty) {
//           final loadDataUsers = context.read<UsersProvider>().getUsersList();
//         }
//         ///LIST USER DB
//         users=context.read<UsersProvider>().getUsers;
//
//         ///LIST USER FILTER SEARCH
//         usersDataFilter=context.read<UsersProvider>().getUserDataFilter;
//         usersItems=context.read<UsersProvider>().usersItems;
//
//         // var up=context.read<UsersProvider>().usersDataFilter
//         /// var up=  Provider<List<UsersProvider>>.value(value: usersDataFilter);
//         ///
//         return Container(
//
//           child: CustomScrollView(
//             controller: _controllerScroll,
//             physics: const AlwaysScrollableScrollPhysics(),
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Column(
//                   children: [
//                        Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Expanded(
//                           flex: 6,
//                           child: Column(
//                             children: [
//
//                               const SizedBox(height: defaultPadding),
//
//                                 /// SEARCH FROM TABLE USERS INFO
//                               Container(
//                                 color: Colors.white,
//                                 child:  TextField(
//                                   controller: textInputSearch,
//                                   cursorColor: Colors.white,
//                                   decoration: InputDecoration(
//                                     ///  labelText: textInputSearch,
//                                     hintText:AppLocalizations.translate("search_point"),
//                                     fillColor: secondaryColor,
//                                     filled: true,
//                                     border: const OutlineInputBorder(
//                                       borderSide: BorderSide.none,
//                                       borderRadius: BorderRadius.all(Radius.circular(10)),
//                                     ),
//                                     suffixIcon: InkWell(
//                                       onTap: () {
//                                         // print('laat');
//                                         // print(textInputSearch.text);
//
//                                         setState(() {
//                                           usersDataFilter;
//
//                                           if ((textInputSearch.text.isEmpty) || (textInputSearch.text == "") || (textInputSearch.text == " ")) {
//                                             usersDataFilter.clear();
//                                             // usersDataFilter =users;
//                                             UsersProvider().setUpdateUserDataFilter(usersDataFilter);
//
//                                           }
//                                         });
//
//                                       },
//
//                                       child: Container(
//                                         padding: const EdgeInsets.all(defaultPadding * 0.75),
//                                         margin: const EdgeInsets.symmetric(horizontal: defaultPadding / 2),
//                                         decoration: const BoxDecoration(
//                                           color: primaryColor,
//                                           borderRadius: BorderRadius.all(Radius.circular(10)),
//                                         ),
//                                         child: SvgPicture.asset("assets/icons/Search.svg"),
//                                       ),
//                                     ),
//                                   ),
//
//                                   /// filter users from search
//                                   onChanged: _onSearchTextChanged,
//                                   // onChanged: _filterElements,
//                                 ),
//                               ),
//
//                               const SizedBox(height: defaultPadding),
//                             ],
//                           ),
//                         ),
//
//                       ],
//                     )
//                   ],
//                 ),
//               )
//             ]
//         ),
//         );
//       }
//   );
// }

}