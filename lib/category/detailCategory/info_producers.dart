import 'package:flutter/material.dart';

import '../../roots/trunk/branches/localisation/translation/components/appLocalizations.dart';
import '../../roots/trunk/branches/menu/menu_search/screens/search_screen.dart';
import '../../roots/trunk/branches/products/components/product.dart';

class InfoProducers extends StatefulWidget {
  const InfoProducers({Key? key}) : super(key: key);

  @override
  _InfoProducersState createState() => _InfoProducersState();
}

class _InfoProducersState extends State<InfoProducers> {
  final List<String> _listItem = [
    '../assets/images/admin/two.jpg',
    '../assets/images/admin/three.jpg',
    '../assets/images/admin/four.jpg',
    '../assets/images/admin/five.jpg',
    '../assets/images/admin/one.jpg',
    '../assets/images/admin/two.jpg',
    '../assets/images/admin/three.jpg',
    '../assets/images/admin/four.jpg',
    '../assets/images/admin/five.jpg',
  ];

  TextEditingController textInputSearch =  TextEditingController();
  List<Product> products = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 126, 68),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 16, 202, 25),
        elevation: 0,
        // leading: const Icon(Icons.menu),
        title: TextField(
          controller:textInputSearch ,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white70,
              contentPadding: const EdgeInsets.only(
                  left: 14.0, bottom: 8.0, top: 8.0),
              focusedBorder: OutlineInputBorder(
                borderSide:  const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(25.7),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide:  const BorderSide(color: Colors.white),
                borderRadius:  BorderRadius.circular(25.7),
              ),
              /// hintText: " Search...",
              hintText: AppLocalizations.translate("search_point"),
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                color: const Color.fromRGBO(90, 25, 72, 1),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch(products,textInputSearch.value.text.toString()));
                },
              )),
          style: const TextStyle(color: Colors.black, fontSize: 15.0),
        ),
       // title: const Text("Setting"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 36,
              height: 30,
              decoration: BoxDecoration(
                  // color: Colors.grey[800],
                  color: const Color.fromARGB(255, 44, 194, 56),
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(child: Text("0")),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,

                /// height: 250,
                height: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                        image: AssetImage('../assets/images/admin/one.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        //  Colors.black.withOpacity(.4),
                        // Colors.black.withOpacity(.2),
                        const Color.fromARGB(255, 116, 236, 100).withOpacity(.4),
                        const Color.fromARGB(255, 49, 117, 36).withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Text(
                        "Lifestyle Sale Lahat",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Center(
                            child: Text(
                          "Shop Now",
                          style: TextStyle(
                              color: Colors.grey[900],
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: _listItem
                    .map((item) => Card(
                          color: Colors.transparent,
                          elevation: 0,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(item),
                                    fit: BoxFit.cover)),
                            child: Transform.translate(
                              offset: const Offset(50, -50),
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 65, vertical: 63),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  // color: Colors.white
                                ),
                                child: const Icon(
                                  Icons.bookmark_border,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ))
            ],
          ),
        ),
      ),
    );
  }

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
