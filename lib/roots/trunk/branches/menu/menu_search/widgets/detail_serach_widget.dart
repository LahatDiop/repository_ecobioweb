import 'package:flutter/material.dart';

import '../../../localisation/translation/components/appLocalizations.dart';
import '../../../products/components/product.dart';


// class DetailSearchWidget extends StatelessWidget {
  class DetailSearchWidget extends StatefulWidget {

  final Product product;
  final int? quatity;
  const DetailSearchWidget({Key? key, required this.product, quantity, this.quatity}) : super(key: key);

  @override
  _DetailSearchWidgetState createState() => _DetailSearchWidgetState();
  }

  class _DetailSearchWidgetState extends State<DetailSearchWidget> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(slivers: [
        SliverAppBar(
          expandedHeight: MediaQuery.of(context).size.height * 0.6,
          elevation: 0,
          snap: true,
          floating: true,
          stretch: true,
          backgroundColor: Colors.grey.shade50,
          flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
              ],
              // background: Image.network(
              background: Image.asset(
                widget.product.imageURL,
                fit: BoxFit.cover,
              )

          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(45),
              child: Transform.translate(
                offset: const Offset(0, 1),
                child: Container(
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Center(
                      child: Container(
                        width: 50,
                        height: 8,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      )),
                ),
              )),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
              Container(
                  height: MediaQuery.of(context).size.height * 0.55,
                  // height: MediaQuery.of(context).size.height * 0.6,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product.name,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 226, 212, 212),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                widget.product.brand.toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 33, 165, 66),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "\$ " + widget.product.price.toString() + '.00',
                            style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Bio 4 ever.",
                        style: TextStyle(
                          height: 1.5,
                          color: Colors.grey.shade800,
                          fontSize: 15,
                        ),
                      ),
                      /*  const SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Color",
                        style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                      ),
                      */
                      const SizedBox(
                        height: 10,
                      ),
                      /*  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: colors.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedColor = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                color: _selectedColor == index
                                    ? colors[index]
                                    : colors[index].withOpacity(0.5),
                                shape: BoxShape.circle),
                            width: 40,
                            height: 40,
                            child: Center(
                              child: _selectedColor == index
                                  ? const Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    )
                                  : Container(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  */
                      const SizedBox(
                        height: 20,
                      ),
                      /*   Text(
                        'Size',
                        style: TextStyle(color: Colors.grey.shade400, fontSize: 18),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: size.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSize = index;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 500),
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    color: _selectedSize == index
                                        ? const Color.fromARGB(255, 73, 197, 100)
                                        : Colors.grey.shade200,
                                    shape: BoxShape.circle),
                                width: 40,
                                height: 40,
                                child: Center(
                                  child: Text(
                                    size[index],
                                    style: TextStyle(
                                        color: _selectedSize == index
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: 15),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      */
                      const SizedBox(
                        height: 20,
                      ),
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        height: 50,
                        elevation: 0,
                        splashColor: const Color.fromARGB(255, 43, 155, 77),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: const Color.fromARGB(255, 104, 214, 94),
                        child: Center(
                          child: Text(
                            AppLocalizations.translate("addToCard").toString(),
                            style:
                            const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )
                    ],
                  ))
            ])),
      ]),
    );
  }
  Widget build1(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         // brightness: Brightness.dark,
          title: const Text('Détail', style: TextStyle(color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(widget.product.name +' (on detail page)'),
              Text(widget.product.description),
            ],
          ),
        )
    );
  }
}

