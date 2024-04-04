


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../commun_data_utils/responsive/responsive.dart';
import '../../../commun_data_utils/utils/constants/constants.dart';
import '../../../menu/menu_home/controllers/MenuAppController.dart';
import '../menu/side_menu_users.dart';
import '../widgets/header.dart';
import '../widgets/my_fields.dart';
import '../widgets/users_data_info.dart';
import '../widgets/storage_details.dart';
import 'users_main_screen.dart';
import 'users_screen.dart';

class UsersDataScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
      title: 'Flutter Admin Panel',
     theme: ThemeData.dark().copyWith(
       //scaffoldBackgroundColor: bgColor,
       scaffoldBackgroundColor: Colors.green,
       textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
           .apply(bodyColor: Colors.white),
       canvasColor: secondaryColor,
     ),
      // theme: ThemeData.dark().copyWith(
      //   scaffoldBackgroundColor: bgColor,
      //   textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
      //       .apply(bodyColor: Colors.white),
      //   canvasColor: secondaryColor,
      // ),
        home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuAppController(),
          ),
        ],
      ///  child: UsersMainScreen(),
            child: Scaffold(
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
                    const Expanded(
                      // It takes 5/6 part of the screen
                      flex: 5,
                      child: UsersScreen(),
                    ),
                  ],
                ),
              ),
            ),
        ),
      );
   // );
  }


  @override
  Widget build1(BuildContext context) {
    return Scaffold(
      key: context.read<MenuAppController>().scaffoldKey,
      drawer: const SideMenuUsers(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
  }

