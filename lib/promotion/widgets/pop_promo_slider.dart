//import 'package:carousel_pro/carousel_pro.dart';
// ignore: import_of_legacy_library_into_null_safe
//import 'package:carousel_pro/carousel_pro.dart';
// ignore: import_of_legacy_library_into_null_safe
//>>>>>>>import 'package:carousel_pro/carousel_pro.dart';
// ignore_for_file: prefer_const_constructors, unnecessary_new

// import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

//import 'carousel_pro.dart';

class TopPromoSlider extends StatelessWidget {
  const TopPromoSlider({Key? key}) : super(key: key);

  get images => null;

  get child => null;

  //get items => null;

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    BottomNavigationBarItem  items;
    return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
       // child:
    //CarouselSlider(
         // options: CarouselOptions(height: 400.0),
          //items: ['','',''].map((i) {
          // items : [
          //   Image.asset(
          //     "../assets/images/promotion__one.png",
          //     // height: 150,
          //     width: double.infinity,
          //   ),
          //   Image.asset(
          //     "../assets/images/promotion_two.png",
          //     // height: double.infinity,
          //     width: double.infinity,
          //   ),
          //   Image.asset(
          //     "../assets/images/promotion_three.png",
          //     // height: double.infinity,
          //     width: double.infinity,
          //   ),
          // ].map((i) {
          //   return Builder(
          //     builder: (BuildContext context) {
          //       return Container(
          //         width: MediaQuery.of(context).size.width,
          //         margin: EdgeInsets.symmetric(horizontal: 5.0),
          //         decoration: BoxDecoration(color: Colors.amber),
          //
          //         child: Image.asset(
          //           "../assets/images/promotion__one.png",
          //           width: 200,
          //           height: 200,
          //         ),
          //
          //         //  child:Image
          //         /* child: Text(
          //             'text $i',
          //             style: TextStyle(fontSize: 16.0),
          //           )*/
          //       );
          //     },
          //   );
          // }).toList(),
       // )

        // options: null,
        /*dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.purple,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.black54.withOpacity(0.2),
            borderRadius: true,
            radius: const Radius.circular(20),
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true, onImageChange: (int , int ) {  }, onImageTap: (int ) {  }, overlayShadowColors: null, options: null,
            */

        /* Image.asset(
            '../assets/images/promotion_two.png',
            width: 100.0,
            height: 100.0,
          ),
          */
        );

    /*okkkk child: SizedBox(
            height: 150.0,
            width: double.infinity,
            //child: Carousel(
            //  images: [

           // child:  images:[]
            child: Image.asset(
              "../assets/images/promotion_two.png",
              height: double.infinity,
              width: double.infinity,
            ),
             
            
            ));
*/

    /* okkk child: Container(
            // height: 200.0,
            // width: double.infinity,
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              new Card(
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(
                          child: new Image.asset(
                            '../assets/images/promotion__one.png',
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new Container(
                          child: new Image.asset(
                            '../assets/images/promotion_two.png',
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new Container(
                          child: new Image.asset(
                            '../assets/images/promotion_three.png',
                            height: 60.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        new Container(
                          child: new Text('long information text'),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ]))
            */
    //child: new Center(
    /*   child: Row(children: <Widget>[
          Flexible(
              child: Card(
                  child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                new Card(
                    child: new Column(children: <Widget>[
                  new Row(children: <Widget>[
                    Image.asset(
                      "assets/images/promotion__one.png",
                      height: 150,
                      width: double.infinity,
                    ),
                    Image.asset(
                      "assets/images/promotion_two.png",
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    Image.asset(
                      "assets/images/promotion_three.png",
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ])
                ]))
              ])))
        ]));
*/
    /* child: Container(
          height: 150.0,
          width: double.infinity,
          child: Carousel(
            images: [
              Image.asset(
                "assets/images/promotion__one.png",
                height: 150,
                width: double.infinity,
              ),
              Image.asset(
                "assets/images/promotion_two.png",
                height: double.infinity,
                width: double.infinity,
              ),
              Image.asset(
                "assets/images/promotion_three.png",
                height: double.infinity,
                width: double.infinity,
              ),
            ],
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.purple,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.black54.withOpacity(0.2),
            borderRadius: true,
            radius: const Radius.circular(20),
            moveIndicatorFromBottom: 180.0,
            noRadiusForIndicator: true, onImageChange: (int , int ) {  }, onImageTap: (int ) {  }, overlayShadowColors: null,
          )),*/
  }
}
