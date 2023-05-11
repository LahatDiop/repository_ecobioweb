

import 'package:flutter/material.dart';

import '../components/customerProfile.dart';


//-->import 'package:flutter_gen/gen_l10n/gallery_localizations.dart';

class ProfileSettingScreen extends StatefulWidget {
  static const String homeRoute = '/setting';
  static const String secondPageRoute = '/setting/item';

  const ProfileSettingScreen({Key? key}) : super(key: key);

  //String get title => 'Setting Profile';

  // static const String _title = 'Flutter Code Sample';

  @override
  _ProfileSettingScreenState createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  Widget build(BuildContext context) {
    const String _title = 'Flutter Code Sample';

    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatelessWidget(),
      ),
    );
  }
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                subtitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                author,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black87,
                ),
              ),
              Text(
                '$publishDate - $readDuration',
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/*class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10.0),
      children: <Widget>[
        CustomUser(
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.pink),
          ),
          description: 'Customer User',
          favorite: 'favorite',
          username: 'Zaynab', // cognome nome
          email: 'zaynab@gmail.com',
          password: '',
          statusProducer: '', // produttore
          statusCustomer: '', // cliente
          messages: '',
          enabled: true,
          // thumbnail:
          publishDate: '25/12/2022',
          //IconData: Icon.,
        ),
        CustomUser(
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.pink),
          ),
          description: 'Customer User',
          favorite: 'favorite',
          username: 'Lahat', // cognome nome
          email: 'lahat@gmail.com',
          password: '',
          statusProducer: '', // produttore
          statusCustomer: '', // cliente
          messages: '',
          enabled: true,
          // thumbnail:
          publishDate: '02/12/2026',
          //IconData: Icon.,
        ),
      ],
    );
  }
}
