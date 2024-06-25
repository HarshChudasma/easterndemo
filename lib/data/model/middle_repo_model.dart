import 'dart:convert';

MiddleRepositoryModel middleRepositoryModelFromJson(String str) => MiddleRepositoryModel.fromJson(json.decode(str));

String middleRepositoryModelToJson(MiddleRepositoryModel data) => json.encode(data.toJson());

class MiddleRepositoryModel {
  List<ShopBy>? shopByCategory;
  List<ShopBy>? shopByFabric;
  List<Unstitched>? unstitched;
  List<BoutiqueCollection>? boutiqueCollection;
  String status;
  String message;

  MiddleRepositoryModel({
    this.shopByCategory,
    this.shopByFabric,
    this.unstitched,
    this.boutiqueCollection,
    this.status = '',
    this.message = '',
  });

  factory MiddleRepositoryModel.fromJson(Map<String, dynamic> json) => MiddleRepositoryModel(
    shopByCategory: json["shop_by_category"] == null ? [] : List<ShopBy>.from(json["shop_by_category"].map((x) => ShopBy.fromJson(x))),
    shopByFabric: json["shop_by_fabric"] == null ? [] : List<ShopBy>.from(json["shop_by_fabric"].map((x) => ShopBy.fromJson(x))),
    unstitched: json["Unstitched"] == null ? [] : List<Unstitched>.from(json["Unstitched"].map((x) => Unstitched.fromJson(x))),
    boutiqueCollection: json["boutique_collection"] == null ? [] : List<BoutiqueCollection>.from(json["boutique_collection"].map((x) => BoutiqueCollection.fromJson(x))),
    status: json["status"] ?? '',
    message: json["message"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "shop_by_category": shopByCategory == null ? [] : List<dynamic>.from(shopByCategory!.map((x) => x.toJson())),
    "shop_by_fabric": shopByFabric == null ? [] : List<dynamic>.from(shopByFabric!.map((x) => x.toJson())),
    "Unstitched": unstitched == null ? [] : List<dynamic>.from(unstitched!.map((x) => x.toJson())),
    "boutique_collection": boutiqueCollection == null ? [] : List<dynamic>.from(boutiqueCollection!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class BoutiqueCollection {
  String bannerImage;
  String name;
  String cta;
  String bannerId;

  BoutiqueCollection({
    this.bannerImage = '',
    this.name = '',
    this.cta= '',
    this.bannerId = '',
  });

  factory BoutiqueCollection.fromJson(Map<String, dynamic> json) => BoutiqueCollection(
    bannerImage: json["banner_image"] ?? '',
    name: json["name"] ?? '',
    cta: json["cta"] ?? '',
    bannerId: json["banner_id"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "banner_image": bannerImage,
    "name": name,
    "cta": cta,
    "banner_id": bannerId,
  };
}

class ShopBy {
  String categoryId;
  String name;
  String tintColor;
  String image;
  String sortOrder;
  String? fabricId;

  ShopBy({
    this.categoryId = '',
    this.name = '',
    this.tintColor = '',
    this.image = '',
    this.sortOrder = '',
    this.fabricId,
  });

  factory ShopBy.fromJson(Map<String, dynamic> json) => ShopBy(
    categoryId: json["category_id"] ?? '',
    name: json["name"] ?? '',
    tintColor: json["tint_color"] ?? '',
    image: json["image"] ?? '',
    sortOrder: json["sort_order"] ?? '',
    fabricId: json["fabric_id"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "name": name,
    "tint_color": tintColor,
    "image": image,
    "sort_order": sortOrder,
    "fabric_id": fabricId,
  };
}

class Unstitched {
  String rangeId;
  String name;
  String description;
  String image;

  Unstitched({
    this.rangeId = '',
    this.name = '',
    this.description = '',
    this.image = '',
  });

  factory Unstitched.fromJson(Map<String, dynamic> json) => Unstitched(
    rangeId: json["range_id"] ?? '',
    name: json["name"] ?? '',
    description: json["description"] ?? '',
    image: json["image"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "range_id": rangeId,
    "name": name,
    "description": description,
    "image": image,
  };
}
