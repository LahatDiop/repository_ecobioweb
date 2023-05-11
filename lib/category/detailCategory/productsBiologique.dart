import 'package:flutter/material.dart';

class ProductsBiologique extends StatefulWidget {
  const ProductsBiologique({Key? key}) : super(key: key);

  @override
  _ProductsBiologiqueState createState() => _ProductsBiologiqueState();
}

class _ProductsBiologiqueState extends State<ProductsBiologique> {
  final List<String> _listItem = [
    'images/admin/two.jpg',
    'images/admin/three.jpg',
    'images/admin/four.jpg',
    'images/admin/five.jpg',
    'images/admin/one.jpg',
    'images/admin/two.jpg',
    'images/admin/three.jpg',
    'images/admin/four.jpg',
    'images/admin/five.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 39, 126, 68),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(0, 16, 202, 25),
        elevation: 10,
        leading: const Icon(Icons.menu),
        title: const Text("Setting"),
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
                        image: AssetImage('images/admin/one.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient:
                          LinearGradient(begin: Alignment.bottomRight, colors: [
                        //  Colors.black.withOpacity(.4),
                        // Colors.black.withOpacity(.2),
                        const Color.fromARGB(255, 116, 236, 100)
                            .withOpacity(.4),
                        const Color.fromARGB(255, 49, 117, 36).withOpacity(.2),
                      ])),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      const Text(
                        "Lifestyle Sale",
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
}
