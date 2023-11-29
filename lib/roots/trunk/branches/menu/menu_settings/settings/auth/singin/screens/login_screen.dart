import 'dart:convert';
import 'package:ecobioweb/shopping/screens/shopping_cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:postgres/postgres.dart';
import '../../../../../../commun_data_utils/utils/constants/app_constants.dart';
import '../../../../../../commun_data_utils/utils/theme/green/app_colors_green.dart';
import '../../../../../../managements/users/models/user_settings.dart';
import '../../../../../../managements/users/models/users_data.dart';
import '../../../localisation/translation/components/appLocalizations.dart';
import '../../models/login_user_type.dart';
import '../../models/term_of_service.dart';
import '../../models/user_form_field.dart';
import '../../providers/auth.dart';
import '../../providers/flutter_login.dart';
import 'package:ecobioweb/session/session_user.dart';
import '../../singup/models/signup_data.dart';
import '../models/login_data.dart';
import '../widgets/custom_route.dart';


class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  List<String> allTermOfService=<String>[];

  int? id;
  String? emailList ;
  bool userIsregister=false;

  LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

   UserDataSettings userDataSettings = UserDataSettings();

  PostgreSQLConnection connection = PostgreSQLConnection("localhost", 5432, "ecobio",
     username: "postgres",
     password: "root",
     queryTimeoutInSeconds: 3600,
     timeoutInSeconds: 3600,
   );


 // await connection.open();
 // late Users users;

  /// Controllo se passeword coincide
  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');


    return Future.delayed(loginTime).then((_) {
      if (!userDataSettings.mockUsers.containsKey(data.name)) {
        return 'User not exists';
      }
      if (userDataSettings.mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  /// REGISTRATION DATA SIGNUPDATA
  Future<String?> _signupUser2(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  /// REGISTRATION DATA USERSDATA
  Future<String?> _signupUser(UserData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }
// /// RECOVERY PASSWORD
//   Future<String?> _recoverPassword(String name) {
//     return Future.delayed(loginTime).then((_) {
//       if (!userDataSettings.mockUsers.containsKey(name)) {
//         return 'User not exists';
//       }
//       return null;
//     });
//   }

  /// RECOVERY PASSWORD
  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!userDataSettings.mockUsers.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }


  /// CONTROLLO CONFIRMATION PASSWORD
  Future<String?> _signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        title: Text(AppLocalizations.translate("back").toString()),
    // leading: const BackButton(color: Colors.black),
       //backgroundColor: const Color.fromARGB(255, 50, 172, 34),
        backgroundColor: const AppColorsGreen().backgrounGreendApp,
    ),
    body: Center(
        child: FlutterLogin(

          title: AppConstants.appName,
         logo: const AssetImage('assets/images/verdure/zucca_3.png'),
        //  logo: const AssetImage('/images/verdure/zucca_3.png'),
          logoTag: AppConstants.logoTag,
          titleTag: AppConstants.titleTag,
          navigateBackAfterRecovery: true,
          onConfirmRecover: _signupConfirm,
          onConfirmSignup: _signupConfirm,
          //theme: AppColorsGreen().backgrounGreendApp.green,
          loginAfterSignUp: false,
          loginProviders: [
            LoginProvider(
              button: Buttons.linkedIn,
              label: 'Sign in with LinkedIn',
              callback: () async {
                return null;
              },
              providerNeedsSignUpCallback: () {
                // put here your logic to conditionally show the additional fields
                return Future.value(true);
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.google,
              label: 'Google',
              callback: () async {
                return null;
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.facebook,
              label: 'Facebook',
              callback: () async {
                debugPrint('start facebook sign in');
                await Future.delayed(loginTime);
                debugPrint('stop facebook sign in');
                return null;
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.githubAlt,
              callback: () async {
                debugPrint('start github sign in');
                await Future.delayed(loginTime);
                debugPrint('stop github sign in');
                return null;
              },
            ),
          ],
          termsOfService: [
            TermOfService(
                id: 'newsletter',
                mandatory: false,
                text: 'Newsletter Subscription'),
            TermOfService(
                id: 'general-term',
                mandatory: true,
                text: 'Term of services',
                linkUrl: 'https://github.com/NearHuscarl/flutter_login'),
          ],
          additionalSignupFields: [
            const UserFormField(
                keyName: 'User', icon: Icon(FontAwesomeIcons.userAlt)),
            const UserFormField(keyName: 'Prenom'),
            const UserFormField(keyName: 'Nom'),
            const UserFormField(keyName: 'Adresse'),
            UserFormField(
              keyName: 'phone_number',
              displayName: 'Telefone',
              userType: LoginUserType.phone,
              fieldValidator: (value) {
                var phoneRegExp = RegExp(
                    '^(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]?\\d{3}[\\s.-]?\\d{4}\$');
                if (value != null &&
                    value.length < 7 &&
                    !phoneRegExp.hasMatch(value)) {
                  return "This isn't a valid phone number";
                }
                return null;
              },
            ),
          ],
          initialAuthMode: AuthMode.login,

          // Controllo se il formato email è corretto
          userValidator: (value) {
            // if (!value!.contains('@') || !value.endsWith('.com')) {
            if (!value!.contains('@')) {
              return "Email must contain '@' and end with '.com'";
            }else if (value.contains('@')){          // Check email DB

              checkEmail(connection,value,userIsregister);
            }
            return null;
          },
          // controlle password
          passwordValidator: (value) {
            if (value!.isEmpty) {
              return 'Password is empty';
            }
            return null;
          },
          /// Login USER EMAIL PASSWORD CHECK USERS
          onLogin: (userData) {
            debugPrint('Login info');
            debugPrint('Name: ${userData.name}');
            debugPrint('Password: ${userData.password}');
            return _authUser(userData);
          },
          ///REGISTRATION
          onSignup: (userData) {
            debugPrint('Signup info');
            debugPrint('Name: ${userData.name}');
            debugPrint('Password: ${userData.password}');

            userData.additionalSignupData?.forEach((key, value) {
              debugPrint('$key: $value');
            });
            if (userData.termsOfService.isNotEmpty) {
              debugPrint('Terms of service: ');
              for (var element in userData.termsOfService) {
                debugPrint( ' - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
              }
            }

            // SAVED DATA USER
            saveDataUserSingup(userData, connection);
          
            return _signupUser(userData);
          },
          onSubmitAnimationCompleted: () {
            Navigator.of(context).pushReplacement(FadePageRoute(
              builder: (context) => ShoppingCartScreen(),
              //builder: (context) => const DashboardScreen(),
            ));
          },
          onRecoverPassword: (name) {
            debugPrint('Recover password info');
            debugPrint('Name: $name');
            return _recoverPassword(name);
            // Show new password dialog
          },
          showDebugButtons: true,
           )

    )

    );

  }


  Future<void> saveDataUserSingup(UserData userData,PostgreSQLConnection connection ) async {

   // PostgreSQLConnection connection = PostgreSQLConnection("localhost", 5432, "ecobio",
   //    username: "postgres",
   //    password: "root",
   //    queryTimeoutInSeconds: 3600,
   //    timeoutInSeconds: 3600,
   //  );
   // connection.open().then((value) {
   //   debugPrint("Database Connected!");
   // });
    // await connection.open();
    // debugPrint("Database Connected Yes!");

   //  ConnectionPostgresSql conn = ConnectionPostgresSql();
   //  PostgreSQLConnection connection = conn.createState().connection;
   // connection.open();
   //
   //  initDatabaseConnection() async {
   //    connection.open().then((value) {
   //      debugPrint("Database Connected!");
   //    });
   //  }

   // String $table="ecobio.public.users_singup ";
    //String $table="ecobio.public.data_user";
    var $table="ecobio.public.register";

    await connection.transaction((ctx) async {
      var result = await ctx.query("SELECT id,email FROM public.register");
      id =result.last[0] + 1;
      emailList = result.toList().toString();

    });


    for (var element in userData.termsOfService) {
      allTermOfService.add(' Terms of service: - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
      debugPrint( 'Terms of service: - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
    }

    userData.additionalSignupData?.forEach((key, value) {
      debugPrint('$key: $value');
      if(key.isNotEmpty && key=="phone_number"){
        userData.phone= value;
      }
    });
   //non var termsOfService= [jsonEncode(allTermOfService)];
    var termsOfService= jsonEncode(allTermOfService);



    Map<String, dynamic> dataToMap = <String, dynamic>{
      "id": id.toString(),
      "email": userData.name,
      "password": userData.password,
      "additionalSignupData": userData.additionalSignupData,
      "termsOfService": termsOfService,
      "phone":  userData.phone,

     /// TODO add into the Table register
     // "aboutMeDescription": userData.aboutMeDescription,
      //"image": userData.image,

    };

    userData.id=id.toString();
    /// Map TO => JSON
    //Map<String, dynamic> dataToJsonMap = userData.toJsonMap();
   // Map<String, dynamic> dataToJson = userData.toJson();
    // Map<String, dynamic> dataToJsonUserData = userData.toJsonUserData();

    /// OBJECT TO => JSON
   // UserData userDataFromJson = UserData.fromJson(dataToJsonMap);

    /// IMPLEMENTATION SESSION USERDATA REGISTER

    // await SessionManager().set("dataToMap", jsonEncode(dataToMap));
    //  Map token = await SessionManager().get("dataToMap");

          await SessionUser().set("dataToMap", jsonEncode(dataToMap));
        Map token = await SessionUser().get("dataToMap");



    // UserData copyUserData = userData.copy()
    await setDataUser(connection,userData, $table,termsOfService, dataToMap);
    // await updateData(connection, table, dataToMap);
    // await removedData(connection, $table, dataToMap);
    // await getDataList(connection, $table, dataToMap);
    //await setData(connection, $table, data);
    // await connection.close();



  }
  Future<void> setDataUser(PostgreSQLConnection connection, UserData userData,String table,String termsOfService, Map<String, dynamic> data) async {

    //connection.open();
    debugPrint('data.keys${data.keys}');
    debugPrint('data.keys.map(${data.keys.map((k) => '@$k').join(', ')})');

    debugPrint('data : $data');

    await connection.execute('INSERT INTO $table (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})', substitutionValues:data);

///OK
    //  for (var element in userData.termsOfService) {
    //    allTermOfService.add(' Terms of service: - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
    //    debugPrint( 'Terms of service: - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
    //  }
    // String termsOfService= jsonEncode(allTermOfService);

    /// ID OK
    // await connection.transaction((ctx) async {
    //   var result = await ctx.query("SELECT id FROM public.register");
    //  // await ctx.query("INSERT INTO table (id) VALUES (@a:int4)", substitutionValues: {
    //   await ctx.query('insert into public.register values(@idValue, @emailValue, @passwordValue, @additionalSignupDataValue,@termsOfServiceValue)', substitutionValues: {
    //     "idValue" : result.last[0] + 1,
    //     'emailValue': userData.name,
    //     'passwordValue': userData.password,
    //     'additionalSignupDataValue': userData.additionalSignupData,
    //     'termsOfServiceValue':termsOfService,
    //   });
    // });

///OK
    // await connection.query('insert into public.register (id, email,password, additionalSignupData, termsOfService) values(@idValue, @emailValue, @passwordValue, @additionalSignupDataValue,@termsOfServiceValue)',
    //     substitutionValues: {
    //     'idValue': 2,
    //     'emailValue': userData.name,
    //     'passwordValue': userData.password,
    //     'additionalSignupDataValue': userData.additionalSignupData,
    //     'termsOfServiceValue':jsonEncode(userData.termsOfService.toString()),
    //     //'fNameValue': fName,
    //     // 'lNameValue': lName,
    //     //  'statusValue': true,
    //     // 'roleValue': 'ROLE_BUYER',
    //     // 'authValue': 'buyer',
    //     //  'registrationValue': DateTime.now(),
    //     });

    //registerBuyer(connection,userData);

  //  await connection.execute('INSERT INTO $table VALUES (${data.keys.map((k) => '@$k').join(', ')})', substitutionValues:data);

 //   await connection.execute('INSERT INTO $table (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})', substitutionValues:data);
    //  OK  await connection.execute('INSERT INTO $table (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})', substitutionValues:data);
    // await connection.transaction((ctx) async {
    //   var result = await ctx.query("SELECT id FROM $table");
    //   await ctx.query("INSERT INTO $table VALUES ${data.keys.map((k) => '@$k').join(', ')})", substitutionValues: {
    //     "k" : result.last[0] + 1
    //   });
    // });




  // await connection.execute('INSERT INTO $table (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})', substitutionValues:data);

    //await connection.execute('INSERT INTO  public.users_singup (id, name, password, "termsOfService", "additionalSignupData") VALUES (5, '"modou@gmail.com"', '"123"', '"testJson"', '"json2"')');

    // INSERT INTO public.users_singup(
    //     id, name, password, "termsOfService", "additionalSignupData")
    // VALUES (4, 'testquesry', 'test@gmail.com', '"ff"', '"yyy"');



  }

  Map<String, dynamic> toJsonConvert(dataToMap) => {
    'name': dataToMap.toString(),
  };

  Future<String> registerBuyer(PostgreSQLConnection connection , UserData userData) async {

    connection.open();
    PostgreSQLResult? sellerAlreadyRegistered, buyerAlreadyRegistered;
    PostgreSQLResult? newSellerRegisterResult, newBuyerRegisterResult;

    String newBuyerFuture = '';

    String futureBuyer = '';




    try {
      await connection.transaction((newBuyerConn) async {
       // await connection.open();

        var result = await newBuyerConn.query("SELECT id FROM public.register");

          // 'insert into myAppData.register (emailDB,passDB,fNameDB,lNameDB,statusDB,roleDB,authDB,registerDateDB)'
          // 'values(@emailValue,@passwordValue,@fNameValue,@lNameValue,@statusValue,@roleValue,@authValue,@registrationValue)',
          newBuyerRegisterResult = await connection.query('insert into public.register (email,password) values(@emailValue,@passwordValue)',
            substitutionValues: {
              'emailValue': userData.email,
              'passwordValue': userData.password,
              //'fNameValue': fName,
              // 'lNameValue': lName,
              //  'statusValue': true,
              // 'roleValue': 'ROLE_BUYER',
              // 'authValue': 'buyer',
              //  'registrationValue': DateTime.now(),
            },
            allowReuse: true,
            timeoutInSeconds: 30,
          );
          newBuyerFuture =
          (newBuyerRegisterResult!.affectedRowCount > 0 ? 'reg' : 'nop');

      });
    } catch (exc) {
      exc.toString();
      newBuyerFuture = 'exc';
    }
    return newBuyerFuture;
  }


  // Future<String> registerBuyer(String email, String password, String fName, String lName,) async {
  Future<String> registerBuyer2(PostgreSQLConnection connection , UserData userData) async {

    connection.open();
    PostgreSQLResult? sellerAlreadyRegistered, buyerAlreadyRegistered;
    PostgreSQLResult? newSellerRegisterResult, newBuyerRegisterResult;

    String newBuyerFuture = '';

    String futureBuyer = '';

    try {
      await connection.transaction((newBuyerConn) async {
        await connection.open();
        buyerAlreadyRegistered = await newBuyerConn.query(
          'select * from public.register where email = @email order by idDB',
          substitutionValues: {'emailValue': userData.email},
          allowReuse: true,
          timeoutInSeconds: 30,
        );
        if (buyerAlreadyRegistered!.affectedRowCount > 0) {
          newBuyerFuture = 'alr';
        } else {
          // 'insert into myAppData.register (emailDB,passDB,fNameDB,lNameDB,statusDB,roleDB,authDB,registerDateDB)'
          // 'values(@emailValue,@passwordValue,@fNameValue,@lNameValue,@statusValue,@roleValue,@authValue,@registrationValue)',
          newBuyerRegisterResult = await newBuyerConn.query(
            'insert into public.register (email,password)'
                'values(@emailValue,@passwordValue)',
            substitutionValues: {
              'emailValue': userData.email,
              'passwordValue': userData.password,
              //'fNameValue': fName,
              // 'lNameValue': lName,
              //  'statusValue': true,
              // 'roleValue': 'ROLE_BUYER',
              // 'authValue': 'buyer',
              //  'registrationValue': DateTime.now(),
            },
            allowReuse: true,
            timeoutInSeconds: 30,
          );
          newBuyerFuture =
          (newBuyerRegisterResult!.affectedRowCount > 0 ? 'reg' : 'nop');
        }
      });
    } catch (exc) {
      exc.toString();
      newBuyerFuture = 'exc';
    }
    return newBuyerFuture;
  }

  void checkEmail(PostgreSQLConnection connection, var value,bool userIsRegister) {

    connection.open();

   connection.transaction((ctx) async {
      var result = await ctx.query("SELECT id,email FROM public.register");
      if(result.isNotEmpty){
        id =result.last[0] + 1;
        emailList = result.toList().toString();
      }

      if(emailList!.contains(value)){
        return "Email : '$value' già registrato";
      }else {
        return null;
      }

    });

  }



}
