import 'package:flutter/material.dart';

import '../../../commun_data_utils/utils/text/app_text.dart';
import '../../../commun_data_utils/utils/theme/app_theme.dart';


class GroceryFeaturedItem {
  final String name;
  final String imagePath;

  GroceryFeaturedItem(this.name, this.imagePath);
}

var groceryFeaturedItems = [
  GroceryFeaturedItem("Pulses", "assets/images/agriculture/agriculture_8.png"),
  GroceryFeaturedItem("Rise", "assets/images/agriculture/agriculture_11.png"),
  // GroceryFeaturedItem("Pulses", "../assets/images/pulses.png"),
  // GroceryFeaturedItem("Rise", "../assets/images/rise.png"),
];

class GroceryFeaturedCard extends StatelessWidget {
  const GroceryFeaturedCard(this.groceryFeaturedItem, {this.color = AppColors.primaryColor});

  final GroceryFeaturedItem groceryFeaturedItem;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 105,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 17),
      decoration: BoxDecoration(
          color: color.withOpacity(0.25),
          borderRadius: BorderRadius.circular(18)),
      child: Row(
        children: [
          Image(
            image: AssetImage(groceryFeaturedItem.imagePath),
          ),
          SizedBox(
            width: 15,
          ),
          AppText(
            text: groceryFeaturedItem.name,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    );
  }
}
