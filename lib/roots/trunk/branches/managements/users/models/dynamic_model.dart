// import 'package:dynamicform_differentfields/Model/dynamic_form_validator.dart';
// import '../Enum/formtype.dart';
import 'dart:collection';

import 'package:ecobioweb/market/components/market.dart';
import 'package:ecobioweb/market/providers/market_provider.dart';
import 'package:ecobioweb/roots/trunk/branches/languages/components/language.dart';
import 'package:ecobioweb/roots/trunk/branches/localisation/country/components/code_country.dart';
import 'package:ecobioweb/roots/trunk/branches/managements/Roles/models/role.dart';

import '../../../menu/menu_settings/settings/auth/models/term_of_service.dart';
import '../Enum/formtype.dart';
import 'dynamic_form_validator.dart';
import 'item_model.dart';

class DynamicModel {
  String controlName;
  String? hintText;
  String value='';
  FormType formType;

  /// Countries
  //This items property used in dropdown or autocomplete widgets.
  // List<ItemModel> items;  // ItemModel? selectedItem;
  List<CountryCode> itemsCountries;
  CountryCode? selectedItem;
  Market? selectedItemMarket;

  ///Roles
  List<Role> roles;
  List<String>? rolesItems;

  List<String> marketsEnabled=[];

  // MarketProvider marketProvider=MarketProvider();
  // var kkk      = marketProvider.markets;

  ///List bool enabled
  //  List<String>? switchRollingList;
  List<String> switchRollingEnabledList=[];

  /// Roles Selected List
  List<dynamic>? selectedRolesItems;

  ///  Selected List
  List<dynamic>? selectedMarketsEnabled;

  ///Markets
  List<Market> markets;
  Market? marketSelected;

  /// Languages
  List<Language> languages;
  Language? languageSelected;
  Language? languageDefault;

  ///TermOfServiceResult
  List<TermOfServiceResult>?  termsOfService;

  bool isRequired;
  List<DynamicFormValidator> validators;

  DynamicModel(
      this.controlName,
      this.formType,
      {

      this.hintText,
      this.value='',
      this.itemsCountries =const[],
      this.selectedItem,
      this.roles =const[],
      this.rolesItems=const[],
      this.marketsEnabled=const[],
      this.selectedRolesItems= const[],
      this.selectedMarketsEnabled=const[],
      this.markets= const[],
      this.marketSelected,
      this.languages= const[],
      this.languageSelected,
      this.languageDefault,
      this.termsOfService= const[],
      this.isRequired=false,
      this.validators =const[],
});

// DynamicModel(
  //     this.controlName,
  //     this.formType,
  //     {
  //     this.value = '',
  //     this.hintText,
  //     // this.items = const [],
  //     this.itemsCountries= const[],
  //     this.selectedItem,
  //     this.isRequired = false,
  //     this.validators = const []}
  //     );
}
