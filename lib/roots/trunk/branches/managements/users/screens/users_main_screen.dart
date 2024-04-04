


import 'package:ecobioweb/roots/trunk/branches/menu/menu_settings/settings/admin/screens/setting_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../commun_data_utils/responsive/responsive.dart';
import '../../../menu/menu_home/controllers/MenuAppController.dart';
import '../menu/side_menu_users.dart';
import 'users_screen.dart';


class UsersMainScreen extends StatelessWidget {
  TextEditingController textInputSearch =  TextEditingController();


  @override

    Widget build(BuildContext context) {


      return MultiProvider(providers:  [
        ChangeNotifierProvider<MenuAppController>(create: (_)=>MenuAppController()),
      ],
        child: Navigator(onGenerateRoute: (RouteSettings settings){

          return MaterialPageRoute(builder: (context){
            return UsersMainScreen();
          });
        },),

        builder: (context,child){

           return Scaffold(
            key: context.read<MenuAppController>().scaffoldKey,

            drawer: const SideMenuUsers(),
            body: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Title Agriculture Biodynamic
               ///   SubTitle.createSubTitle("agricultureBiodynamic"),

                  // We want this side menu only for large screen
                  if (Responsive.isDesktop(context))
                    const Expanded(
                      // default flex = 1
                      // and it takes 1/6 part of the screen
                      child: SideMenuUsers(),
                    ),
                   Expanded(
                    // It takes 5/6 part of the screen
                    flex: 5,
                    child: UsersScreen(),
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

   @override
   Widget buildok(BuildContext context) {
     return Scaffold(
       key: context.read<MenuAppController>().scaffoldKey,

       // appBar: AppBar(
       //   backgroundColor: Colors.transparent,
       //   elevation: 0,
       //   centerTitle: true,
       //   automaticallyImplyLeading: true,
       //   leading: GestureDetector(
       //     onTap: () {
       //       Navigator.pop(context);
       //     },
       //     child: Container(
       //       padding: const EdgeInsets.only(left: 25),
       //       child: const Icon(
       //         Icons.arrow_back_ios,
       //         color: Colors.red,
       //       ),
       //     ),
       //   ),
       //   title: Text(
       //     AppLocalizations.translate('back lahat'),
       //     style: const TextStyle(color: Colors.black),
       //   ),
       // ),

       drawer: const SideMenuUsers(),
       body: SafeArea(
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             /// Title Agriculture Biodynamic
           ///  SubTitle.createSubTitle("agricultureBiodynamic"),

             // We want this side menu only for large screen
             if (Responsive.isDesktop(context))
               const Expanded(
                 // default flex = 1
                 // and it takes 1/6 part of the screen
                 child: SideMenuUsers(),
               ),
              Expanded(
               // It takes 5/6 part of the screen
               flex: 5,
               child: UsersScreen(),
             ),
           ],
         ),
       ),
     );

   }

  //  Widget build11(BuildContext context) {
  //   return Scaffold(
  //     key: context.read<MenuAppController>().scaffoldKey,
  //     drawer: const SideMenu(),
  //     body: SafeArea(
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           // We want this side menu only for large screen
  //           if (Responsive.isDesktop(context))
  //             const Expanded(
  //               // default flex = 1
  //               // and it takes 1/6 part of the screen
  //               child: SideMenu(),
  //             ),
  //           Expanded(
  //             // It takes 5/6 part of the screen
  //             flex: 5,
  //             child: DashboardScreen(),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
