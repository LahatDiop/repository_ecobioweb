import 'dart:convert';

import 'package:ecobioweb/users/models/user_settings.dart';
import 'package:ecobioweb/users/models/users_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:postgres/postgres.dart';

import '../../../dashboard/dashboard_screen.dart';
import '../../models/constants.dart';
import '../../models/login_user_type.dart';
import '../../models/term_of_service.dart';
import '../../models/user_form_field.dart';
import '../../providers/auth.dart';
import '../../providers/flutter_login.dart';


import '../models/login_data.dart';
import '../widgets/custom_route.dart';


class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  LoginScreen({Key? key}) : super(key: key);

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  late UserDataSettings userDataSettings;
  // late Users users;

  // Controllo se passeword coincide
  Future<String?> _loginUser(LoginData data) {
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

  Future<String?> _signupUser(UserData data) {
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((_) {
      if (!userDataSettings.mockUsers.containsKey(name)) {
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

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Constants.appName,
      logo: const AssetImage('assets/images/verdure/zucca_3.png'),
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
      // Login User controle donnes user ggggg
      onLogin: (signupData) {
        debugPrint('Login info');
        debugPrint('Name: ${signupData.name}');
        debugPrint('Password: ${signupData.password}');
        return _loginUser(signupData);
      },
      onSignup: (users) {
        debugPrint('Signup info');
        debugPrint('Name: ${users.name}');
        debugPrint('Password: ${users.password}');

        users.additionalSignupData?.forEach((key, value) {
          debugPrint('$key: $value');
        });
        if (users.termsOfService.isNotEmpty) {
          debugPrint('Terms of service: ');
          for (var element in users.termsOfService) {
            debugPrint( ' - ${element.term.id}: ${element.accepted == true ? 'accepted' : 'rejected'}');
          }
        }


        // SAVED DATA USER
        if (users!=null){
          saveDataUserSingup(users);
        }

        return _signupUser(users);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(FadePageRoute(
          builder: (context) => const DashboardScreen(),
        ));
      },
      onRecoverPassword: (name) {
        debugPrint('Recover password info');
        debugPrint('Name: $name');
        return _recoverPassword(name);
        // Show new password dialog
      },
      showDebugButtons: true,
    );
  }


  Future<void> saveDataUserSingup(UserData userData) async {

    final connection = PostgreSQLConnection("localhost", 5432, "ecobio",
      username: "postgres",
      password: "root",
      queryTimeoutInSeconds: 3600,
      timeoutInSeconds: 3600,
    );
    await connection.open();
    debugPrint("Database Connected Yes!");

    String $table="ecobio.public.users_singup ";
    String termsOfService =jsonEncode(userData.termsOfService.toString());
    // String additionalSignupData=jsonEncode(users.additionalSignupData.toString());

    Map<String, dynamic> dataToMap = <String, dynamic>{
      "id": 4,
      //  "email": users.email,
      "name": userData.name,
      "password": userData.password,
      "termsOfService": userData.termsOfService,
      "additionalSignupData": userData.additionalSignupData,

    };
    //Map dataToMap = <String, dynamic>{
    // Map<String, dynamic> dataToMap = <String, dynamic>{
    //   "id": '7',
    //   "name": "Dog Map",
    //   "age": "3"
    // };
    // object Doc
    // Dog dog= const Dog(
    //   id: 6,
    //   name: 'Dog TOP',
    //   age: 3,
    // );
    // final dataToObject=dog.toMap;
    // final dataToMap=data;
    //await setData(connection, $table, data);
    await setDataUser(connection, $table, dataToMap);
    // await updateData(connection, table, dataToMap);
    // await removedData(connection, $table, dataToMap);
    // await getDataList(connection, $table, dataToMap);
    // await connection.close();

  }
  Future<void> setDataUser(PostgreSQLConnection connection, String table,
      Map<String, dynamic> data) async {
    //ok await connection.execute("INSERT INTO ecobio.information_schema.dogs VALUES ('6','DogHome','8')");
    await connection.execute('INSERT INTO $table (${data.keys.join(', ')}) VALUES (${data.keys.map((k) => '@$k').join(', ')})', substitutionValues:data);
  }

}
