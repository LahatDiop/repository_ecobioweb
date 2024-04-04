// import 'package:flutter/material.dart';
// import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:postgres/postgres.dart';
//
// class ConnectionPostgresSql extends StatefulWidget {
//   const ConnectionPostgresSql({Key? key}) : super(key: key);
//
//   @override
//   ConnectionPostgresSqlState createState() => ConnectionPostgresSqlState();
//
// }
//
// class ConnectionPostgresSqlState extends State<ConnectionPostgresSql> {
//
//   SessionManager sessionManager = SessionManager();
//
//   // CONNECTION POSTGRESQL
//   PostgreSQLConnection databaseConnection  = PostgreSQLConnection("localhost", 5432, "ecobio",
//     username: "postgres",
//     password: "root",
//     queryTimeoutInSeconds: 3600,
//     timeoutInSeconds: 3600,
//     //     timeZone: 'UTC',
//     //     useSSL: false,
//     //     isUnixSocket: false
//   );
//   //await connection.open();
//
//
//
//   List<dynamic> fetchDataFuture = [];
//
//   PostgreSQLResult? sellerAlreadyRegistered, buyerAlreadyRegistered;
//   PostgreSQLResult? newSellerRegisterResult, newBuyerRegisterResult;
//
//   initDatabaseConnection() async {
//    // connection.open();
//     databaseConnection.open().then((value) {
//
//       // Add param connection into the session
//       sessionManager.set("databaseConnection", databaseConnection);
//
//     //connection.open().then((value) {
//      debugPrint("Database Connected Ok :) >> Yes!");
//     });
//   }
//
//   // AppDatabase() {
//   //   connection = (connection == null || connection.isClosed == true
//   //       ? PostgreSQLConnection(
//   //           // for external device like mobile phone use domain.com or
//   //           // your computer machine IP address (i.e,192.168.0.1,etc)
//   //           // when using AVD add this IP 10.0.2.2
//   //           'localhost',
//   //           5432,
//   //           'ecobio',
//   //           username: 'postgres',
//   //           password: 'root',
//   //           timeoutInSeconds: 30,
//   //           queryTimeoutInSeconds: 30,
//   //           timeZone: 'UTC',
//   //           useSSL: false,
//   //           isUnixSocket: false,
//   //         )
//   //       : connection);
//   //
//   //   fetchDataFuture = [];
//   // }
//
//   String newBuyerFuture = '';
//
//   String futureBuyer = '';
//
//   @override
//   Widget build(BuildContext context) {
//     String buyerEmail = "";
//     String password = "";
//     String fName = "";
//     String lName = "";
//     return const MaterialApp(
//         //  initialRoute: '/login',
//         // routes: {
//         // '/login':(context)=> Login(),
//         // "/register": (context) => const registerBuyer(),
//         // "/buyerAccount":(context)=> BuyerAccount(),
//         // "/sellerAccount":(context)=> SellerAccount(),
//         //'/sellerShop':(context)=> SellerShop(),
//         //  registerNew(buyerEmail, password,  fName, lName),
//         // },
//
//         );
//   }
//
//   registerNew(String buyerEmail, String password, String fName, String lName) {
//     registerNew(buyerEmail, password, fName, lName);
//   }
//
//   Future<String> registerNewBuyer(
//       String buyerEmail, String password, String fName, String lName) async {
//     futureBuyer = await registerBuyer(buyerEmail, password, fName, lName);
//     return futureBuyer;
//   }
//
//   Future<String> registerBuyer(
//       String email, String password, String fName, String lName) async {
//     try {
//       await databaseConnection.transaction((newBuyerConn) async {
//         await databaseConnection.open();
//         buyerAlreadyRegistered = await newBuyerConn.query(
//           'select * from public.register where email = @email order by idDB',
//           substitutionValues: {'emailValue': email},
//           allowReuse: true,
//           timeoutInSeconds: 30,
//         );
//         if (buyerAlreadyRegistered!.affectedRowCount > 0) {
//           newBuyerFuture = 'alr';
//         } else {
//           // 'insert into myAppData.register (emailDB,passDB,fNameDB,lNameDB,statusDB,roleDB,authDB,registerDateDB)'
//           // 'values(@emailValue,@passwordValue,@fNameValue,@lNameValue,@statusValue,@roleValue,@authValue,@registrationValue)',
//           newBuyerRegisterResult = await newBuyerConn.query(
//             'insert into public.register (email,password)'
//             'values(@emailValue,@passwordValue)',
//             substitutionValues: {
//               'emailValue': email,
//               'passwordValue': password,
//               //'fNameValue': fName,
//               // 'lNameValue': lName,
//               //  'statusValue': true,
//               // 'roleValue': 'ROLE_BUYER',
//               // 'authValue': 'buyer',
//               //  'registrationValue': DateTime.now(),
//             },
//             allowReuse: true,
//             timeoutInSeconds: 30,
//           );
//           newBuyerFuture =
//               (newBuyerRegisterResult!.affectedRowCount > 0 ? 'reg' : 'nop');
//         }
//       });
//     } catch (exc) {
//       exc.toString();
//       newBuyerFuture = 'exc';
//     }
//     return newBuyerFuture;
//   }
// }
