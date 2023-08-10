   




OK QUERY Map :
await connection.execute('INSERT INTO $table (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})', substitutionValues:data);

OK QUERY Object :
await connection.query('insert into public.register (id, email,password, additionalSignupData, termsOfService) values(@idValue, @emailValue, @passwordValue, @additionalSignupDataValue,@termsOfServiceValue)',
        substitutionValues: {
        'idValue': 2,
        'emailValue': userData.name,
        'passwordValue': userData.password,
        'additionalSignupDataValue': userData.additionalSignupData,
        'termsOfServiceValue':jsonEncode(userData.termsOfService.toString()),
        //'fNameValue': fName,
        // 'lNameValue': lName,
        //  'statusValue': true,
        // 'roleValue': 'ROLE_BUYER',
        // 'authValue': 'buyer',
        //  'registrationValue': DateTime.now(),
        });
--------------------------------------------------------------------------------------------------------
///  OK List<TermOfServiceResult>  termsOfService; insert to json DB

    List<String> allTermOfService=<String>[];
    for (var element in userData.termsOfService) {
      allTermOfService.add(' Terms of service: - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');      
      debugPrint( 'Terms of service: - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
    }      
        _String termsOfService= jsonEncode(allTermOfService);
        await connection.transaction((ctx) async {
        var result = await ctx.query("SELECT id FROM public.register");
        // await ctx.query("INSERT INTO table (id) VALUES (@a:int4)", substitutionValues: {
        await ctx.query('insert into public.register values(@idValue, @emailValue, @passwordValue, @additionalSignupDataValue,@termsOfServiceValue)', substitutionValues: {
        "idValue" : result.last[0] + 1,
        'emailValue': userData.name,
        'passwordValue': userData.password,
        'additionalSignupDataValue': userData.additionalSignupData,
        'termsOfServiceValue':termsOfService,
        });
        });_

--------------------------------------------------------------------------------------------------------

/// get ID 
    await connection.transaction((ctx) async {
      var result = await ctx.query("SELECT id FROM public.register");
      id =result.last[0] + 1;
    });
-------------------------------------------------------------------------------------------

    /// Map TO => JSON
    Map<String, dynamic> dataToJsonMap = userData.toJsonMap();
    Map<String, dynamic> dataToJson = userData.toJson();
    
    /// OBJECT TO => JSON
    UserData userDataFromJson = UserData.fromJson(dataToJsonMap);
---------------------------------------------------------------------------