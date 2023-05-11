

import 'dart:convert';

import 'package:ecobioweb/auth/models/term_of_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:postgres/postgres.dart';
import '../../../users/models/user_settings.dart';
import '../../../users/models/users_data.dart';
import '../../models/constants.dart';
import '../../models/login_user_type.dart';
import '../../models/user_form_field.dart';
import '../../providers/auth.dart';
import '../../providers/flutter_login.dart';
import '../../singup/models/signup_data.dart';
import '../../singup/widgets/app_singup.dart';
import 'login_data.dart';


//import 'package:flutter/rendering.dart';

class AppSignIn extends StatefulWidget {
  const AppSignIn({Key? key}) : super(key: key);

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  @override
  _AppSignInState createState() => _AppSignInState();
}

class _AppSignInState extends State<AppSignIn> {
  String email = 'lahat@gmail.com';
  String password = '123';
  bool showSpinner = false;

  get tableUser => "users";

/*final _auth = FirebaseAuth.instance;
  final databaseRef = FirebaseDatabase.instance.reference();
  final Future<FirebaseApp> _future = Firebase.initializeApp();
*/

//https://www.oneclickitsolution.com/blog/integrate-postgres-database-connection-in-flutter/
// CONNECTION POSTGRESQL
  var databaseConnection = PostgreSQLConnection("localhost", 5432, "ecobio",
      username: "postgres",
      password: "root",
      queryTimeoutInSeconds: 3600,
      timeoutInSeconds: 3600);

  initDatabaseConnection() async {
    databaseConnection.open().then((value) {
      debugPrint("Database Connected!");
    });
  }

  //late LoginData loginData;
   late UserDataSettings userData;

  //await connect.open();

  @override
  Widget build11(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
      // appBar: buildAppBar(context),
      body: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: InkWell(
                child: Container(
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.close),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 130,
                    height: 130,
                    alignment: Alignment.center,
                    child: Image.asset("../assets/images/ic_app_icon.png"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.phone,
                        color: const Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: const Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: const Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "Phone Number",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextField(
                    showCursor: true,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: const Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: const Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: const Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: const Color(0xFF666666),
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                      ),
                      hintText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: const Color(0xFF666666),
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: double.infinity,
                   // child: RaisedButton(
                        child: ElevatedButton(
                    //  padding: const EdgeInsets.all(17.0),
                      onPressed: () {
                        //loginData.toString().= "lahat.diop@gmail.com";
                        // LoginSinIn();
                        //_loginUser(loginData.toString());
                        // _signupUser();
                        onLogin:
                        (loginData) {
                          debugPrint('Login info');
                          debugPrint('Name: ${loginData.name}');
                          debugPrint('Password: ${loginData.password}');
                          return _loginUser(loginData);
                        };
                      },

                      /*
                                                ---> Login without firebase
                            onPressed: () async {
                              setState(() {
                                showSpinner = true;
                              });
                              try {
                                final newUser =
                                    await _auth.createUserWithEmailAndPassword(
                                        email: email, password: password);
                                Navigator.pushNamed(context, 'home_screen');
                              } catch (e) {
                                print(e);
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            },
                                                 */

                      child: const Text(
                        "Sign In AppSignIn Page",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins-Medium.ttf',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    //  color: const Color.fromARGB(255, 75, 233, 102),
                   /*   shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: const BorderSide(
                              color: Color.fromARGB(255, 121, 238, 111)
                              )
                              ),
                              */
                    ),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFF2F3F7)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: const Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AppSingUp()),
                        )
                      },
                      child: Container(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: const Color(0xFFAC252B),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Constants.appName,
      logo: const AssetImage('../assets/images/ecorp.png'),
      logoTag: Constants.logoTag,
      titleTag: Constants.titleTag,
      navigateBackAfterRecovery: true,
      onConfirmRecover: _signupConfirm,
      onConfirmSignup: _signupConfirm,
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
            text: 'Newsletter subscription'),
        TermOfService(
            id: 'general-term',
            mandatory: true,
            text: 'Term of services',
            linkUrl: 'https://github.com/NearHuscarl/flutter_login'),
      ],

      /// SECONDE FASE PER LA REGISTRAZIONE NAME COGNOME TELEFONO ...

      additionalSignupFields: [
        const UserFormField(
            keyName: 'Username', icon: Icon(FontAwesomeIcons.userAlt)),
        const UserFormField(keyName: 'Name'),
        const UserFormField(keyName: 'Surname'),
        UserFormField(
          keyName: 'phone_number',
          displayName: 'Phone Number',
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

      /// VERIFICA VALDATOR SE EMAIL CONTIENE @ ED .COM
      userValidator: (value) {
        if (!value!.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with '.com'";
        }
        return null;
      },

      /// CONTROLLO SI IL PASSWORD E VALIDA
      passwordValidator: (value) {
        if (value!.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },

      /// LOGIN USER PASSWORD DE APP
      onLogin: (signupData) {
        debugPrint('Login info');
        debugPrint('Name: ${signupData.name}');
        debugPrint('Password: ${signupData.password}');
        return _loginUser(signupData);
      },
      //-----> Registrazione nell app con username password
      /// REGISTER CON USER PASSWORD NOME COGNOME TERMAPRAVACY ADDITIONAL INFO...
      onSignup: (signupData) async {
        debugPrint('Signup info');
        debugPrint('Name: ${signupData.name}');
        debugPrint('Password: ${signupData.password}');

        signupData.additionalSignupData?.forEach((key, value) {
          debugPrint('$key: $value');
        });
        if (signupData.termsOfService.isNotEmpty) {
          debugPrint('Terms of service: ');
          for (var element in signupData.termsOfService) {
            debugPrint(
                ' - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
          }
        }

        //  Save data registration in database
        /*    final String? name;
            final String? password;
            final List<TermOfServiceResult> termsOfService;
            final Map<String, String>? additionalSignupData;*/

        //List<String> tags = [
         // '$signupData.name',
        //  '$signupData.password',
       //   '$signupData.additionalSignupData'
       // ];

        //  String jsonTags = jsonEncode(tags.toList());

        // SignupData json1 = SignupData.fromJson(json);

        //   String dataRegisterJson1 = jsonEncode(json1.toString());

        /*SignupData dataRegister = SignupData.fromSignupForm(
            name: signupData.name,
            password: signupData.password,
            additionalSignupData: signupData.additionalSignupData,
            termsOfService: signupData.termsOfService);
        String dataRegisterJson = jsonEncode(dataRegister.toString());
        */

        //  List<Map<String, Map<String, dynamic>>> result =
        // await databaseConnection.mappedResultsQuery("SELECT id, data_json	FROM public.user_date;");
        //ic.user_date(id, data_json)VALUES (1, '$dataRegisterJson');",
        // _savedDataRegister(signupData);

        //saveDataRegist(signupData);

        // Info registration nome cognome telefono  termOf Service :SignupData
      //  return _signupUser(signupData);
       // return _signupUser(UserData(id: id, name: name, email: email, password: password, phone: phone, aboutMeDescription: aboutMeDescription, image: image));
      },
      // onSubmitAnimationCompleted: () {
      //   Navigator.of(context).pushReplacement(FadePageRoute(
      //     builder: (context) => const DashboardScreen(),
      //   ));
      // },

      /// RECUPEATION PASSWORD PAR EMAIL
      onRecoverPassword: (name) async {
        debugPrint('Recover password info');
        debugPrint('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
      showDebugButtons: true,
    );
  }

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  Future<String?> _signupUser(SignupData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  //https://www.oneclickitsolution.com/blog/integrate-postgres-database-connection-in-flutter/

  //Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);
  // Controllo user password nel file json
  Future<String?> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!userData.mockUsers.containsKey(data.name)) {
        return 'User not exists';
      }
      if (userData.mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!userData.mockUsers.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }

  Future<String?> _signupConfirm(String error, LoginData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<void> LoginSinIn() async {
    List<Map<String, Map<String, dynamic>>> result = await databaseConnection
        .mappedResultsQuery(
            "SELECT * FROM $tableUser WHERE email = 'lahat@gmail.com'",
            substitutionValues: {
          "lahat@gmail.com": email,
        });

    if (result.length == 1) {
      for (var element in result) {
        var _user = element.values.toList();
        UserData users = UserData.fromJson(_user[0]);
      }
    }
  }

  Future<void> _savedDataRegister(signupData) async {
    // ignore: non_constant_identifier_names

    List<String> tags = [
      signupData.name,
      signupData.password,
      signupData.additionalSignupData
    ];
    String jsonTags = jsonEncode(tags);

    Map<String, dynamic> dataRegister = SignupData.fromSignupForm(
        name: signupData.name,
        password: signupData.password,
        additionalSignupData: signupData.additionalSignupData,
        termsOfService: signupData.termsOfService) as Map<String, dynamic>;
    String dataRegisterJson = jsonEncode(dataRegister);

    List<Map<String, Map<String, dynamic>>> result =
        await databaseConnection.mappedResultsQuery(
      "INSERT INTO public.user_date(id, data_json)VALUES (1, '$dataRegisterJson');",
    );

    if (result.length == 1) {
      for (var element in result) {
        var _user = element.values.toList();
        UserData users = UserData.fromJson(_user[0]);
      }
    }
  }

  // Future<void> saveDataRegist(SignupData signupData) async {
  //    SignupData userData = SignupData.fromJson({
  //     'signupData': {
  //       'name': signupData.name,
  //       'password': signupData.password,
  //       'additionalSignupData': signupData.additionalSignupData,
  //       'termsOfService': signupData.termsOfService,
  //     }
  //   });
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   bool result = await prefs.setString('userData', jsonEncode(signupData));
  //   // ignore: avoid_print
  //   print(result);
  // }
}

// class Constants {
//   static const String appName = 'ECOBIO';
//   static const String logoTag = 'near.huscarl.loginsample.logo';
//   static const String titleTag = 'near.huscarl.loginsample.title';
// }

//import 'package:flutter_ecommerce_app/components/AppSingUp.dart';

//import 'package:firebase_core/firebase_core.dart';


