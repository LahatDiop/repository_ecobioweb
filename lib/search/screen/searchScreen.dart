import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Theme(
          data: Theme.of(context).copyWith(
            primaryColor: Colors.grey[600],
          ),
          child: TextField(
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              filled: true,
              prefixIcon: const Icon(Icons.search),
              fillColor: const Color(0xFFF2F4F5),
              hintStyle: TextStyle(color: Colors.grey[600]),
              hintText: "What would your like to buy?",
            ),
            autofocus: false,
          )),
    );
  }

  /* Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting'),
      ),
      body: Material(
          child: Column(children: <Widget>[
        Container(
            decoration: BoxDecoration(color: Colors.grey[300]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(color: Colors.grey),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(
                        Icons.search,
                        color: Color.fromARGB(255, 182, 194, 245),
                        size: 30.0,
                      ),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 18.0),
                      hintText: 'Search',
                    ),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Theme.of(context).hintColor),
                          left: BorderSide(color: Theme.of(context).hintColor)),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.view_list),
                      onPressed: () {},
                    )),
                Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(color: Theme.of(context).hintColor),
                          left: BorderSide(color: Theme.of(context).hintColor)),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.view_list),
                      onPressed: () {},
                    )),
              ],
            )),
        
      ])),
    );
  }

  */
}
