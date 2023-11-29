// /*
//  * CONFIGURATION FIBASE WEB APP - ANDROID -IOS
//  * Authore lahat.diop
//  * Email: lahat.diop@gmail.com
//  * 06/04/2022
//  */
//
// import 'dart:developer';
// import 'dart:io';
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/foundation.dart';
//
// class DefaultFirebaseConfig {
//   static FirebaseOptions? get platformOptions {
//     if (kIsWeb) {
//       // Web
//       //https://console.firebase.google.com/project/ecobio-b540b/settings/general/web:ZjUzOWM1YjMtNDlkMC00OGYxLTg2MzAtN2QwMGQ1NWY4Y2Nj
//       return const FirebaseOptions(
//           apiKey: "AIzaSyBODVyVBxPRAL2hx1v1OYYuiMXf4UZkfdk",
//           authDomain: "ecobio-b540b.firebaseapp.com",
//           databaseURL: "https://ecobio-b540b-default-rtdb.firebaseio.com",
//           projectId: "ecobio-b540b",
//           storageBucket: "ecobio-b540b.appspot.com",
//           messagingSenderId: "938913147015",
//           appId: "1:938913147015:web:b138db6ca5d4799c603022",
//           measurementId: "G-V6CZLP5PVL");
//     } else if (Platform.isWindows) {
//       return const FirebaseOptions(
//           apiKey: "AIzaSyBODVyVBxPRAL2hx1v1OYYuiMXf4UZkfdk",
//           authDomain: "ecobio-b540b.firebaseapp.com",
//           databaseURL: "https://ecobio-b540b-default-rtdb.firebaseio.com",
//           projectId: "ecobio-b540b",
//           storageBucket: "ecobio-b540b.appspot.com",
//           messagingSenderId: "938913147015",
//           appId: "1:938913147015:web:b138db6ca5d4799c603022",
//           measurementId: "G-V6CZLP5PVL");
//     } else if (Platform.isIOS || Platform.isMacOS) {
//       // iOS and MacOS
//       return const FirebaseOptions(
//         appId: '1:938913147015:ios:dfc07121c52cd504603022',
//         apiKey: 'AIzaSyBoI-owopBWUPdg5iIYizklxgxIlDF3trQ',
//         projectId: '"ecobio-b540b',
//         messagingSenderId: '938913147015',
//         iosBundleId: 'com.softwebsite.ecobion',
//         iosClientId:
//             '938913147015-d90rt36dk767fodtpisum34gm3vipbaf.apps.googleusercontent.com',
//         androidClientId:
//             '938913147015-d90rt36dk767fodtpisum34gm3vipbaf.apps.googleusercontent.com',
//         databaseURL: 'https://ecobio-b540b-default-rtdb.firebaseio.com/',
//         storageBucket: 'ecobio-b540b.appspot.com',
//       );
//     } else {
//       // Android
//       //https://console.firebase.google.com/project/ecobio-b540b/settings/general/android:com.softwebsite.ecobio
//
//       log("Analytics Dart-only initializer doesn't work on Android, please make sure to add the config file.");
//
//       return const FirebaseOptions(
//         appId: '1:938913147015:android:842a1daa7a612e70603022',
//         apiKey: 'AIzaSyBPsT0mYtLW7hkixTmY40BzOsRLZzct6y0',
//         projectId: '"ecobio-b540b',
//         messagingSenderId: '938913147015',
//         iosBundleId: 'com.softwebsite.ecobio',
//         iosClientId:
//             '938913147015-d90rt36dk767fodtpisum34gm3vipbaf.apps.googleusercontent.com',
//         androidClientId:
//             '938913147015-d90rt36dk767fodtpisum34gm3vipbaf.apps.googleusercontent.com',
//         databaseURL: 'https://ecobio-b540b-default-rtdb.firebaseio.com/',
//         storageBucket: 'ecobio-b540b.appspot.com',
//         authDomain:
//             "938913147015-2ksltsqle7d8tf42ku652gobp9apqnoo.apps.googleusercontent.com",
//         // measurementId: "G-V6CZLP5PVL"
//       );
//     }
//   }
// }
