import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../../managements/users/models/user_settings.dart';
import '../../../../../managements/users/models/users.dart';
import '../models/editDescription.dart';
import '../models/editEmail.dart';
import '../models/editImage.dart';
import '../models/editName.dart';
import '../models/editPhone.dart';
import '../widget/display_image_widget.dart';

// This class handles the Page to dispaly the user's info on the "Edit Profile" Screen
class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user =UserDataSettings.myUser;
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return Scaffold(
        // appBar: buildAppBar(context),
        body: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
      width: double.infinity,
      height: double.infinity,
      color: Colors.white70,
      child: Column(
        children: <Widget>[
          AppBar(
            backgroundColor: const Color.fromARGB(0, 102, 240, 114),
            elevation: 0,
            toolbarHeight: 10,
          ),
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
          const Center(
              // ignore: unnecessary_const
              child: const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'Edit Profile',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(64, 105, 225, 1),
                    ),
                  ))),

          /* TextField(
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
              // hintText: "Phone Number",
              // buildUserInfoDisplay(user.name, 'Name', const EditNameFormPage()),
            ),
          ),*/

          InkWell(
              onTap: () {
                navigateSecondPage(const EditImagePage());
              },
              child: DisplayImage(
                imagePath: user.image.toString(),
                onPressed: () {},
              )),
          Container(
            width: double.infinity,
          ),
          buildUserInfoDisplay(user.name.toString(), 'Name', const EditNameFormPage()),
          buildUserInfoDisplay(user.phone.toString(), 'Phone', const EditPhoneFormPage()),
          buildUserInfoDisplay(user.email.toString(), 'Email', const EditEmailFormPage()),
          Expanded(
            flex: 4,
            child: buildAbout(user as Users),
          )
        ],
      ),
    ));
  }

  // Widget builds the display item with the proper formatting to display the user's info
  Widget buildUserInfoDisplay(String getValue, String title, Widget editPage) =>
      Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 1,
              ),
              Container(
                  //  width: 350,
                  // height: 40,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(editPage);
                            },
                            child: Text(
                              getValue,
                              style: const TextStyle(fontSize: 16, height: 1.4),
                            ))),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                  ]))
            ],
          ));

  // Widget builds the About Me Section
  Widget buildAbout(Users users) => Padding(
      //  padding: const EdgeInsets.only(bottom: 100),
      padding: const EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 50),
      child: Flexible(
          flex: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Text(
                'Tell Us About Yourself',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 30),
              Container(
                  //  width: 350,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ))),
                  child: Row(children: [
                    Expanded(
                        child: TextButton(
                            onPressed: () {
                              navigateSecondPage(const EditDescriptionFormPage());
                            },
                            child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5, 10, 10, 10),
                                child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      users.aboutMeDescription,
                                      style: const TextStyle(
                                        fontSize: 16,
                                        height: 1.4,
                                      ),
                                    ))))),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.grey,
                      size: 40.0,
                    )
                  ]))
            ],
          )));

  // Refrshes the Page after updating user info.
  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  // Handles navigation and prompts refresh.
  void navigateSecondPage(Widget editForm) {
    Route route = MaterialPageRoute(builder: (context) => editForm);
    Navigator.push(context, route).then(onGoBack);
  }
}
