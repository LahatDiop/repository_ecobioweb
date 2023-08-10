   
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