// import 'dart:js_interop';

import 'package:ecobioweb/roots/trunk/branches/managements/users/provider/users_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/managements/users/screens/users_screen.dart';
import 'package:ecobioweb/roots/trunk/branches/managements/users/widgets/search_field_users.dart';
import 'package:ecobioweb/roots/trunk/branches/managements/users/widgets/users_data_info.dart';
import 'package:ffi/ffi.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../commun_data_utils/responsive/responsive.dart';
import '../../../commun_data_utils/utils/constants/constants.dart';
import '../../../localisation/translation/components/appLocalizations.dart';
import '../../../menu/menu_home/controllers/MenuAppController.dart';
import '../components/users.dart';
import '../provider/users_provider.dart';



 class Header extends StatelessWidget {


  TextEditingController? textInputSearch;

   // Header(this.users, this.usersDataFilter, {
   Header(this.users, this.textInputSearch, {
    Key? key,
  }) : super(key: key);

  final List<Users>? users;
  late final List<Users>? usersDataFilter;


   ////final TextEditingController? searchController  = textInputSearch!;

   // void initState() {
   //   this.usersDataFilter = data;
   //   super.initState();
   // }
   //
   // @override
   // void dispose() {
   //   searchController.dispose();
   //   super.dispose();
   // }


   @override
  Widget build(BuildContext context) {
    return Row(

      children: [
        if (!Responsive.isDesktop(context))
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuAppController>().controlMenu,
          ),
        if (!Responsive.isMobile(context))
          Text(
            "Users Data",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        if (!Responsive.isMobile(context))
          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1),
           ///Expanded(child:   SearchField(users)),
          Expanded(child: SearchFieldUsers(textInputSearch!)),
        const ProfileCard()
      ],
    );
  }
}

/// PROFIL USER
class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: defaultPadding),
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/dashboard/profile_pic.png",
            height: 38,
          ),
          if (!Responsive.isMobile(context))
            const Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: defaultPadding / 2),
              child: Text("Angelina Jolie"),
            ),
          const Icon(Icons.keyboard_arrow_down),
        ],
      ),
    );
  }
}

/// https://codingwithrashid.com/how-to-create-datatable-with-search-in-flutter/
/// SEARCH USER OK
class SearchField extends StatelessWidget {
  // final TextEditingController _controller = TextEditingController();
  final TextEditingController searchController  = TextEditingController();

  final List _alphabet =
  List.generate(26, (i) => String.fromCharCode('A'.codeUnitAt(0) + i));

   Users? userSelected;

  late var _sizeheightcontainer;
  late var _heightscroller;

   SearchField(this.users, {
    Key? key,
  }) : super(key: key);

  List<Users>? users;
  List<Users> usersDataFilter=[];
  List<Users> usersDataFilteFinal=[];
  Map<String, Users> usersItems= {};


  void initState() {
   // this.usersDataFilter=users!;
    ///super.initState();
  }

  @override
  void dispose() {
   /// searchController.dispose();
    ///super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    ScrollController? _controllerScroll;
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
            return UsersScreen();
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
            controller: searchController,
            decoration: InputDecoration(
              hintText: "Search header.dart",
              fillColor: secondaryColor,
              filled: true,
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              suffixIcon: InkWell(
                onTap: () {},
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

  @override
  Widget buildFist(BuildContext context) {

    /// sort users list
    users!.sort((a,b){
      return a.name!.compareTo(b.name.toString());
    });

    usersDataFilter.sort((a,b){
      return a.name!.compareTo(b.name.toString());
    });

    // if(usersDataFilter.isNotEmpty){
    //   users=usersDataFilter;
    // }

    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: "Search header.dart",
        fillColor: secondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
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
        onChanged: _filterElements,
    );
  }


  // void _onSearchTextChangeds(String text) {
  //   setState(() {
  //     filteredData = text.isEmpty
  //         ? users
  //         : users
  //         .where((item) =>
  //     item['name'].toLowerCase().contains(text.toLowerCase()) ||
  //         item['code'].toLowerCase().contains(text.toLowerCase()))
  //         .toList();
  //   });
  // }
  void _onSearchTextChanged(String textSearch) {

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




  void _filterElements(String s) {
  s = s.toLowerCase();

  // Search empty get all list enabled
  if((s.isEmpty) || (s=="") || (s== " ")){
    usersDataFilter.clear();

    usersDataFilter=users!;
    //   setState(() {
    //     userSelected=userSelected;
    //
    // }
    //
    // );

  }else{

    // Search filter from code, dialCode,name to all list users enabled
  //  setState(() {

    usersDataFilter;
    users;
    usersDataFilter= users!.where((e) =>
              e.name.toString().toLowerCase().contains(s) ||
              e.code!.contains(s) ||
              e.codeClient!.contains(s)

             ).toList();
   /// UPDATE





     // listFilesUsers.where((element) {
     //   return (element['name'] as String).contains(_controller.text);
     // }).toList();

    users;

      // if(usersDataFilter.isNotEmpty){
      //   usersDataFilter=users!;
      // }
      // else{
      //   users=usersEnabledList;
      // }
   // });

  }

  //
  //    users;
  //    usersFilter;
  //    usersEnabledList;
  // ///   users=usersFilter;
}



}
