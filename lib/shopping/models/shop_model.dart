class ShopModel {
  late bool success;
  late String message;
  late int count;
  late List<Data> data;

  ShopModel(
      {required this.success,
      required this.message,
      required this.count,
      required this.data});

  ShopModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    count = json['count'];
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      //data = new List<Data>();
      data = List<Data>.empty(growable: true);
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['count'] = count;
    // if (this.data != null) {
    if (this.data.isNotEmpty) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  late String slug;
  late String contactNumber;
  late String shopName;
  late String shopImage;
  late int approval;
  late String ownerName;

  Data(
      {required this.slug,
      required this.contactNumber,
      required this.shopName,
      required this.shopImage,
      required this.approval,
      required this.ownerName});

  Data.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    contactNumber = json['contact_number'];
    shopName = json['shop_name'];
    shopImage = json['shop_image'];
    approval = json['approval'];
    ownerName = json['owner_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['contact_number'] = contactNumber;
    data['shop_name'] = shopName;
    data['shop_image'] = shopImage;
    data['approval'] = approval;
    data['owner_name'] = ownerName;
    return data;
  }
}
