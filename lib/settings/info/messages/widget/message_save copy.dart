// // ignore_for_file: deprecated_member_use
//
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// import 'package:overlay_support/overlay_support.dart';
// import '../components/message.dart';
//
// /*
// void main() {
//   runApp(MaterialApp( home: MessageSave(),));
// }
//  */
// class MessageSave extends StatefulWidget {
//   const MessageSave({Key? key}) : super(key: key);
//
//   @override
//   _MessageSaveState createState() => _MessageSaveState();
// }
//
// class _MessageSaveState extends State<MessageSave> {
//   late int _totalNotifications;
//
//   late final FirebaseMessaging _messaging;
//
//   PushNotification? _notificationInfo;
//   @override
//   void initState() {
//     _totalNotifications = 0;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Flutter TextField Example'),
//           brightness: Brightness.dark,
//         ),
//         body: Padding(
//             padding: const EdgeInsets.all(15),
//             child: Column(
//               children: <Widget>[
//                 const Padding(
//                   padding: EdgeInsets.all(15),
//                   child: TextField(
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Message',
//                       hintText: 'Enter Your Message',
//                     ),
//                   ),
//                 ),
//                 /* const Padding(
//                   padding: EdgeInsets.all(15),
//                   child: TextField(
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Password',
//                       hintText: 'Enter Password',
//                     ),
//                   ),
//                 ),
//                 */
//                 _notificationInfo != null
//                     ? const Text(
//                         'App for capturing Firebase Push Notifications',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 20,
//                         ),
//                       )
//                     : const SizedBox(height: 16.0),
//                 NotificationBadge(totalNotifications: _totalNotifications),
//                 const SizedBox(height: 16.0),
//
//
//              // RaisedButton(
//               ElevatedButton(
//                  // color: Colors.pinkAccent,
//                   child: const Text("Save to Database"),
//                   onPressed: () {
//                     //call method flutter upload
//
//                   }),
//
//               // RaisedButton(
//               ElevatedButton(
//                  // textColor: Colors.white,
//                  // color: Colors.blue,
//                   child: const Text('Sign In'),
//                   onPressed: () {
//                     //   _sendMessage();
//                   //  registerNotification();
//                   },
//                 )
//               ],
//             )));
//   }
//
//   void _sendMessage() {
//     if (_canSendMesssage()) {
//       // if (_canSendMesssage) {
//       var _messageController;
//       final message = Message(_messageController.text, DateTime.now());
//
//       var widget;
//       widget.messageDao.saveMessage(message);
//       _messageController.clear();
//       setState(() {});
//     }
//   }
//
//   bool _canSendMesssage() {
//     return true;
//   }
//
//   void registerNotification1() async {
//     // 1. Initialize the Firebase app
//     await Firebase.initializeApp();
//
//     // 2. Instantiate Firebase Messaging
//     _messaging = FirebaseMessaging.instance;
//
//     // 3. On iOS, this helps to take the user permissions
//     NotificationSettings settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       provisional: false,
//       sound: true,
//     );
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//       // TODO: handle the received notifications
//     } else {
//       print('User declined or has not accepted permission');
//     }
//   }
//
//   void registerNotification2() async {
//     // 1. Initialize the Firebase app
//     await Firebase.initializeApp();
//
//     // 2. Instantiate Firebase Messaging
//     _messaging = FirebaseMessaging.instance;
//
//     // 3. On iOS, this helps to take the user permissions
//     NotificationSettings settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       provisional: false,
//       sound: true,
//     );
//     PushNotification? _notificationInfo;
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       print('User granted permission');
//
//       // For handling the received notifications
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         // Parse the message received
//         PushNotification notification = PushNotification(
//           title: message.notification?.title,
//           body: message.notification?.body,
//         );
//
//         setState(() {
//           _notificationInfo = notification;
//           _totalNotifications++;
//         });
//       });
//     } else {
//       print('User declined or has not accepted permission');
//     }
//   }
//
//   void registerNotification() async {
//     // 1. Initialize the Firebase app
//     await Firebase.initializeApp();
//
//     // 2. Instantiate Firebase Messaging
//     _messaging = FirebaseMessaging.instance;
//
//     // 3. On iOS, this helps to take the user permissions
//     NotificationSettings settings = await _messaging.requestPermission(
//       alert: true,
//       badge: true,
//       provisional: false,
//       sound: true,
//     );
//
//     PushNotification? _notificationInfo;
//
//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//         // ...
//         if (_notificationInfo != null) {
//           // For displaying the notification as an overlay
//           showSimpleNotification(
//             Text(_notificationInfo.title!),
//             leading: NotificationBadge(totalNotifications: _totalNotifications),
//             subtitle: Text(_notificationInfo.body!),
//             background: Colors.cyan.shade700,
//             duration: const Duration(seconds: 2),
//           );
//         }
//       });
//     } else {
//       print('User declined or has not accepted permission');
//     }
//   }
// }
//
// class PushNotification {
//   PushNotification({
//     this.title,
//     this.body,
//   });
//   String? title;
//   String? body;
// }
//
// class NotificationBadge extends StatelessWidget {
//   final int totalNotifications;
//
//   const NotificationBadge({required this.totalNotifications});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 40.0,
//       height: 40.0,
//       decoration: const BoxDecoration(
//         color: Colors.red,
//         shape: BoxShape.circle,
//       ),
//       child: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Text(
//             '$totalNotifications',
//             style: const TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ),
//     );
//   }
// }
