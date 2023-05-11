class BrandModel {
  late int count;
  late String next;
  late String previous;
  late List<Results> results;

  BrandModel(
      {required this.count,
      required this.next,
      required this.previous,
      required this.results});

  BrandModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    next = json['next'];
    previous = json['previous'];
    if (json['results'] != null) {
      // ignore: deprecated_member_use
      /// results = new List<Results>();
      results = List<Results>.empty(growable: true);
      json['results'].forEach((v) {
        0;
        results.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['next'] = next;
    data['previous'] = previous;
    // if (results != null) {
    if (results.isNotEmpty) {
      data['results'] = results.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  late String name;
  late String slug;
  late String imageUrl;

  Results({required this.name, required this.slug, required this.imageUrl});

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    slug = json['slug'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['slug'] = slug;
    data['image_url'] = imageUrl;
    return data;
  }
}
