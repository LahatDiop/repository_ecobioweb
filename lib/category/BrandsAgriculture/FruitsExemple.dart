import 'package:flutter/material.dart';

import '../../roots/trunk/branches/localisation/translation/components/appLocalizations.dart';



class FruitsPage extends StatefulWidget {
  const FruitsPage({super.key});

  @override
  _FruitsPageState createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        _buildFoodCard(
            '../assets/images/frutto/avocado.png',
            '\$18.78',
            'Big single avocado fresh imported fruits from the Mexican Avocado collection',
            '0xFF57874E'),
        _buildFoodCard(
            '../assets/images/frutto/grapes.png',
            '\$10.78',
            'Big single avocado fresh imported fruits from the Mexican Avocado collection',
            '0xFF8FC03A')
      ],
    );
  }

  Widget _buildFoodCard(
      String imgPath, String price, String desc, String cardColor) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
          height: 100.0,
          width: 200.0,
          decoration: BoxDecoration(
              color: Color(int.parse(cardColor)),
              borderRadius: BorderRadius.circular(15.0)),
          child: Column(children: [
            const SizedBox(height: 15.0),
            Image.asset(imgPath, fit: BoxFit.cover, height: 100.0),
            const SizedBox(height: 10.0),
            Text(
              price,
              style: const TextStyle(
                  fontFamily: 'Quicksand', color: Colors.white, fontSize: 20.0),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 10.0),
              child: Text(desc,
                  style: const TextStyle(
                      fontFamily: 'Quicksand',
                      color: Colors.white,
                      fontSize: 12.0)),
            ),
            const SizedBox(height: 15.0),
            InkWell(
                onTap: () {},
                child: Container(
                  height: 30.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFF89AC83),
                      borderRadius: BorderRadius.circular(15.0)),
                  child: Center(
                    child: Text(
                      AppLocalizations.translate("addToCard").toString(),
                      style: const TextStyle(
                          fontFamily: 'Quicksand', color: Colors.white),
                    ),
                  ),
                ))
          ])),
    );
  }
}
