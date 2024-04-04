import 'dart:convert';
import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:ecobioweb/market/components/market.dart';
import 'package:ecobioweb/roots/trunk/branches/localisation/country/components/code_country.dart';
import 'package:ecobioweb/roots/trunk/branches/localisation/country/widget/countries.dart';
import 'package:ecobioweb/roots/trunk/branches/localisation/translation/components/appLocalizations.dart';
import 'package:ecobioweb/roots/trunk/branches/managements/roles/provider/roles_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/menu/menu_settings/settings/admin/screens/setting_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ffi/ffi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../../../market/providers/market_provider.dart';
import '../../../commun_data_utils/utils/rolinh_switch/rolling_switch.dart';
import '../../../languages/components/language.dart';
import '../../../languages/provider/language_provider.dart';
import '../../Roles/models/role.dart';
import '../../Roles/widgets/flutter_multi_select.dart';
import '../../Roles/widgets/flutter_single_select.dart';
import '../Enum/formtype.dart';
import '../components/users.dart';
import '../models/dynamic_form_validator.dart';
import '../models/dynamic_model.dart';
import '../Enum/validator_type.dart';
import '../provider/users_provider.dart';


class UsersAdd extends StatefulWidget {
   UsersAdd({Key? key,  this.user}) : super(key: key);

  final Users? user;

  @override
  _UsersAddState createState() => _UsersAddState();
}

class _UsersAddState extends State<UsersAdd> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  late List<DynamicModel> dynamicFormsList = [];
  ///Markets
  late List<Market> marketsList;
   List<String> markets=[];

  ///countries
    late List<CountryCode> countries;
   //  late List<ItemModel> countries = [];

  late List<CountryCode> countriesEnabled = [];
  late List countryEnabled = [];

  late List<Role> roles=[];

  // late List<ItemModel> states = [];
  late List<CountryCode> states = [];
  //final HtmlEditorController controller = HtmlEditorController();
  final DateRangePickerController dateRangePickerController =
      DateRangePickerController();
  final TextEditingController textEditingController = TextEditingController();
  late int selectedIndex = 0;
  late bool isSubmitClicked=false;

  String errorMessageCode="Name should not be Empty";
  String errorMessageCodeClient="Name should not be Empty";

  Users? user=  UsersAdd().user;

  List<Users> users=[];
  List<Users> usersDataFilter=[];

  ///  LIST ALL LANGUAGES
  late List<Language> languages;
  Map<String, Language> languageEnabled= {};


  ///
  ///
  ///

  Map<String, Users> usersItems= UsersProvider().usersItems;

  ///
  RolesProvider rolesProvider =RolesProvider();

 List<String> rolesItems=RolesProvider.rolesListItems;
  // List<String> dataString = [
  //   "Admin",
  //   "root",
  //   "UAE",
  //   "USA",
  //   "Turkey",
  //   "Brazil",
  //   "Tunisia",
  //   'Canada'
  // ];
List<String> marketItems=MarketProvider.marketListItems;

  String? selectedString;
  List<dynamic> selectedDataString=[];

  //List roles select
   List<dynamic>? selectedItemsRole;

  List<dynamic>? selectedItemsMarkets;

   List<dynamic>? marketsEnabled;

   List<dynamic> switchRollingList=[];

  int indexDyn=0;

  ///MAP MARKET ENABLED
  Map<String, Market> marketsEnabledMap = {};

  ///MAP MARKET ENABLED
  List<Market> marketsEnabledList =[];

  ///  LIST ALL MARKET
  List<Market> marketsAll=[];

  /// MAP ALL MARKET
  Map<String, Market> marketAll = {};

  /// MARKET SELECTED
  Market?  marketSelected;

  late Future<String?> codeLang;
  String currentCodeLang="";

  @override
  void initState() {
    super.initState();
    textEditingController.text = 'dd/MM/yyyy';

    // DBHelper dbHelper=DBHelper();
    // var db = dbHelper.db;

    // UsersProvider up=UsersProvider() ;
    // up.initializeDb();

    /// Load list Countries
    initializeCountries();

    /// LOAD MARKET LIST
    initializeMarket();
     ///initializedLoadMarkets(); NO PK load init app

    ///LOAD ROLES
 ////   initilizeLoadListRoles();

  /// LOAD LIST ROlling SWITCH
    initializeListSwitchRolling();



    ///INITIALIZED FORM
    initializeForms();
  }

  void initializedLoadMarkets(){



    // List<String> markets=[];

    if(marketsEnabled!.isEmpty){

      /// Code Lang
      SettingScreen settingScreen = SettingScreen();

      codeLang=  settingScreen.createState().fetchCurrentCodeLang();
      // currentCodeLang=settingScreen.createState().currentCodeLang;
      currentCodeLang="it";

      ///Initialize Markets
      MarketProvider marketProvider =MarketProvider();

       var ddd=marketProvider.getDataMarket(context, currentCodeLang);

       ///List
       List<Market> marketsEnabledGet= marketProvider.markets;

      for(var market in marketsEnabledGet){
        markets.add(market.name);
      }
      ///Map
      marketsEnabledMap =marketProvider.marketsEnabled;

     }


  }


  void initializeMarket(){
    MarketProvider marketProvider= MarketProvider();
    Map<String, Market> marketEnabled = marketProvider.marketsEnabled;

    marketsEnabled=marketEnabled.entries.toList();


  }
  void initializeListSwitchRolling(){

    Users user = Users();
    Map<String, bool> rollingSwitchMap=user.rollingSwitch;

    switchRollingList=rollingSwitchMap.entries.toList();

   }
//   void initilizeLoadListRoles() {
//
//    roles=[
//    Role(id: "1", name: "admin", description: "admin", isVisible: true, notes: " administration", image: "imagePath1"),
//      Role(id: "2", name: "market", description: "market", isVisible: true, notes: "Market", image: "imagePath2"),
//      Role(id: "3", name: "client", description: "client", isVisible: true, notes: "client", image: "imagePath3"),
//      Role(id: "4", name: "dealer", description: "dealer", isVisible: true, notes: "dealer", image: "imagePath4"),
//      Role(id: "5", name: "supplier", description: "supplier", isVisible: true, notes: "supplier", image: "imagePath5"),
//      Role(id: "6", name: "marketGestion", description: "marketGestion", isVisible: true, notes: "marketGestion", image: "imagePath6"),
//      Role(id: "7", name: "printExcel", description: "printExcel", isVisible: true, notes: "printExcel", image: "imagePath7"),
//    ];
//
// /// ROLES
//    for(var role in roles){
//        rolesItems.add(role.name!);
//    }
//     rolesItems;
//   }

  
  
  void initializeCountries() {
    Countries countriesData = Countries();

    if (countriesEnabled.isEmpty || countries.isEmpty) {
      countriesData.loaderData();
      /// Enabled COUNTRIES
      countriesEnabled = countriesData.countriesEnabled;
      ///  ALL countries;
      countries = countriesData.countries;
    }

  }

  @override
  Widget build(BuildContext context) {


    return MultiProvider(providers:  [
      ChangeNotifierProvider<MarketProvider>(create: (_)=>MarketProvider()),
      ChangeNotifierProvider<UsersProvider>(create: (_) => UsersProvider()),
      ChangeNotifierProvider<LanguageProvider>(create:(_) => LanguageProvider()),

    ],
        child: Navigator(onGenerateRoute: (RouteSettings setting){

          return MaterialPageRoute(builder:(context){
            return  UsersAdd();
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


        final marketProvider=Provider.of<MarketProvider>(context);

         if(markets.isNotEmpty) {
           final loadDataMarket = context.read<MarketProvider>().getDataMarket(context, currentCodeLang);
         }

        ///Map LANGUAGE
          languageEnabled=context.read<LanguageProvider>().languageEnabled;
         ///List LANGUAGES
          languages=context.read<LanguageProvider>().languages;

          marketSelected=context.read<MarketProvider>().marketSelected;

          /// LIST ALL MARKET
          marketsAll= context.read<MarketProvider>().marketsList;

          ///MAP MARKET ENABLED
          marketsEnabledMap=context.read<MarketProvider>().marketsEnabled;

          /// MAP ALL MARKET
          marketAll =context.read<MarketProvider>().marketsAll;

        //}

          ///LIst Button Enabled

          return Scaffold(
             backgroundColor: Colors.white70,
            appBar: AppBar(
              title: const Text("Back Form"),
              // backgroundColor: const Color.fromARGB(255, 84, 60, 206),
               backgroundColor:  Colors.green,
            ),
            body: _dynamicWidget(),
          );
        }
    );
  }
 // @override
  // Widget buildOK(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Dynamic Form"),
  //       // backgroundColor: const Color.fromARGB(255, 84, 60, 206),
  //       backgroundColor:  Colors.green,
  //     ),
  //     body: _dynamicWidget(),
  //   );
  // }
  /// FORM LIST ADD USERS
  Widget _dynamicWidget() {
    return Form(
      key: globalFormKey,

      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  dynamicLists(),  /// FORM LIST

                       Align(
                    alignment: Alignment.bottomRight,
                    child: FormHelper.submitButton("Save User", () async {
                      isSubmitClicked = true;
                      if (validateAndSave(dynamicFormsList)) {


                      }
                    },
                        btnColor: const Color.fromARGB(255, 84, 60, 206),
                        borderColor: Colors.transparent),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// FORM USER LIST
  Widget dynamicLists() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      itemCount: dynamicFormsList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: Column(
            children: <Widget>[
              Row(
                  children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Flexible(
                                //flex: 1,
                                child: getWidgetBasedFormType(index),
                              ),
                              // getDropDownRoles(index, rolesItems),
                            ],
                          ),
                        ),
                      ),

                    /// Roles
                    //    Flexible(
                    //        child: Padding(
                    //        padding: const EdgeInsets.all(10),
                    //       child: Row(
                    //            children: [
                    //               Flexible(
                    //                   flex: 1,
                    //                   child:  getDropDownRoles(index, rolesItems),)
                    //            ],
                    //       ),
                    //      )
                    //     )

              ]),
            ],
          ),
          onTap: () async {
            selectedIndex = index;
            var selectedform = dynamicFormsList[index].formType;
            if (selectedform == FormType.HTMLReader) {
              // final result = await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //         HTMLEditorPage(htmlText: dynamicFormsList[index].value),
              //   ),
              // );
              // setState(() {
              //   dynamicFormsList[index].value =
              //       result ?? dynamicFormsList[index].value;
              // });
            }
          },
        );
      },
    );
  }

  Widget getWidgetBasedFormType(index) {
    var form = dynamicFormsList[index];
    FormType type = form.formType;
    switch (type) {
      case FormType.Text:
        return getTextWidget(index);
      case FormType.Multiline:
        return getMultilineTextWidget(index);
      case FormType.Dropdown:
        return getDropDown(index, form.itemsCountries);
      case FormType.DropdownRole:
        return getDropDownRoles(index,form.rolesItems!, selectedItemsRole);         ///Selected Roles List of user
      case FormType.DropdownMarketsEnabled:
        return getDropDownMarketsEnabled(index,form.marketsEnabled, selectedItemsMarkets);   /// Select Markets list Associated of users
      case FormType.DropdownMarket:
        return getDropDownMarket(index,form.marketsEnabled, marketSelected); /// Select single market
      case FormType.AutoComplete:
        return getAutoComplete(index);
      case FormType.HTMLReader:
        return getHtmlReadOnly(index);
      case FormType.DatePicker:
        return getDatePicker(index);
       case FormType.RollingSwitch:
       return getFlagRollingSwitch(index);
      case FormType.RollingSwitchList:
        return getFlagRollingSwitchList(index,form.switchRollingEnabledList, switchRollingList );
      // case FormType.CheckBox:
      //   return getFlagChecked(index);



    }
  }

  getDropDownMarketsEnabled(index,List<String> marketsListEnabled, List<dynamic>? selectedMarkets){
    //
    // List<String> marketsListEnabled=[];
    //  if( markets.isEmpty || markets.length > marketsEnabledNew.length){
    //            markets.clear();
    //
    //            for(var market in marketsEnabled!){
    //              marketsListEnabled.add(market.value.name.toString());
    //
    //            }
    //  }else{
    //    marketsListEnabled=markets;
    //  }
    //
    // marketsEnabled!.addAll(marketsListEnabled);
    //  markets;

    return Container(
      decoration:  BoxDecoration(
         // color:  Colors.white70,
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          border: Border.all(color: Colors.black38)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomMultiSelectField<String>(
            title: AppLocalizations.translate("marketsEnabled"),
            items: marketsListEnabled,
            selectedMarketsEnabled:selectedMarkets, ///List MARKET selected
            //itemsRole: roles,
            enableAllOptionSelect: true,
            onSelectionDone: _marketsSelectedAssociateComplete,
            itemAsString: (item) => item.toString(),

          ),
          const SizedBox(
            height: 10,
          ),

        ],
      ),

    );

  }


  Widget getFlagRollingSwitchList(index, List<String>? switchRollingEnabledList, List<dynamic> switchRollingList){
     index;
    dynamicFormsList;
   //  String nameFlag =AppLocalizations.translate(dynamicFormsList[index].controlName.toString());
        return GestureDetector(

          child: Container(
            ///  padding: const EdgeInsets.symmetric(horizontal: 20),
            /// height: MediaQuery.of(context).size.height * 0.50,
            decoration: const BoxDecoration(
              //  color: Color(0xFF273A48),
              // ignore: unnecessary_const
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0))),
            // mainAxisAlignment: MainAxisAlignment.center,
            /// list Enabled
            child: Row(
              /// mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[
                ///Customized
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10, right: 15),
                  child: RollingSwitch(
                    value: false,
                    width: 160,
                    textOn: 'active',
                    textOff: 'inactive',
                    colorOn: Colors.green.shade700,
                    colorOff: Colors.blueGrey,
                    iconOn: Icons.lightbulb_outline,
                    iconOff: Icons.power_settings_new,
                    animationDuration: const Duration(milliseconds: 300),
                    /// Update flag form
                    onChanged: (bool state) {
                      _onSelectionFlagStollingSwitchDone(state, index, dynamicFormsList[index].controlName);
                      print('turned ${(state) ? 'on' : 'off'}');
                      // print('index=  $ind');
                      // print('flag=  $flagName');
                    },
                    onDoubleTap: () {},
                    onSwipe: () {},
                    onTap: () {

                    },
                  ),
                ),
                /// Title
                 Flexible(child:Text(AppLocalizations.translate(dynamicFormsList[index].controlName.toString()))),
               // Flexible(child:Text(dynamicFormsList[index].controlName.toString())),

              ],


              // RollingSwitch(
              //   value: false,
              //   onChanged: (bool state) {
              //     print('turned ${(state) ? 'on' : 'off'}');
              //   },
              //   onDoubleTap: () {},
              //   onSwipe: () {},
              //   onTap: () {
              //
              //   },
              // ),

            ),
          ),
        );

  }

  /// FLAG ON OFF ENABLED MARKET, NOTIFICA ......
  void _onSelectionFlagStollingSwitchDone(state, int indexListRolling, String flagName) {

    ///  dynamicFormsList;

    setState(() {
      if(state){
        for(var flagSelected in dynamicFormsList){
          if(flagSelected.controlName== flagName){

            indexDyn= dynamicFormsList.indexWhere((element) =>element.controlName ==flagSelected.controlName);

            dynamicFormsList[indexDyn].value="true";
            dynamicFormsList[indexDyn].switchRollingEnabledList.add(dynamicFormsList[indexDyn].controlName);

            // dynamicFormsList;
          }
        }
      }else{
        dynamicFormsList[indexDyn].switchRollingEnabledList.clear();
        dynamicFormsList[indexDyn].value="false";
        dynamicFormsList;
      }

    });
  }

  Widget getFlagRollingSwitchList1(index, List<String>? switchRollingEnabledList, List<dynamic> switchRollingList){

    dynamicFormsList;

    return ListView.builder(
      shrinkWrap: false,
        physics:const ScrollPhysics(),
        itemCount: switchRollingList.length,
        itemBuilder: (context, index) {

         return GestureDetector(

             child: Container(
               decoration: const BoxDecoration(
                 //  color: Color(0xFF273A48),
                   // ignore: unnecessary_const
                   borderRadius: const BorderRadius.only(
                       bottomLeft: Radius.circular(10.0),
                       bottomRight: Radius.circular(10.0))),
               // mainAxisAlignment: MainAxisAlignment.center,
               /// list Enabled
                 child: Row(
                  /// mainAxisAlignment: MainAxisAlignment.start,
                        children:<Widget>[
                                 ///Customized
                          Padding(
                            padding: const EdgeInsets.only(top: 10, left: 10, right: 15),
                            child: RollingSwitch(
                              value: false,
                              width: 160,
                              textOn: 'active',
                              textOff: 'inactive',
                              colorOn: Colors.green.shade700,
                              colorOff: Colors.blueGrey,
                              iconOn: Icons.lightbulb_outline,
                              iconOff: Icons.power_settings_new,
                              animationDuration: const Duration(milliseconds: 300),
                              /// Update flag form
                              onChanged: (bool state) {

                                _onSelectionFlagStollingSwitchDone(state, index, "flagName");

                                print('turned ${(state) ? 'on' : 'off'}');
                                // print('index=  $ind');
                                // print('flag=  $flagName');
                              },
                              onDoubleTap: () {},
                              onSwipe: () {},
                              onTap: () {

                              },
                            ),
                          ),
                          /// Title
                          // Flexible(child:Text(AppLocalizations.translate(switchRollingList[index].key).toString()), ),

                        ],


                 // RollingSwitch(
                 //   value: false,
                 //   onChanged: (bool state) {
                 //     print('turned ${(state) ? 'on' : 'off'}');
                 //   },
                 //   onDoubleTap: () {},
                 //   onSwipe: () {},
                 //   onTap: () {
                 //
                 //   },
                 // ),

             ),
             ),
           );
        },
    );


  }



  DropdownButtonFormField getDropDownMarket2(index, List<Market> listItems) {
    return DropdownButtonFormField<Market>(
      value: dynamicFormsList[index].selectedItemMarket,
      borderRadius: BorderRadius.circular(10),
      items: listItems.map<DropdownMenuItem<Market>>((Market value) {
        return DropdownMenuItem<Market>(
          value: value,
          child: Text(value.name!),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          dynamicFormsList[index].selectedItemMarket = value;
          if (dynamicFormsList[index].controlName == AppLocalizations.translate("markets")) {
            //Get states based on selected country by parent id.
            var filteredstates = states
                .where((element) => value?.id == element.parentId)
                .toList();


            if (filteredstates.isNotEmpty) {
              dynamicFormsList.insert(
                  index + 1,
                  DynamicModel("Markets", FormType.Dropdown,
                      // items: filteredstates
                      itemsCountries: filteredstates

                  ));
            }
          }
        });
      },
      validator: (value) => value == null ? 'Field required' : null,
      decoration: InputDecoration(
          labelText: dynamicFormsList[index].controlName,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0)))),
    );
  }


  // DropdownButtonFormField getDropDownMarket3(index, List<Market> marketsEnabledGet) {
  //
  //   for(var market in marketsEnabledGet){
  //     markets.add(market.name);
  //   }
  //
  //   return DropdownButtonFormField<Market>(
  //     value: dynamicFormsList[index].selectedItemMarket,
  //     borderRadius: BorderRadius.circular(10),
  //     items: marketsEnabledGet.map<DropdownMenuItem<Market>>((Market value) {
  //       // return DropdownMenuItem<Market>(
  //       //   value: value,
  //       //   child: Text(value.name!),
  //       // );
  //       CustomSingleSelectField<Market>(
  //         decoration: InputDecoration(
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(14.0),
  //               borderSide: const BorderSide(color:Colors.pink),
  //
  //             )
  //         ),
  //         items: marketsList,
  //         // itemsRoles: market,
  //         title: "Market On selected 1",
  //         onSelectionDone: (value) {
  //           selectedString = value;
  //           setState(() {
  //             onSelectionDone: _onMarketSelectionComplete;
  //           });
  //         },
  //         itemAsString: (item) => item,
  //       );
  //     }).toList(),
  //     onChanged: (value) {
  //       setState(() {
  //         dynamicFormsList[index].selectedItemMarket = value;
  //         if (dynamicFormsList[index].controlName == AppLocalizations.translate("markets")) {
  //           //Get states based on selected country by parent id.
  //           var filteredstates = states
  //               .where((element) => value?.id == element.parentId)
  //               .toList();
  //
  //
  //           if (filteredstates.isNotEmpty) {
  //             dynamicFormsList.insert(
  //                 index + 1,
  //                 DynamicModel("Markets", FormType.Dropdown,
  //                     // items: filteredstates
  //                     itemsCountries: filteredstates
  //
  //                 ));
  //           }
  //         }
  //       });
  //     },
  //     validator: (value) => value == null ? 'Field required' : null,
  //     decoration: InputDecoration(
  //         labelText: dynamicFormsList[index].controlName,
  //         border: const OutlineInputBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(14.0)))),
  //   );
  // }
 /// DROPDOWN MARKET ON SELECTED
  getDropDownMarket(index, List<String> marketsEnabledGet,Market?  marketSelected){

     // if( markets.isEmpty ||  markets.length > marketsEnabledGet.length){
     //           markets.clear();
     //   for(var market in marketsEnabledGet){
     //     markets.add(market.name.toDartString());
     //   }
     // }
    return Container(
        decoration:  BoxDecoration(
          //   color:  Colors.white70,
            borderRadius: const BorderRadius.all(Radius.circular(14)),
          border: Border.all(color: Colors.black38)
        ),
      child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomSingleSelectField<String>(
            // title: "Market On selected 1",
               title: AppLocalizations.translate("market"),
                items: marketsEnabledGet,
            // itemsRoles: market,
               onSelectionDone: (value) {
              selectedString = value;
              setState(() {
                onSelectionDone: _marketOnSelected;
              });
            },
            itemAsString: (item) => item,

          // const SizedBox(
          //   height: 10,
          // ),
          // CustomMultiSelectField<String>(
          //   title: "Market >",
          //   items: market,
          //   selectedItemsRole: selectedItems, ///List role selected
          //   //itemsRole: roles,
          //   enableAllOptionSelect: true,
          //   onSelectionDone: _onMarketSelectionComplete,
          //   itemAsString: (item) => item.toString(),
          //
          // ),
          ),
        ],
      ),
    );

  }

  void _marketOnSelected(value) {
   /// selectedDataString.addAll(value);
    // for(var element in value){
    //      selectedDataString.add(element);
    // }

    setState(() {
      ///
      marketSelected =value;

      for(var market in dynamicFormsList){
        if(market.controlName==AppLocalizations.translate("market") ){

          int index= dynamicFormsList.indexWhere((element)=>element.controlName.toString() == market.controlName);

          dynamicFormsList[index].value=value.toString();
          dynamicFormsList[index].marketSelected=value; /// List roles selected
        }
      }
    });

    marketSelected;
  }

     getDropDownRoles(index, List<String> roles, List<dynamic>? selectedItems){

    return Container(
      decoration:  BoxDecoration(
         // color:  Colors.white70,
          borderRadius: const BorderRadius.all(Radius.circular(14)),
          border: Border.all(color: Colors.black38)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomMultiSelectField<String>(

            title: AppLocalizations.translate("roles"),
            items: roles,
            selectedItemsRole: selectedItems, ///List role selected
            //itemsRole: roles,
            enableAllOptionSelect: true,
            onSelectionDone: _onRolesSelectionComplete,
            itemAsString: (item) => item.toString(),

          ),
          // const SizedBox(
          //   height: 10,
          // ),
          // CustomSingleSelectField<String>(
          //     items: roles,
          //  // itemsRoles: roles,
          //   title: "Roles On selected",
          //   onSelectionDone: (value) {
          //     selectedString = value;
          //     setState(() {});
          //   },
          //   itemAsString: (item) => item,
          // ),

        ],
      ),
    );

  }
///Roles
  void _onRolesSelectionComplete(value) {
    selectedDataString.addAll(value);
    // for(var element in value){
    //      selectedDataString.add(element);
    // }

    setState(() {
      ///
      selectedItemsRole =value;

      for(var role in dynamicFormsList){
        if(role.controlName==AppLocalizations.translate("roles") ){

          int index= dynamicFormsList.indexWhere((element)=>element.controlName.toString() == role.controlName);

          dynamicFormsList[index].value=value.toString();
          dynamicFormsList[index].selectedRolesItems=value; /// List roles selected

        }
      }

    });

    selectedItemsRole;
  }
  Widget getFlagRollingSwitch(index){

    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        //By default

        /// value Todo

        //Customized
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: RollingSwitch(
            value: true,
            width: 150,
            textOn: 'active',
            textOff: 'inactive',
            colorOn: Colors.red,
            colorOff: Colors.blueGrey,
            iconOn: Icons.lightbulb_outline,
            iconOff: Icons.power_settings_new,
            animationDuration: const Duration(milliseconds: 300),
            onChanged: (bool state) {
              print('turned ${(state) ? 'on' : 'off'}');
            },
            onDoubleTap: () {},
            onSwipe: () {},
            onTap: () {

            },
          ),
        )


        // RollingSwitch(
        //   value: false,
        //   onChanged: (bool state) {
        //     print('turned ${(state) ? 'on' : 'off'}');
        //   },
        //   onDoubleTap: () {},
        //   onSwipe: () {},
        //   onTap: () {
        //
        //   },
        // ),
      ],
    );

  }

  getFlagChecked(index) {
    List<String> text = ["true", "false", "true"];
    bool? isChecked = true;
    String currText  = 'Test Lahat';

    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: Text(currText,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )),
          ),
        ),
        // Expanded(
        //     child: SizedBox(
        //       height: 350.0,
        //       child: Column(
        //         children: text
        //             .map((t) => CheckboxListTile(
        //           title: Text(t),
        //           value: isChecked,
        //           onChanged: (val) {
        //             setState(() {
        //               isChecked = val;
        //               if (val == true) {
        //                 currText = t;
        //               }
        //             });
        //           },
        //         ))
        //             .toList(),
        //       ),
        //     )
        // ),
      ],
    );

  }

  TextFormField getTextWidget(index) {
    return TextFormField(
      decoration: InputDecoration(
          helperText: dynamicFormsList[index].hintText,
          labelText: dynamicFormsList[index].controlName,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0))
             )
          ),
      keyboardType: dynamicFormsList[index].validators.any((element) =>
              element.type == validatorType.PhoneNumber ||
              element.type == validatorType.Age)
          ? TextInputType.phone
          : TextInputType.text,
      maxLines: null,
      validator: (text) {
        var selectedField = dynamicFormsList[index];
        //Not empty
        if (selectedField.isRequired &&
            selectedField.validators
                .any((element) => element.type == validatorType.Notempty) &&
            (text == null || text.isEmpty)) {
          return selectedField.validators
              .firstWhere((element) => element.type == validatorType.Notempty)
              .errorMessage;
        }

        //Text length
        if (selectedField.validators
            .any((element) => element.type == validatorType.TextLength)) {
          var validator = selectedField.validators.firstWhere(
              (element) => element.type == validatorType.TextLength);
          int? len = text?.length;
          if (len != null && len > validator.textLength) {
            return validator.errorMessage;
          }
        }

        //Phone Number
        if (selectedField.validators
            .any((element) => element.type == validatorType.PhoneNumber)) {
          var validator = selectedField.validators.firstWhere(
              (element) => element.type == validatorType.PhoneNumber);
          int? len = text?.length;
          if (len != null &&
              (len < validator.textLength || len > validator.textLength)) {
            return validator.errorMessage;
          }
        }

        //Age
        // if (selectedField.validators
        //     .any((element) => element.type == validatorType.Age)) {
        //   var validator = selectedField.validators
        //       .firstWhere((element) => element.type == validatorType.Age);
        //   int? len = text?.length;
        //   if (len != null && len > validator.textLength) {
        //     return validator.errorMessage;
        //   }
        // }

        //Email
        if (selectedField.validators
            .any((element) => element.type == validatorType.Email)) {
          var validator = selectedField.validators
              .firstWhere((element) => element.type == validatorType.Email);
          if (text != null && !EmailValidator.validate(text)) {
            return validator.errorMessage;
          }
        }
        return null;
      },
      onChanged: (text) {
        dynamicFormsList[index].value = text;
        if (isSubmitClicked) globalFormKey.currentState?.validate();
      },
    );
  }

  TextFormField getMultilineTextWidget(index) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: dynamicFormsList[index].controlName,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0)))),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onChanged: (text) {
        dynamicFormsList[index].controlName = text;
      },
    );
  }



///Markets
  void _marketsSelectedAssociateComplete(value) {
   /// selectedDataString.addAll(value);
     // for(var element in value){
     //      selectedDataString.add(element);
     // }

    setState(() {
      ///
      selectedItemsMarkets =value;

      for(var market in dynamicFormsList){
        if(market.controlName==AppLocalizations.translate("markets") ){

              int index= dynamicFormsList.indexWhere((element)=>element.controlName.toString() == market.controlName);

             dynamicFormsList[index].value=value.toString();
             dynamicFormsList[index].selectedMarketsEnabled=value; /// List roles selected

        }
      }

    });

    selectedItemsMarkets;
  }
  /// DROPDOWN ROLE

  // DropdownButtonFormField getDropDownRoles(index, List<String> roles){
  //
  //   return DropdownButtonFormField(items: items, onChanged: onChanged)
  // }
  //


  /// ROLES
  // DropdownButtonFormField getDropDownRoles(index, List<String> roles){
  //
  //   return DropdownButtonFormField<Role>(
  //     items: const [],
  //     onChanged: (value) {  },
  //     hint: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: <Widget>[
  //         CustomSingleSelectField<String>(
  //           items: roles,
  //           // itemsRoles: roles,
  //           title: "Roles",
  //           onSelectionDone: (value) {
  //             selectedString = value;
  //             setState(() {});
  //           },
  //           itemAsString: (item) => item,
  //         ),
  //         const SizedBox(
  //           height: 20,
  //         ),
  //         CustomMultiSelectField<String>(
  //           title: "Roles",
  //           items: roles,
  //           //itemsRole: roles,
  //           enableAllOptionSelect: true,
  //           onSelectionDone: _onCountriesSelectionComplete,
  //           itemAsString: (item) => item.toString(),
  //         ),
  //       ],
  //     ),
  //
  //   );
  //
  // }

  /// COUNTRIES
  Container getDropDown(index, List<CountryCode> listItems) {
return Container(

          decoration: BoxDecoration(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10),
          ),

        child: DropdownButtonFormField<CountryCode>(
      value: dynamicFormsList[index].selectedItem,
        borderRadius: BorderRadius.circular(10),
        items: listItems.map<DropdownMenuItem<CountryCode>>((CountryCode value) {
          return DropdownMenuItem<CountryCode>(
            value: value,
            child: Text(value.name!),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            dynamicFormsList[index].selectedItem = value;
            if (dynamicFormsList[index].controlName == AppLocalizations.translate("country")) {
              //Get states based on selected country by parent id.
              var filteredstates = states
                  .where((element) => value?.id == element.parentId)
                  .toList();

              if (dynamicFormsList
                  .any((element) => element.controlName == "State")) {
                dynamicFormsList[index + 1].selectedItem = null;
                var existingitem = dynamicFormsList
                    .firstWhere((element) => element.controlName == "State");
                dynamicFormsList.remove(existingitem);
              }

              if (filteredstates.isNotEmpty) {
                dynamicFormsList.insert(
                    index + 1,
                    DynamicModel("State", FormType.Dropdown,
                        // items: filteredstates
                        itemsCountries: filteredstates

                    ));
              }
            }
          });
        },
        validator: (value) => value == null ? 'Field required' : null,
        decoration: InputDecoration(
            labelText: dynamicFormsList[index].controlName,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(14.0)))),
        ),
        );
  }

  Widget getAutoComplete(index) {
    return DropdownSearch<String>.multiSelection(
      items: const ["Facebook", "Twitter", "Microsoft"],
      popupProps: const PopupPropsMultiSelection.menu(
        isFilterOnline: true,
        showSelectedItems: true,
        showSearchBox: true,
        favoriteItemProps: FavoriteItemProps(
          showFavoriteItems: true,
        ),
      ),
      onChanged: print,
      selectedItems: const ["Facebook"],
    );
  }

  Widget getHtmlReadOnly(index) {
    return Html(
      data: dynamicFormsList[index].value,
      shrinkWrap: true,
      style: {
        // tables will have the below background color
        "table": Style(
          backgroundColor: const Color.fromARGB(0x50, 0xee, 0xee, 0xee),
        ),
        // some other granular customizations are also possible
        "tr": Style(
          border: const Border(bottom: BorderSide(color: Colors.grey)),
        ),
        "th": Style(
         // padding: const EdgeInsets.all(6),
          backgroundColor: Colors.grey,
        ),
        "td": Style(
         // padding: const EdgeInsets.all(6),
          alignment: Alignment.topLeft,
        ),
      },
    );
  }

  Widget getDatePicker(index) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
          labelText: dynamicFormsList[index].controlName,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(14.0)))),
      maxLines: null,
      readOnly: true,
      onTap: () {
        showDialog<Widget>(
            context: context,
            builder: (BuildContext context) {
              return SfDateRangePicker(
                controller: dateRangePickerController,
                selectionColor: Colors.green,
                showActionButtons: true,
                // backgroundColor: Colors.white,
                backgroundColor: Colors.indigo,
                todayHighlightColor: Colors.transparent,
                initialSelectedDate: DateTime(2023, 1, 22),
                onSubmit: (Object? value) {
                  Navigator.pop(context);
                  setState(() {
                    dynamicFormsList[index].value = DateFormat("dd/MM/y")
                        .format(dateRangePickerController.selectedDate!);
                    textEditingController.text = dynamicFormsList[index].value;
                  });
                },
                onCancel: () {
                  Navigator.pop(context);
                },
              );
            });
      },
    );
  }
//  Widget getHtmlEditor(index) {
//     return HtmlEditor(
//       controller: controller, //required
//       htmlEditorOptions: const HtmlEditorOptions(
//         hint: "Your text here...",
//         //initalText: "text content initial, if any",
//       ),
//       otherOptions: const OtherOptions(
//         height: 400,
//       ),
//     );
//   }

  bool validateAndSave( List<DynamicModel> dynamicFormsList) {
    final form = globalFormKey.currentState;
    if (form!.validate()) {
      form.save();
      saveUserdata(dynamicFormsList);

      return true;
    }
    return false;
  }


  Future<void> saveUserdata(List<DynamicModel> dynamicFormsList)async {

    // final File file =File('assets/json/users.json');
     //     readDataUser(file);



            /// create new una map con name e value of form ,  transformer the map to json
            Map<String,dynamic> usersData={};


            /// EXTRACTION DATA DYNAMICFORMLIST FROM MAP STRING DYNAMIC
            for(var data in dynamicFormsList){
              usersData.putIfAbsent(data.controlName, () => data.value);
            }

            /// PARSING USERS FROM JSON
            Users   users =Users.fromJson(usersData);

            /// SAVE USER DATABASE AND SHARED PREFERENCE
            var result = UsersProvider.addNewUser(users,usersData);


            // usersData.putIfAbsent("id", () => "1");
            // usersData.putIfAbsent("code", () => "2522");
            // usersData.putIfAbsent("codeDefaultMarket", () => "8885");
            // usersData.putIfAbsent("codeClient", () => "2587");
            // usersData.putIfAbsent("codeDealer", () => "2222");
            // usersData.putIfAbsent("codeTeamWorkers", () => "6966");
            // usersData.putIfAbsent("codeSuppliers", () => "5887");
            // usersData.putIfAbsent("name", () => "Lahat");
            // usersData.putIfAbsent("email", () => "lahat@gmail.com");
            // usersData.putIfAbsent("password", () => "123");
            // usersData.putIfAbsent("phone", () => "2577");
            // usersData.putIfAbsent("office", () => "Dakar");
            // usersData.putIfAbsent("officeAddress", () => "Turin");
            // usersData.putIfAbsent("officeCity", () => "Dakar");
            // usersData.putIfAbsent("officePhoneMobile", () => "5588");
            // usersData.putIfAbsent("dateCreation", () => "01/02/2024");
            // usersData.putIfAbsent("isEnabled", () => true);
            // usersData.putIfAbsent("isEnabledMarket", () => false);
            // usersData.putIfAbsent("isFavorite", () => true);
            // usersData.putIfAbsent("isShowMarket", () => true);
            // usersData.putIfAbsent("isMarketDefault", () => false);
            // usersData.putIfAbsent("isNotification", () => true);




            // List<Map<String, Map<String, dynamic>>> result =
            // await databaseConnection.mappedResultsQuery(
            //   "INSERT INTO public.user_date(id, data_json)VALUES (1, '$dataRegisterJson');",
            // );


  }


  Future<void> readDataUser(File file) async{
   String contents= await file.readAsString();
   var jsonResponse=jsonDecode(contents);


   for(var u in jsonResponse) {
     Users user =Users(name:u['name'],code:u['code'],phone:u['email']);

     users.add(user);
   }

   /// convert list data to json

    users.map((e) => e.toJson(),
    ).toList();

   file.writeAsString(json.encode(users));

  }



  //Add dummy forms, it will be invoked when page initialized.
  void initializeForms() {


    states.addAll(countriesEnabled);
    // states.add(ItemModel(1, "TamilNadu", parentId: 1));
    // states.add(ItemModel(2, "Delhi", parentId: 1));
    // states.add(ItemModel(3, "Kerala", parentId: 1));
    // states.add(ItemModel(4, "California", parentId: 2));
    // states.add(ItemModel(5, "Alaska", parentId: 2));
    // states.add(ItemModel(6, "Colorado", parentId: 2));
    // states.add(ItemModel(7, "Queensland", parentId: 3));
    // states.add(ItemModel(8, "Tasmania", parentId: 3));
    // states.add(ItemModel(9, "Victoria", parentId: 3));



   // countries.add(ItemModel(1, "India"));
    // countries.add(ItemModel(2, "USA"));
    // countries.add(ItemModel(3, "Australia"));
    // countries.add(ItemModel(4, "England"));

    /// Name
    DynamicModel dynamicModelName = DynamicModel(AppLocalizations.translate("name"), FormType.Text, isRequired: true, hintText: "Maximum length should be 10");
    dynamicModelName.validators = [];
    dynamicModelName.validators.add(DynamicFormValidator(validatorType.Notempty, "Name should not be Empty"));
    dynamicModelName.validators.add(DynamicFormValidator(validatorType.TextLength, "Maximum length should be 4", textLength: 20));
    dynamicFormsList.add(dynamicModelName);

   ///Code
    DynamicModel dynamicModeCode= DynamicModel(AppLocalizations.translate("code"), FormType.Text, isRequired: false, hintText: "Maximum length should be 4");
    dynamicModeCode.validators=[];
    dynamicModeCode.validators.add(DynamicFormValidator(validatorType.Notempty, errorMessageCode));
    dynamicModeCode.validators.add(DynamicFormValidator(validatorType.Notempty, errorMessageCode,textLength: 4));
    dynamicFormsList.add(dynamicModeCode);

   /// Email
    DynamicModel dynamicModelEmail = DynamicModel(AppLocalizations.translate("email"), FormType.Text, isRequired: true);
    dynamicModelEmail.validators = [];
    dynamicModelEmail.validators.add(DynamicFormValidator(validatorType.Notempty, "Email address should not be Empty"));
    dynamicModelEmail.validators.add(DynamicFormValidator(validatorType.Email, "Invalid email address", ));
    dynamicFormsList.add(dynamicModelEmail);

    /// PHONE Number
    DynamicModel dynamicModelPhone = DynamicModel(AppLocalizations.translate("phone"), FormType.Text,isRequired: false, hintText: "Phone number should be 6 digits");
    dynamicModelPhone.validators = [];
    dynamicModelPhone.validators.add(DynamicFormValidator(validatorType.Notempty, "Phone number should not be Empty"));
    dynamicModelPhone.validators.add(DynamicFormValidator(validatorType.PhoneNumber, "Phone number should be 6 digits", textLength:6));
    dynamicFormsList.add(dynamicModelPhone);

    /// ADRESS
    DynamicModel dynamicModelAddress=DynamicModel(AppLocalizations.translate("address"), FormType.Text, isRequired: false,hintText: "Market is Required");
    dynamicModelAddress.validators=[];
   // dynamicModelAddress.validators.add(DynamicFormValidator(validatorType.Notempty, "Market should be not empty"));
    dynamicFormsList.add(dynamicModelAddress);

    ///Countries
    // DynamicModel  dynamicModelCountries= DynamicModel(AppLocalizations.translate("country"),itemsCountries: countriesEnabled, FormType.Dropdown,isRequired: false);
    // dynamicModelCountries.validators=[];
    // dynamicModelCountries.validators.add(DynamicFormValidator(validatorType.Notempty, errorMessageCodeClient));
    // dynamicFormsList.add(dynamicModelCountries);

    ///Market DropDown
    DynamicModel dynamicModelMarket=DynamicModel(AppLocalizations.translate("market"), FormType.DropdownMarket,marketsEnabled: marketItems, isRequired:false, hintText: AppLocalizations.translate("market"));
     dynamicModelMarket.validators=[];
     dynamicModelMarket.validators.add(DynamicFormValidator(validatorType.Market, "Market should be not empty"));
     dynamicFormsList.add(dynamicModelMarket);

    /// Roles Dropdown
      DynamicModel dynamicModelRoles=DynamicModel(AppLocalizations.translate("roles"), FormType.DropdownRole, rolesItems: rolesItems,selectedRolesItems: selectedItemsRole, hintText: AppLocalizations.translate("rolesEnabled"),isRequired:false,);
       dynamicModelRoles.validators=[];
       dynamicModelRoles.validators.add(DynamicFormValidator(validatorType.Notempty, "Roles should be not empty"));
       dynamicFormsList.add(dynamicModelRoles);


    /// Markets Disponibiles Enabled Dropdown
    DynamicModel dynamicModelMarketEnabled=DynamicModel(AppLocalizations.translate("markets"), FormType.DropdownMarketsEnabled,marketsEnabled:marketItems , selectedMarketsEnabled: selectedItemsMarkets, hintText: AppLocalizations.translate("marketsEnabled"),isRequired:false,);
    dynamicModelMarketEnabled.validators=[];
    dynamicModelMarketEnabled.validators.add(DynamicFormValidator(validatorType.Notempty, "DropdownMarketsEnabled should be not empty"));
    dynamicFormsList.add(dynamicModelMarketEnabled);

     ///  IsEnabled user rolling Switch
    // DynamicModel dynamicModelIsEnabled=DynamicModel(AppLocalizations.translate("isEnabled"), FormType.RollingSwitch, isRequired: false, hintText: "isEnabled");
    // dynamicModelIsEnabled.validators=[];
    // dynamicModelIsEnabled.validators.add(DynamicFormValidator(validatorType.isEnabled, "User isEnabled"));
    // dynamicFormsList.add(dynamicModelIsEnabled);


    /// NOTES
    DynamicModel dynamicModelNote=DynamicModel(AppLocalizations.translate("notes"), FormType.Text, isRequired: false, hintText:AppLocalizations.translate("notes"));
    dynamicModelNote.validators=[];
    dynamicModelAddress.validators.add(DynamicFormValidator(validatorType.Notempty, "Market should be not empty"));
    dynamicFormsList.add(dynamicModelNote);

    /// Rolling switch list enabled disabled
    // DynamicModel dynamicModelIsEnabledFlag=DynamicModel("RollingSwitchList", FormType.RollingSwitchList, isRequired: false, hintText: "RollingSwitchList");
    // dynamicFormsList.add(dynamicModelIsEnabledFlag);


    /// switchRollingList
    // DynamicModel dynamicModelSwitchRollingList=DynamicModel(AppLocalizations.translate("isEnabled"), FormType.RollingSwitchList, isRequired: false, hintText: "isEnabledList");
    // dynamicModelSwitchRollingList.validators=[];
    // dynamicModelSwitchRollingList.validators.add(DynamicFormValidator(validatorType.isEnabled, "User isEnabled List"));
    // dynamicFormsList.add(dynamicModelSwitchRollingList);

    for(var flagRolling in switchRollingList){
      ///  IsEnabled user rolling Switch
      //  String flagName= AppLocalizations.translate(flagRolling.key.toString());
        String flagName= flagRolling.key.toString();
        DynamicModel dynamicModelIsEnabledFlag=DynamicModel(flagName, FormType.RollingSwitchList, isRequired: false, hintText: flagName);
        dynamicModelIsEnabledFlag.validators=[];
        // dynamicModelIsEnabled.validators.add(DynamicFormValidator(validatorType.isEnabled, flagName));
        dynamicFormsList.add(dynamicModelIsEnabledFlag);

    }


    dynamicFormsList;
    switchRollingList;

    /// isMarketDefault checkbox
    // DynamicModel dynamicModelIsMarketDefault=DynamicModel(AppLocalizations.translate("isMarketDefault"), FormType.CheckBox,isRequired: false, hintText: "isMarketDefault");
    // dynamicModelIsMarketDefault.validators=[];
    // dynamicModelIsMarketDefault.validators.add(DynamicFormValidator(validatorType.isEnabled, "User isMarketDefault"));
    // dynamicFormsList.add(dynamicModelIsMarketDefault);

    ///CodeCliente



   /// dynamicFormsList.add(dynamicModel);
    /// State list TODO

       // DynamicModel  dynamicModelRegion= DynamicModel(AppLocalizations.translate("region"), FormType.Text, isRequired: false, hintText: "Maximum length should be 2");
       // dynamicFormsList.add(dynamicModelRegion);

    // dynamicFormsList.add(DynamicModel("Country", FormType.Dropdown, items: countries));



    // dynamicModel = DynamicModel("Age", FormType.Text);
    // dynamicModel.validators = [];
    // dynamicModel.validators.add(DynamicFormValidator(
    //   validatorType.Age,
    //   "Age should be 2 digits",
    // ));




    // dynamicFormsList.add(DynamicModel("Address", FormType.Multiline));
    // dynamicFormsList.add(DynamicModel("DOB", FormType.DatePicker));
    // // dynamicFormsList.add(DynamicModel("Country", FormType.Dropdown, items: countries));
    // dynamicFormsList.add(DynamicModel("Contact", FormType.AutoComplete));
    // dynamicFormsList.add(DynamicModel("About", FormType.HTMLReader,
    //     value:
    //         """"<p><strong>Bold&nbsp; <span style="background-color: rgb(255, 255, 0);">BackGroundColor</span></strong></p><p style="text-align: justify;"><strong><em>Italic.</em></strong></p><p><span style="text-decoration: underline;">Underline</span></p><p><span style="color: rgb(255, 0, 0); text-decoration: inherit;">Text colour</span></p><p style="text-align: left;"><span style="color: rgb(255, 0, 0); text-decoration: inherit;">Left Alignments</span></p><p style="text-align: center;"><span style="color: rgb(255, 0, 0); text-decoration: inherit;">Centre alignments</span></p><p style="text-align: right;"><span style="color: rgb(255, 0, 0); text-decoration: inherit;">Right alignments</span></p><p style="text-align: justify;"><span style="color: rgb(255, 0, 0); text-decoration: inherit;">Alignment justify</span></p><pre><span style="color: rgb(255, 0, 0); text-decoration: inherit;"><span style="color: rgb(0, 0, 0); font-family: Heebo, &quot;open sans&quot;, sans-serif, -apple-system, BlinkMacSystemFont; font-size: 14px; font-style: normal; font-weight: 400; text-align: left; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;">code</span><span style=" color: rgb(0, 0, 0); font-family: Heebo, &quot;open sans&quot;, sans-serif, -apple-system, BlinkMacSystemFont; font-size: 14px; font-style: normal; font-weight: 400; text-align: left; text-indent: 0px; white-space: normal;">&nbsp;</span><br></span></pre><p><span style="text-decoration: inherit;">Paragraph </span></p><ol><li><h1><span style="text-decoration: inherit;">Heading 1, </span></h1></li><li><h2><span style="text-decoration: inherit;">Heading 2, </span></h2></li><li><h3><span style="text-decoration: inherit;">Heading 3, </span></h3></li><li><h4><span style="text-decoration: inherit;">Heading 4,&nbsp;</span></h4></li></ol><blockquote><span style="text-decoration: inherit;"><span style="color: rgb(0, 0, 0); font-family: Heebo, &quot;open sans&quot;, sans-serif, -apple-system, BlinkMacSystemFont; font-size: 14px; font-style: normal; font-weight: 400; text-align: left; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;">quotation<span>&nbsp;</span></span></span></blockquote><p><span style="text-decoration: inherit;"><span style="color: rgb(0, 0, 0); font-family: Heebo, &quot;open sans&quot;, sans-serif, -apple-system, BlinkMacSystemFont; font-size: 14px; font-style: normal; font-weight: 400; text-align: left; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;"><span><a class="e-rte-anchor" href="https://stagingboldsign.bolddesk.com/" title="Hyper link" target="_blank">Hyper link</a></span></span></span></p><p><span style="text-decoration: inherit;"><span style="color: rgb(0, 0, 0); font-family: Heebo, &quot;open sans&quot;, sans-serif, -apple-system, BlinkMacSystemFont; font-size: 14px; font-style: normal; font-weight: 400; text-align: left; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;"><span><img src="https://stagingboldsign.bolddesk.com/attachment/inline?token=eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjQ4ODE0Iiwib3JnaWQiOiIxIiwiaXNzIjoic3RhZ2luZ2JvbGRzaWduLmJvbGRkZXNrLmNvbSJ9.ioxUtZ5A5JnEgC7BtUfEp4pYlOayWGu7MIobDVyUGKM" class="e-rte-image e-imginline e-img-focus" alt="MicrosoftTeams-image.png" width="auto" height="auto" style="min-width: 0px; max-width: 814px; min-height: 0px;"> </span></span></span></p><p><span style="text-decoration: inherit;"> </span></p><table class="e-rte-table" style="width: 100%; min-width: 0px;"><tbody><tr><td class="" style="width: 50%;">Test 1</td><td style="width: 50%;" class=""><span style="color: rgb(0, 0, 0); font-family: Heebo, &quot;open sans&quot;, sans-serif, -apple-system, BlinkMacSystemFont; font-size: 14px; font-style: normal; font-weight: 400; text-align: left; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Test 2</span><br></td></tr><tr><td style="width: 50%;" class=""><span style="color: rgb(0, 0, 0); font-family: Heebo, &quot;open sans&quot;, sans-serif, -apple-system, BlinkMacSystemFont; font-size: 14px; font-style: normal; font-weight: 400; text-align: left; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Test 4</span><br></td><td style="width: 50%;" class=""><span style="color: rgb(0, 0, 0); font-family: Heebo, &quot;open sans&quot;, sans-serif, -apple-system, BlinkMacSystemFont; font-size: 14px; font-style: normal; font-weight: 400; text-align: left; text-indent: 0px; white-space: normal; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Test 4</span><br></td></tr></tbody></table><pre><span style="color: rgb(255, 0, 0); text-decoration: inherit;">Coding control<br></span></pre>"""));
    //
  }










}
