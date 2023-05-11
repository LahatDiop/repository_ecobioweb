// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: dead_code

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//-->import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class ProfileSettingScreen extends StatefulWidget {
  static const String homeRoute = '/setting';
  static const String secondPageRoute = '/setting/item';

  const ProfileSettingScreen({Key? key}) : super(key: key);

  String get title => 'Setting Profile';

  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  //static const String homeRoute = '/home';
  // static const String secondPageRoute = '/home/item';

  @override
  Widget build(BuildContext context) {
    return Navigator(
      restorationScopeId: 'navigator',
      initialRoute: ProfileSettingScreen.homeRoute,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case ProfileSettingScreen.homeRoute:
            return _NoAnimationCupertinoPageRoute<void>(
              // title: GalleryLocalizations.of(context).demoCupertinoNavigationBarTitle,
              title: "Setting",
              settings: settings,
              builder: (context) => _FirstPage(),
            );
            break;
          case ProfileSettingScreen.secondPageRoute:
            final arguments = settings.arguments as Map<dynamic, dynamic>;
            final title = arguments['pageTitle'] as String;
            return CupertinoPageRoute<void>(
              title: title,
              settings: settings,
              builder: (context) => _SecondPage(),
            );
            break;
        }
        return null;
      },
    );
  }
}

// ignore: must_be_immutable
class _FirstPage extends StatelessWidget {
  List<String> settingApp = ["Lang", "Privacy", "Info", "Ruler", "-"];

  List<String> settingsProfile = [
    "Profile",
    "Password",
    "Message",
    "Localization",
    "--"
  ];

  final items = [
    'Impostation',
    'User',
    'Regole',
  ];
  //sectionsList.shuffle();
  //print(sectionsList);
  String get title => 'ciao';
  String get title2 => 'sss';

  // get GalleryLocalizations => sectionsList;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            automaticallyImplyLeading: false,
          ),
          SliverPadding(
            padding:
                MediaQuery.of(context).removePadding(removeTop: true).padding,
            sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
              (context, index) {
                //final title = GalleryLocalizations.of(context).starterAppDrawerItem(index + 1);
                List<String> titleddd = [
                  "Localization",
                  "Lang",
                  "Stated",
                  "Info",
                  "Altro"
                ];
                return ListTile(
                    onTap: () {
                      // var title = 'senegal';
                      Navigator.of(context).restorablePushNamed<void>(
                        ProfileSettingScreen.secondPageRoute,
                        arguments: {'pageTitle': title},
                      );
                    },
                    title: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: <Widget>[
                            Column(
                              children: settingsProfile.map((sectionsProfile) {
                                return Card(
                                    child:
                                        ListTile(title: Text(sectionsProfile)));
                                const Icon(Icons.arrow_forward_ios_sharp);
                                /* OK  child: ListTile(
                                  // title: Text(items[index]),
                                  title: Text(items[index]),
                                ));
                                */
                                // const Divider(); //
                              }).toList(),
                            ),
                            Column(
                              children: settingApp.map((sectionsApp) {
                                return Card(
                                    child: ListTile(title: Text(sectionsApp)));
                                const Icon(Icons.arrow_forward_ios_sharp);
                                /* OK  child: ListTile(
                                  // title: Text(items[index]),
                                  title: Text(items[index]), 
                                ));
                                */
                                // const Divider(); //
                              }).toList(),
                            ),
                          ],

                          /*  children: sectionsList.map((sections) {
                            return Card(
                                // child: ListTile(title: Text(sections)));
                                // const Icon(Icons.arrow_forward_ios_sharp);
                                child: ListTile(
                              // title: Text(items[index]),
                              title: Text(items[index]),
                             
                            ));
                            // const Divider(); //
                          }).toList(),
                          */
                        ))

                    // title: Text(title),
                    //  tileColor: Colors.red,
                    // title: const Text('One-line wee'),
                    //  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                    //  trailing: const Icon(Icons.more_vert),

                    );

                SizeBox(
                  const Text('sssssss'),
                );
                // ignore: unused_label
              },
              childCount: 1,
              // childCount: items.length,
            )),
          ),
        ],
      ),
    );
  }
}

class SizeBox {
  SizeBox(Text text);
}

class _SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> settingsList = [
      "User",
      "Password",
      "Message",
      "Privacy",
      "Altro"
    ];

    return CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(), child: Container());
    // second category
    /*  child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: settingsList.map((sections) {
              return Card(child: ListTile(title: Text(sections)));
              const Icon(Icons.arrow_forward_ios_sharp);

              SizeBox(
                const Text('vbbb'),
              );
            }).toList(),
          ),
        ));*/
  }
}

/// A CupertinoPageRoute without any transition animations.
class _NoAnimationCupertinoPageRoute<T> extends CupertinoPageRoute<T> {
  _NoAnimationCupertinoPageRoute({
    required WidgetBuilder builder,
    required RouteSettings settings,
    required String title,
  }) : super(
          builder: builder,
          settings: settings,
          title: title,
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
