
class ProductDetails {
  late bool success;
  late String message;
  late Data data;

  ProductDetails(
      {required this.success, required this.message, required this.data});

  ProductDetails.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
  //data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    data['data'] = this.data.toJson();
    return data;
  }
}

class Data {
  late List<Attributes> attributes;
  late List<ProductVariants> productVariants;
  late List<ProductSpecifications> productSpecifications;

  Data(
      {required this.attributes,
      required this.productVariants,
      required this.productSpecifications});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['attributes'] != null) {
      // ignore: deprecated_member_use
      //attributes = List<Attributes>();
      attributes = List<Attributes>.empty(growable: true);
      json['attributes'].forEach((v) {
        attributes.add(Attributes.fromJson(v));
      });
    }
    if (json['product_variants'] != null) {
      // ignore: deprecated_member_use
      //productVariants = List<ProductVariants>();
      productVariants = List<ProductVariants>.empty(growable: true);
      json['product_variants'].forEach((v) {
        productVariants.add(ProductVariants.fromJson(v));
      });
    }
    if (json['product_specifications'] != null) {
      // productSpecifications = List<ProductSpecifications>();
      // ignore: deprecated_member_use
      productSpecifications = List<ProductSpecifications>.empty(growable: true);
      json['product_specifications'].forEach((v) {
        productSpecifications.add(ProductSpecifications.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attributes'] = attributes.map((v) => v.toJson()).toList();
    data['product_variants'] =
        productVariants.map((v) => v.toJson()).toList();
    data['product_specifications'] =
        productSpecifications.map((v) => v.toJson()).toList();
    return data;
  }
}

class Attributes {
  late String attributeSlug;
  late String attributeName;
  late List<AttributeValues> attributeValues;

  Attributes(
      {required this.attributeSlug,
      required this.attributeName,
      required this.attributeValues});

  Attributes.fromJson(Map<String, dynamic> json) {
    attributeSlug = json['attribute_slug'];
    attributeName = json['attribute_name'];
    if (json['attribute_values'] != null) {
      // attributeValues = List<AttributeValues>();
      attributeValues = List<AttributeValues>.empty(growable: true);
      json['attribute_values'].forEach((v) {
        attributeValues.add(AttributeValues.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attribute_slug'] = attributeSlug;
    data['attribute_name'] = attributeName;
    data['attribute_values'] =
        attributeValues.map((v) => v.toJson()).toList();
    return data;
  }
}

class AttributeValues {
  late String value;
  late int key;

  AttributeValues({required this.value, required this.key});

  AttributeValues.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    key = json['key'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['key'] = key;
    return data;
  }
}

class ProductVariants {
  late String sku;
  late int variantId;
  late String productName;
  late int approved;
  late dynamic minPrice;
  late dynamic maxPrice;
  late String productDescription;
  late String brandName;
  late String brandSlug;
  late String categorySlug;
  late int categoryId;
  late String categoryName;
  late List<int> attributeValues;
  late List<String> productImages;
  late String colorImage;

  ProductVariants(
      {required this.sku,
      required this.variantId,
      required this.productName,
      required this.approved,
      this.minPrice,
      this.maxPrice,
      required this.productDescription,
      required this.brandName,
      required this.brandSlug,
      required this.categorySlug,
      required this.categoryId,
      required this.categoryName,
      required this.attributeValues,
      required this.productImages,
      required this.colorImage});

  ProductVariants.fromJson(Map<String, dynamic> json) {
    sku = json['sku'];
    variantId = json['variant_id'];
    productName = json['product_name'];
    approved = json['approved'];
    minPrice = json['min_price'];
    maxPrice = json['max_price'];
    productDescription = json['product_description'];
    brandName = json['brand_name'];
    brandSlug = json['brand_slug'];
    categorySlug = json['category_slug'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    attributeValues = json['attribute_values'].cast<int>();
    productImages = json['product_images'].cast<String>();
    colorImage = json['color_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sku'] = sku;
    data['variant_id'] = variantId;
    data['product_name'] = productName;
    data['approved'] = approved;
    data['min_price'] = minPrice;
    data['max_price'] = maxPrice;
    data['product_description'] = productDescription;
    data['brand_name'] = brandName;
    data['brand_slug'] = brandSlug;
    data['category_slug'] = categorySlug;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['attribute_values'] = attributeValues;
    data['product_images'] = productImages;
    data['color_image'] = colorImage;
    return data;
  }
}

class ProductSpecifications {
  late int id;
  late String specificationName;
  late String specificationValue;

  ProductSpecifications(
      {required this.id,
      required this.specificationName,
      required this.specificationValue});

  ProductSpecifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    specificationName = json['specification_name'];
    specificationValue = json['specification_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['specification_name'] = specificationName;
    data['specification_value'] = specificationValue;
    return data;
  }
}
