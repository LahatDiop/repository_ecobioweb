

___/// MAP :
children: categoryItemsDemo.asMap().entries.map<Widget>((e) {


Widget getStaggeredGridView(BuildContext context) {
return SingleChildScrollView(
padding: EdgeInsets.symmetric(
vertical: 10,
),
child: StaggeredGrid.count(
crossAxisCount: 2,
children: categoryItemsDemo.asMap().entries.map<Widget>((e) {
int index = e.key;
CategoryItem categoryItem = e.value;
return GestureDetector(
onTap: () {
onCategoryItemClicked(context, categoryItem);
},
child: Container(
padding: EdgeInsets.all(10),
child: CategoryItemCardWidget(
item: categoryItem,
color: gridColors[index % gridColors.length],
),
),
);
}).toList(),
mainAxisSpacing: 3.0,
crossAxisSpacing: 4.0, // add some space
),
);
}

-------------------------------------------------

//// LIST:

@override
Widget build(BuildContext context) {
return Scaffold(
body: SafeArea(
child: SingleChildScrollView(
child: Column(
children: [
SizedBox(
height: 25,
),
Text(
"My Cart",
style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
),
SizedBox(
height: 20,
),
Column(
children: getChildrenWithSeperator(
addToLastChild: false,
widgets: demoItems.map((e) {
return Container(
padding: EdgeInsets.symmetric(
horizontal: 25,
),
width: double.maxFinite,
child: ChartItemWidget(
item: e,
),
);
}).toList(),
seperator: Padding(
padding: const EdgeInsets.symmetric(
horizontal: 25,
),
child: Divider(
thickness: 1,
),
),
),
),
Divider(
thickness: 1,
),
getCheckoutButton(context)
],
),
),
),
);
}___

