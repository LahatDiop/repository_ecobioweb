
import 'package:flutter/material.dart';

import '../../home/components/brandHomePage.dart';
import '../../home/components/shopHomePage.dart';
import '../../navigation_bar/widgets/bottomNavBarWidget.dart';
import '../../search/widgets/search_widget.dart';
import 'categorySlider.dart';

class SubCategoryScreen extends StatelessWidget {
  String slug;

  SubCategoryScreen({Key? key, required this.slug}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: appBarWidget(context),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: Container(color: Colors.red),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const SearchWidget(),
              SizedBox(
                height: 10,
                child: Container(
                  color: const Color(0xFFf5f6f7),
                ),
              ),
              const PreferredSize(
                preferredSize: Size.fromHeight(50.0),
                child: TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(
                      text: 'Sub Categories',
                    ),
                    Tab(
                      text: 'Brands',
                    ),
                    Tab(
                      text: 'Shops',
                    )
                  ], // list of tabs
                ),
              ),
              SizedBox(
                height: 10,
                child: Container(
                  color: const Color(0xFFf5f6f7),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      color: Colors.white24,
                      child: CategoryPage(
                          slug: 'categories/?parent=$slug', isSubList: true),
                    ),
                    Container(
                      color: Colors.white24,
                      child: BrandHomePage(
                        slug: 'brands/?limit=20&page=1&category=$slug',
                        isSubList: true,
                      ),
                    ),
                    Container(
                      color: Colors.white24,
                      child: ShopHomePage(
                        slug: 'category/shops/$slug/?page=1&limit=15',
                        isSubList: true,
                      ),
                    ) // class name
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: const BottomNavBarWidget(),
      ),
    );
  }
}
