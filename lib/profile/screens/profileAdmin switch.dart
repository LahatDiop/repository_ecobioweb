import 'package:flutter/material.dart';

class ProfileAdmin extends StatefulWidget {
  const ProfileAdmin({Key? key}) : super(key: key);

  @override
  _ProfileAdminState createState() => _ProfileAdminState();
}

class _ProfileAdminState extends State<ProfileAdmin> {
  final List<bool> _values = [true, false, true, false, false];

  @override
  Widget buildOK(BuildContext context) {
    const int count = 4;

    return Scaffold(
      body: Column(
        children: <Widget>[
          for (int i = 0; i <= count; i++)
            ListTile(
              title: Text(
                'Switch ${i + 1}',
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
