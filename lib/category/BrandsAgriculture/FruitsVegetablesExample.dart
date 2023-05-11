import 'package:flutter/material.dart';

import 'FruitsExemple.dart';

/*void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FruitsVegetablesExample(),
    );
  }
}

*/
class FruitsVegetablesExample extends StatefulWidget {
  const FruitsVegetablesExample({Key? key}) : super(key: key);

  @override
  _FruitsVegetablesExampleState createState() =>
      _FruitsVegetablesExampleState();
}

class _FruitsVegetablesExampleState extends State<FruitsVegetablesExample>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        const SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu, color: Colors.grey),
              onPressed: () {},
            ),
            Container(
              height: 50.0,
              width: 200.0,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(25.0),
                      bottomLeft: Radius.circular(25.0),
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0))),
              child: const TextField(
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 15.0),
                    prefixIcon: Icon(Icons.search, color: Colors.grey)),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.grey),
              onPressed: () {},
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('All Fruits',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: TabBar(
            controller: tabController,
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.withOpacity(0.6),
            isScrollable: true,
            tabs: const <Widget>[
              Tab(
                child: Text(
                  'Avocado',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Grapes',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Apple',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Tab(
                child: Text(
                  'Grapefruit',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontFamily: 'Quicksand',
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 375.0,
          child: TabBarView(
            controller: tabController,
            children: <Widget>[
              FruitsPage(),
              FruitsPage(),
              FruitsPage(),
              FruitsPage(),
            ],
          ),
        ),
        const SizedBox(height: 10.0),
        const Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Text('Sales',
              style: TextStyle(
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0)),
        ),
        const SizedBox(height: 10.0),
        SizedBox(
          height: 150.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _buildFoodItem(
                  '../assets/images/frutto/greenapple.png', '80', '\$13.88'),
              _buildFoodItem(
                  '../assets/images/frutto/lemon.png', '75', '\$15.00'),
              _buildFoodItem(
                  '../assets/images/frutto/orange.png', '89', '\$11.86')
            ],
          ),
        )
      ],
    ));
  }

  Widget _buildFoodItem(String imgPath, String discount, String price) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: <Widget>[
          const SizedBox(
            height: 125.0,
            width: 125.0,
          ),
          Positioned(
              left: 15.0,
              child: Container(
                height: 20.0,
                width: 25.0,
                decoration: BoxDecoration(
                    color: const Color(0xFFD2691F),
                    borderRadius: BorderRadius.circular(7.0)),
              )),
          Positioned(
              top: 7.0,
              child: Container(
                  height: 110.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                      color: const Color(0xFFAAC2A5),
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Column(children: [
                    const SizedBox(height: 10.0),
                    Image.asset(
                      imgPath,
                      fit: BoxFit.cover,
                      height: 70.0,
                    ),
                    Text(price,
                        style: const TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ]))),
          Positioned(
              left: 15.0,
              child: Container(
                  height: 20.0,
                  width: 20.0,
                  decoration: const BoxDecoration(
                      color: Color(0xFFFE9741),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7.0),
                          bottomRight: Radius.circular(7.0),
                          bottomLeft: Radius.circular(7.0))),
                  child: Center(
                      child: Text(discount + '%',
                          style: const TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 9.0,
                              color: Colors.white))))),
        ],
      ),
    );
  }
}
