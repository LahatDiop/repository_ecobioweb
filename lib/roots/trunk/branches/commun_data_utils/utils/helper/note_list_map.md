   
   ///   GET DATA MAP
1- List<Map> jsonList = countriesEnglish;
   1-  List<Map> codeContrieJsonList =CodeContry().codeCountriesEnglish;

/// CUSTOME LIST FROM MAP
  2- List<Map> jsonList = countriesEnglish;

    List elements = jsonList.map((s) => CountryCode(
              name: s['name'],
              code: s['code'],
              dialCode: s['dial_code'],
              flagUri: 'assert/images/flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

3-  CYCLE THE LIST 
for (int i = 0; i < elements.length; i++) {
String codeCountry = elements[i].code;

      if (languageLocal == codeCountry.toLowerCase()) {
        codeDefaultCountry = elements[i].dialCode;
      }

---------------------------------------------------------

//For removing specific item from a list with the attribute value
replytile.removeWhere((item) => item.id == '001')

//Remove item by specifying the position of the item in the list
replytile.removeAt(2)

//Remove last item from the list
replytile.removeLast()

//Remove a range of items from the list
replytile.removeRange(2,5)

-----------------
LIST FROM MAP EXEMPLE

    /// ///ok  Add List<AdminItems> from dataMap
    Map<String, List<dynamic>> getListItemsFromDataMap = dataMap.map( (key, value) => MapEntry(key, List.castFrom(value)));

          getListItemsFromDataMap.forEach((key, value) {
            items.addAll(AdminItems.fromJsonList(value));
          });

List<NetworkOption> networkOptions = response.data['data']['networks'].map<NetworkOption>((x) => NetworkOption.fromJson(x)).toList();

----

    Map<String, String> stringQueryParameters =dataMap.map((key, value) => MapEntry(key, value!.toString()));

    stringQueryParameters.forEach((key, value) {}