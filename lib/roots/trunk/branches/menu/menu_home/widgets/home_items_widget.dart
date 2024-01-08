import 'package:ecobioweb/roots/trunk/branches/menu/menu_home/provider/home_provider.dart';
import 'package:flutter/material.dart';

import '../../../commun_data_utils/utils/text/app_text.dart';
import '../../../commun_data_utils/utils/theme/app_theme.dart';
import '../components/home_items.dart';




 class HomeItemsWidget extends StatelessWidget {
   HomeItemsWidget({Key? key,this.groups,this.items, required this.item, this.heroSuffix}): super(key: key);

   final List<String>? groups;
   final List<HomeItems>? items;
   final  HomeItems? item;
   final String? heroSuffix;


  // final double width = 174;
  // final double height = 250;

  final double width = 180;
  final double height = 170;

  final Color borderColor = const Color(0xffE2E2E2);
  final double borderRadius = 20;



  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(
          borderRadius,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Expanded(
            //   child: Center(
            //     child: AppText(
            //       text: groups.toString(),
            //       fontSize: 13,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Expanded(
              child: Center(
                child: Hero(
                  tag: "AllItem:${item!.name}-${heroSuffix ?? ""}",
                  child: imageWidget(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppText(
              text:item!.subTitle,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: item!.description,
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF7C7C7C),
            ),
            const SizedBox(
              height: 20,
            ),
            AppText(
              text: item!.category!,
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: const Color(0xFF7C7C7C),
            ),
            // Row(
            //   children: [
            //     AppText(
            //       text: "\$${item.price.toStringAsFixed(2)}",
            //       fontSize: 18,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     const Spacer(),
            //     addWidget()
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Container(
      child: Image.asset(item!.imagePath!),
    );
  }

  Widget addWidget() {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: AppColors.primaryColor),
      child: const Center(
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }


}
