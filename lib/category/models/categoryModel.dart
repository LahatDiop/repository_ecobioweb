class CategoryModel {
  late String name;
  late String slug;
  late String imageUrl;

  CategoryModel(
      {required this.name, required this.slug, required this.imageUrl});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    // final Map<String, dynamic> data = new Map<String, dynamic>();
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['slug'] = slug;
    data['image_url'] = imageUrl;
    return data;
  }
}
