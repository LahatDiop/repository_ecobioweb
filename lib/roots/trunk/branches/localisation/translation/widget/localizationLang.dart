import 'package:flutter/material.dart';
import '../components/appLocalizations.dart';

class LocalizationLang extends StatefulWidget {
  const LocalizationLang({Key? key}) : super(key: key);

  @override
  _LocalizationLangScreenState createState() => _LocalizationLangScreenState();
}

class _LocalizationLangScreenState extends State<LocalizationLang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          AppLocalizations.translate('localization'),
          style: const TextStyle(color: Colors.black),
        ),
        leading: const BackButton(
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                AppLocalizations.translate('countryLocation'),
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.translate('agricolturaBio'),
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.translate('slogan'),
                style: const TextStyle(fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
