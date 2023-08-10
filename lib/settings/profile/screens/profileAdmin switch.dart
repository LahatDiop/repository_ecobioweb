import 'package:flutter/material.dart';

import '../../admin/screens/setting_screen.dart';
import '../../localisation/translation/components/appLocalizations.dart';

class ProfileAdmin extends StatefulWidget {
  const ProfileAdmin({Key? key}) : super(key: key);

  @override
  _ProfileAdminState createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<ProfileAdmin> {
  final List<bool> _values = [true, false, true, false, false];

  @override
  Widget build(BuildContext context) {
    const int count = 4;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.translate("back").toString()),
        backgroundColor: const Color.fromARGB(255, 50, 172, 34),

        leading: BackButton(
          color: Colors.black,
          onPressed: () {
                //Navigator.push(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
                //  Navigator.pop(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
            Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>  SettingScreen()),
            );
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          for (int i = 0; i <= count; i++)
            ListTile(
              title: Text(
                'Switch ${i + 1}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: i == count ? Colors.black38 : Colors.black),
              ),
              leading: Switch(
                value: _values[i],
                onChanged: i == count
                    ? null
                    : (bool value) {
                        setState(() {
                          _values[i] = value;
                        });
                      },
              ),
            ),
        ],
      ),
    );
  }


}
