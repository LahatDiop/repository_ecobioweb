class ProductsModels {
  late int count;
  late String next;
  void previous;
  //late String previous;
  late List<Results> results;

  ProductsModels(
      {required this.count,
      required this.next,
      this.previous,
      required this.results});

  ProductsModels.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      // results = new List<Results>();
      // ignore: deprecated_member_use
      results = <Results>[];
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    // data['previous'] = previous;
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}

class Results {
  late String name;
  late String slug;
  late List<String> imageUrls;
  late String priceType;
  late String maxPrice;
  late String minPrice;
  late String minDiscountedPrice;

  Results(
      {required this.name,
      required this.slug,
      required this.imageUrls,
      required this.priceType,
      required this.maxPrice,
      required this.minPrice,
      required this.minDiscountedPrice});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    imageUrls = json['image_urls'].cast<String>();
    priceType = json['price_type'];
    maxPrice = json['max_price'];
    minPrice = json['min_price'];
    minDiscountedPrice = json['min_discounted_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['image_urls'] = imageUrls;
    data['price_type'] = priceType;
    data['max_price'] = maxPrice;
    data['min_price'] = minPrice;
    data['min_discounted_price'] = minDiscountedPrice;
    return data;
  }
}
