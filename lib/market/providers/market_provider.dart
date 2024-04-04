


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../roots/trunk/branches/commun_data_utils/utils/string/helper_dev.dart';
import '../../roots/trunk/branches/localisation/country/components/country_selection_theme.dart';
import '../../roots/trunk/branches/managements/users/components/users.dart';
import '../../roots/trunk/branches/products/components/product.dart';
import '../../roots/trunk/branches/repositories/cart_repository.dart';
import '../components/market.dart';
import '../data/market_data.dart';


/// ==============================  INIT ADD DATA MARKET FROM  MAP MARKETS   =============================================

class MarketProvider with ChangeNotifier , DiagnosticableTreeMixin {

  bool _disposed = false;

  static List<String> marketListItems=[];

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  // @override
  // void initState(){
  //   fetchCurrentCodeLang();
  // }

  Market? market ;
  /// MARKET SELECTED
  static Market? _marketSelected;
  ///
  static String? currentCodeMarket ;

  static String? _currentCodeLanguage ;

  static bool _isInitialLoadMarket=true;
  /// LIST MARKET  ENABLED
  static List<Market> _markets=[];

  ///  LIST ALL MARKET
  static List<Market> _marketsList=[];

  ///MAP MARKET ENABLED
  static Map<String, Market> _marketsEnabled = {};

  /// MAP ALL MARKET
  static Map<String, Market> _marketsAll = {};


  ///--------------------------------------------------
  /// PRODUCT
  static final List<Product> products=[];

  static  Map<String, Product> _productItems = {};

  List<Product> getProducts () {
    return products;
  }
  List<Product> setProducts ( List<Product> productsList) {
    //  products!=productsList;
    products.clear();
    products.addAll(productsList);

    return products;
  }

  Product findByProductCode(String code) {
    return products.firstWhere((element) => element.codeProd.toString() == code);
  }
  /// Gestion Repository Cart save
  static final CartRepository _marketRepository = GetIt.instance<CartRepository>();

    ///USERS

   Map<String,Users> usersItems ={};

   List<Users>  users=[];


  @observable
  static ObservableList<Market> _market= ObservableList();
////------------------------------------------

  /// UPDAT E MARKET ON CHANGE
  updateMarketSelected(Market? marketSelected) {

    if(marketSelected !=null){
      _marketSelected=marketSelected;
    }
  }

  Future<Map<String, Market>> getDataMarket(BuildContext context, currentCodeLang) async{

    /// 1.  Check list and map Markets enabled, List and map all markets
    fetchMarketLit();

    /// 2. get language of user
    fetchCurrentCodeLang(currentCodeLang);

    ///3.  Market selected Enabled
    fetchMarketSelected(currentCodeLanguage);

    /// 4. isInitialLoadMarket
    _isInitialLoadMarket=false;

    /// notifyListeners();
    return marketsEnabled;
  }



  fetchMarketLit(){

    CountryTheme? theme;
    List<Map> jsonList = theme?.showEnglishName ?? true ? marketData : marketData;

    List elements = jsonList
        .map((s) => Market(
        name: s['name'],
        code: s['code'],
        dialCode: s['dial_code'],
        flagUri: 'assets/images/flags/${s['code'].toLowerCase()}.png',
        isEnabled: HelperDev.boolFromString(s['isEnabled'].toString())
    )).toList();

    /// ALL LIST MARKET AND ALL MAP MARKET
    for(Market market in elements){
      marketsList.add(market);
      marketsAll.putIfAbsent(market.code, () => market);
    }

    // FILTRE THE LIST MARKETS ENABLED :

    for(Market market in marketsList){
      if (market.isEnabled !=null  && market.isEnabled!) {
        markets.add(market);
        marketListItems.add(market.name);
        marketsEnabled.putIfAbsent(market.code, () => market);
      }
    }

    /// ZAYNAB LAHAT BORRACCIA
    /// SORT BY NAME MARKEYT
    markets.sort((a, b) {
      return a.name.toString().compareTo(b.name.toString());
    });

  }

  List<Market> fetchMarkets (){

    CountryTheme? theme;
    List<Map> jsonList = theme?.showEnglishName ?? true ? marketData : marketData;

    List elements = jsonList
        .map((s) => Market(
        name: s['name'],
        code: s['code'],
        dialCode: s['dial_code'],
        flagUri: 'assets/images/flags/${s['code'].toLowerCase()}.png',
        isEnabled: HelperDev.boolFromString(s['isEnabled'].toString())
    )).toList();

    /// ALL LIST MARKET AND ALL MAP MARKET
    for(Market market in elements){
      marketsList.add(market);
      marketsAll.putIfAbsent(market.code, () => market);
    }

    // FILTRE THE LIST MARKETS ENABLED :

    for(Market market in marketsList){
      if (market.isEnabled !=null  && market.isEnabled!) {
        markets.add(market);
        marketsEnabled.putIfAbsent(market.code, () => market);
      }
    }

    /// ZAYNAB LAHAT BORRACCIA
    /// SORT BY NAME MARKEYT
    markets.sort((a, b) {
      return a.name.toString().compareTo(b.name.toString());
    });

    return marketsEnabled.values.toList();

  }

  Future<String?> fetchCurrentCodeLang(currentCodeLang) async{

    if(currentCodeLang!=null){
      _currentCodeLanguage=currentCodeLang;
    }else{
      /// super.initState();
      var prefs= await SharedPreferences.getInstance();
      /// code lingua actualle
      String? currentCodeLangDefault = prefs.getString("currentCodeLang");

      /// code lingua actualle
      if(currentCodeLangDefault!.isNotEmpty){
        _currentCodeLanguage = currentCodeLangDefault.toString().toLowerCase();
        bool  isInitialLang=true;
      }
    }


    return _currentCodeLanguage;

  }

  Future <void> fetchMarketSelected(String currentCodeLang) async {
    for(Market market in markets){
      if(market.code.toString().toLowerCase() == currentCodeLang.toString().toLowerCase()){
        // list market Enabled
        /// non add markets.add(market);
        currentCodeMarket =market.code;
        _marketSelected = market;

        break;

      }
    }

    _marketSelected;
  }

  List<Market> getMarketsEnabled () {
    return markets;
  }
  List<Market> setMarketsEnabled (List<Market> markets) {
    //  products!=productsList;
    markets.clear();
    markets.addAll(markets);

    return markets;
  }

  List<Market> getMarketsAll () {
    return marketsList;
  }
  List<Market> setMarketsAll (List<Market> markets) {
    //  products!=productsList;
    marketsList.clear();
    marketsList.addAll(markets);

    return marketsList;
  }


  Map<String, Market> getMarketEnabledMap() {
    notifyListeners();
    return marketsEnabled;
  }

  Map<String, Market> getMarketAllMap() {
    notifyListeners();
    return marketsAll;
  }

  int get quantityMarketEnabled {
    notifyListeners();
    return markets.length;
  }

  int get quantityMarketAll {
    notifyListeners();
    return marketsList.length;
  }

  /// CLEAN MAP MARKET ENABLED
  void cleanMarketsEnableMap() {
    _marketsEnabled = {};
    notifyListeners();
  }

  /// CLEAN MAP MARKET ALL
  void cleanMarketsAllMap() {
    _marketsAll = {};
    notifyListeners();
  }

  /// REMOVED MARKET FROM MAP MARKET ENABLED BY ID
  void removedMarketEnabledByIdFromMap(String marketId) {
    _marketsEnabled.removeWhere((key, value) => value.id.toString() == marketId);
    notifyListeners();
  }
  /// REMOVED MARKET FROM MAP MARKET ALL BY ID
  void removedMarketAllByIdFromMap(String marketId) {
    _marketsEnabled.removeWhere((key, value) => value.id.toString() == marketId);
    notifyListeners();
  }


  /// DELETE MARKET ENABLED
  static void removeMarketEnableByMap(Market  marketItem) {
    _marketsEnabled.removeWhere((key, value) => value.code.toString() == marketItem.code);
  }

  /// DELETE MARKET ALL
  static void removeMarketAllByMap(Market  marketItem) {
    _marketsAll.removeWhere((key, value) => value.code.toString() == marketItem.code);
  }

  /// FIND MARKET ENABLED BY ID
  Market findMarketEnabledById(String id) {
    Market? market;
    _marketsEnabled.forEach((key, value) {
      if(key ==id ){
        market=value;
      }
    });
    return market!;
  }

  /// FIND MARKET ENABLED BY ID
  Market findMarketAllById(String id) {
    Market? market;
    _marketsAll.forEach((key, value) {
      if(key ==id ){
        market=value;
      }
    });
    return market!;
  }
  /// FIND MARKET ENABLED BY ID FROM LIST
  Market findByMarketEnableByCode(String code) {
    return markets.firstWhere((element) => element.code.toString() == code);
  }

  /// FIND MARKET ALL BY ID FROM LIST
  Market findByMarketAllByCode(String code) {
    return markets.firstWhere((element) => element.code.toString() == code);
  }

  // TODO
  bool isEnabledMarket(String id){
    final index = _market.indexWhere((element) => element.id.toString() == id.toString());
    return index>=0;

  }

  /// ADD NEW MARKET
  static  void addMarketItem(Market marketItem) {
    if (_marketsEnabled.containsKey(marketItem.code)) {
      updateMarketItem(marketItem);
    } else {
      _marketsEnabled.putIfAbsent(
        marketItem.code,
            () => Market(
          id: marketItem.id,
          name: marketItem.name,
          code: marketItem.code,
          salesOrg: marketItem.salesOrg,
          currency: marketItem.currency,
          currencySymbol: marketItem.currencySymbol,
          description: marketItem.description,
          dialCode: marketItem.dialCode ,
          flagUri: marketItem.flagUri ,
          percentage: marketItem.percentage ,
          percentageDiscount: marketItem.percentageDiscount ,
          quantityProducers: marketItem.quantityProducers ,
          quantityCustomers: marketItem.quantityCustomers ,
          quantityUser: marketItem.quantityUser ,
          companyCode: marketItem.companyCode ,
          companyName: marketItem.companyName ,
          companyEmail: marketItem.companyEmail ,
          companyTelephone: marketItem.companyTelephone ,
          isEnabledCompany: marketItem.isEnabledCompany==null? false : marketItem.isEnabledCompany ?? false,
          companyAddress: marketItem.companyAddress ,
          dateCreation: marketItem.dateCreation ,
          dateModified: marketItem.dateModified ,
          isSelectedMarket: marketItem.isSelectedMarket == null? false :marketItem.isSelectedMarket ?? false ,
          isShowMarket: marketItem.isShowMarket == null ? false: marketItem.isShowMarket?? false ,
          isShowCategory: marketItem.isShowCategory == null ? false :marketItem.isShowCategory?? false ,
          isVisibility: marketItem.isVisibility ==null? false :marketItem.isVisibility?? false ,
          isEnabled: marketItem.isEnabled == null? false : marketItem.isEnabled?? false,
          isIva: marketItem.isIva == null? false : marketItem.isIva?? false,
          isExchange: marketItem.isExchange == null? false : marketItem.isExchange?? false,
          isFavorite:marketItem.isFavorite == null? false : marketItem.isFavorite?? false,

        ),

      );
      ///  ObservableList
      ///_market.add(marketItem);
    }
  }


  /// UPDATE ITEM MARKET
  static  void updateMarketItem(Market marketItem) {
    if (_marketsEnabled.containsKey(marketItem.code)) {
      _marketsEnabled.update(
          marketItem.code,
              (existingCartItem) => Market(
            id: existingCartItem.id,
            name: existingCartItem.name,
            code: existingCartItem.code,
            salesOrg: existingCartItem.salesOrg,
            currency: existingCartItem.currency,
            currencySymbol: existingCartItem.currencySymbol,
            description: existingCartItem.description,
            dialCode: existingCartItem.dialCode ,
            flagUri: existingCartItem.flagUri ,
            quantity:existingCartItem.quantity,
            percentage: existingCartItem.percentage ,
            percentageDiscount: existingCartItem.percentageDiscount ,
            quantityProducers: existingCartItem.quantityProducers ,
            quantityCustomers: existingCartItem.quantityCustomers ,
            quantityUser: existingCartItem.quantityUser ,
            companyCode: existingCartItem.companyCode ,
            companyName: existingCartItem.companyName ,
            companyEmail: existingCartItem.companyEmail ,
            companyTelephone: existingCartItem.companyTelephone ,
            isEnabledCompany: existingCartItem.isEnabledCompany==null? false : existingCartItem.isEnabledCompany ?? false,
            companyAddress: existingCartItem.companyAddress ,
            dateCreation: existingCartItem.dateCreation ,
            dateModified: existingCartItem.dateModified ,
            isSelectedMarket: existingCartItem.isSelectedMarket == null? false :existingCartItem.isSelectedMarket ?? false ,
            isShowMarket: existingCartItem.isShowMarket == null ? false: existingCartItem.isShowMarket?? false ,
            isShowCategory: existingCartItem.isShowCategory == null ? false :existingCartItem.isShowCategory?? false ,
            isVisibility: existingCartItem.isVisibility ==null? false :existingCartItem.isVisibility?? false ,
            isEnabled: existingCartItem.isEnabled == null? false : existingCartItem.isEnabled?? false,
            isIva: existingCartItem.isIva == null? false : existingCartItem.isIva?? false,
            isExchange: existingCartItem.isExchange == null? false : existingCartItem.isExchange?? false,
            isFavorite:marketItem.isFavorite == null? false : marketItem.isFavorite?? false,

          )
      );
    }
    /// _market.add(marketItem);

  }

  /// TODO  DECREMENT ITEM MARKET QUANTITY
  static void decrementMarketItem(Market marketItem) {

    if (_marketsEnabled.containsKey(marketItem.code)) {
      _marketsEnabled.update(
          marketItem.code,
              (existingCartItem) => Market(
            id: existingCartItem.id,
            name: existingCartItem.name,
            code: existingCartItem.code,
            salesOrg: existingCartItem.salesOrg,
            currency: existingCartItem.currency,
            currencySymbol: existingCartItem.currencySymbol,
            description: existingCartItem.description,
            dialCode: existingCartItem.dialCode ,
            flagUri: existingCartItem.flagUri.toString() ,
            quantity:existingCartItem.quantity!.toInt() - 1 ,
            percentage: existingCartItem.percentage ,
            percentageDiscount: existingCartItem.percentageDiscount ,
            quantityProducers: existingCartItem.quantityProducers ,
            quantityCustomers: existingCartItem.quantityCustomers ,
            quantityUser: existingCartItem.quantityUser ,
            companyCode: existingCartItem.companyCode ,
            companyName: existingCartItem.companyName ,
            companyEmail: existingCartItem.companyEmail ,
            companyTelephone: existingCartItem.companyTelephone ,
            isEnabledCompany: existingCartItem.isEnabledCompany==null? false : existingCartItem.isEnabledCompany ?? false,
            companyAddress: existingCartItem.companyAddress ,
            dateCreation: existingCartItem.dateCreation ,
            dateModified: DateTime.now().toString(),
            isSelectedMarket: existingCartItem.isSelectedMarket == null? false :existingCartItem.isSelectedMarket ?? false ,
            isShowMarket: existingCartItem.isShowMarket == null ? false: existingCartItem.isShowMarket?? false ,
            isShowCategory: existingCartItem.isShowCategory == null ? false :existingCartItem.isShowCategory?? false ,
            isVisibility: existingCartItem.isVisibility ==null? false :existingCartItem.isVisibility?? false ,
            isEnabled: existingCartItem.isEnabled == null? false : existingCartItem.isEnabled?? false,
            isIva: existingCartItem.isIva == null? false : existingCartItem.isIva?? false,
            isExchange: existingCartItem.isExchange == null? false : existingCartItem.isExchange?? false,
            isFavorite:marketItem.isFavorite == null? false : marketItem.isFavorite?? false,

          )
      );
    }
    _market.add(marketItem);

  }


  /// UPDATE ITEM CART
  static  void incrementMarketItems(Market marketItem) {
    if (_marketsEnabled.containsKey(marketItem.code)) {
      _marketsEnabled.update(
          marketItem.code,
              (existingCartItem) => Market(
            id: existingCartItem.id,
            name: existingCartItem.name,
            code: existingCartItem.code,
            salesOrg: existingCartItem.salesOrg,
            currency: existingCartItem.currency,
            currencySymbol: existingCartItem.currencySymbol,
            description: existingCartItem.description,
            dialCode: existingCartItem.dialCode ,
            flagUri: existingCartItem.flagUri.toString() ,
            quantity:existingCartItem.quantity!.toInt() + 1 ,
            percentage: existingCartItem.percentage ,
            percentageDiscount: existingCartItem.percentageDiscount ,
            quantityProducers: existingCartItem.quantityProducers ,
            quantityCustomers: existingCartItem.quantityCustomers ,
            quantityUser: existingCartItem.quantityUser ,
            companyCode: existingCartItem.companyCode ,
            companyName: existingCartItem.companyName ,
            companyEmail: existingCartItem.companyEmail ,
            companyTelephone: existingCartItem.companyTelephone ,
            isEnabledCompany: existingCartItem.isEnabledCompany==null? false : existingCartItem.isEnabledCompany ?? false,
            companyAddress: existingCartItem.companyAddress ,
            dateCreation: existingCartItem.dateCreation ,
            dateModified: DateTime.now().toString(),
            isSelectedMarket: existingCartItem.isSelectedMarket == null? false :existingCartItem.isSelectedMarket ?? false ,
            isShowMarket: existingCartItem.isShowMarket == null ? false: existingCartItem.isShowMarket?? false ,
            isShowCategory: existingCartItem.isShowCategory == null ? false :existingCartItem.isShowCategory?? false ,
            isVisibility: existingCartItem.isVisibility ==null? false :existingCartItem.isVisibility?? false ,
            isEnabled: existingCartItem.isEnabled == null? false : existingCartItem.isEnabled?? false,
            isIva: existingCartItem.isIva == null? false : existingCartItem.isIva?? false,
            isExchange: existingCartItem.isExchange == null? false : existingCartItem.isExchange?? false,
            isFavorite:marketItem.isFavorite == null? false : marketItem.isFavorite?? false,

          )
      );
    }
    ///notifyListeners();
  }



  static void removeSharedPrefRepository(String id) {
    final index =
    _market.indexWhere((it) =>  it.id.toString() == id.toString());

    if (index >= 0) {
      _market.removeAt(index);
      _market =
          ObservableList.of([..._market]);
    }

    _marketRepository.saveCartToRepository(
        _market.map((it) => it.id.toString()).toList());
  }
  ///--------------------------------GETTER AND SETTING

  Map<String, Market> get marketsAll => _marketsAll;

  set marketsAll(Map<String, Market> value) {
    _marketsAll = value;
  }

  Map<String, Market> get marketsEnabled => _marketsEnabled;

  set marketsEnabled(Map<String, Market> value) {
    _marketsEnabled = value;
  }


  /// ------------------------------------------------------------------------

  String get currentCodeLanguage => _currentCodeLanguage!;

  set currentCodeLanguage(String value) {
    _currentCodeLanguage = value;
  }


  Market get marketSelected => _marketSelected!;

  set marketSelected(Market value) {
    _marketSelected = value;
  }
  bool get isInitialLoadMarket => _isInitialLoadMarket;

  set isInitialLoadMarket(bool value) {
    _isInitialLoadMarket = value;
  }

  List<Market> get markets => _markets;

  set markets(List<Market> value) {
    _markets = value;
  }

  List<Market> get marketsList => _marketsList;

  set marketsList(List<Market> value) {
    _marketsList = value;
  }

  Map<String, Product> get productItems => _productItems;

  set productItems(Map<String, Product> value) {
    _productItems = value;
  }
}
