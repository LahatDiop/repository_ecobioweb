import 'package:flutter/material.dart';
import '../../../../../commun_data_utils/utils/text/app_text.dart';
import '../../../../../commun_data_utils/utils/theme/app_theme.dart';
import '../components/admin_items.dart';

 class AdminItemsWidget extends StatelessWidget {
   AdminItemsWidget({Key? key,this.groups, this.items,required this.item, this.heroSuffix}): super(key: key);

   final List<String>? groups;
  final List<AdminItems>? items;
   final  AdminItems? item;
   final String? heroSuffix;

  // final double width = 174;
  // final double height = 250;

  final double width = 180;
  final double height = 250;

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

            // padded(subTitle("Admin")),
            Expanded(
              child: Center(
                child: Hero(
                  tag: "AllItem:" + item!.name + "-" + (heroSuffix ?? ""),
                  child: imageWidget(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            AppText(
              text: item!.subTitle!,
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

   Widget padded(Widget widget) {
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 25),
       child: widget,
     );
   }

   Widget subTitle(String text) {
     return Row(
       children: [
         Text(
           text,
           style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
         ),
         const Spacer(),
         const Text(
           "ADMIN LAHAT",
           style: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.bold,
               color: AppColors.primaryColor),
         ),
       ],
     );
   }

}
