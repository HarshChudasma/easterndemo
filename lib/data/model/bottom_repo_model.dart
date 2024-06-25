import 'dart:convert';

BottomRepositoryModel bottomRepositoryModelFromJson(String str) => BottomRepositoryModel.fromJson(json.decode(str));

String bottomRepositoryModelToJson(BottomRepositoryModel data) => json.encode(data.toJson());

class BottomRepositoryModel {
  List<RangeOfPattern>? rangeOfPattern;
  List<DesignOccasion>? designOccasion;
  String status;
  String message;

  BottomRepositoryModel({
    this.rangeOfPattern,
    this.designOccasion,
    this.status = '',
    this.message = '',
  });

  factory BottomRepositoryModel.fromJson(Map<String, dynamic> json) => BottomRepositoryModel(
    rangeOfPattern: json["range_of_pattern"] == null ? [] : List<RangeOfPattern>.from(json["range_of_pattern"].map((x) => RangeOfPattern.fromJson(x))),
    designOccasion: json["design_occasion"] == null ? [] : List<DesignOccasion>.from(json["design_occasion"].map((x) => DesignOccasion.fromJson(x))),
    status: json["status"] ?? '',
    message: json["message"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "range_of_pattern": rangeOfPattern == null ? [] : List<dynamic>.from(rangeOfPattern!.map((x) => x.toJson())),
    "design_occasion": designOccasion == null ? [] : List<dynamic>.from(designOccasion!.map((x) => x.toJson())),
    "status": status,
    "message": message,
  };
}

class DesignOccasion {
  String productId;
  String name;
  String image;
  String subName;
  String cta;

  DesignOccasion({
    this.productId = '',
    this.name = '',
    this.image = '',
    this.subName = '',
    this.cta = '',
  });

  factory DesignOccasion.fromJson(Map<String, dynamic> json) => DesignOccasion(
    productId: json["product_id"] ?? '',
    name: json["name"] ?? '',
    image: json["image"] ?? '',
    subName: json["sub_name"] ?? '',
    cta: json["cta"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "name": name,
    "image": image,
    "sub_name": subName,
    "cta": cta,
  };
}

class RangeOfPattern {
  String productId;
  String image;
  String name;

  RangeOfPattern({
    this.productId = '',
    this.image = '',
    this.name = '',
  });

  factory RangeOfPattern.fromJson(Map<String, dynamic> json) => RangeOfPattern(
    productId: json["product_id"] ?? '',
    image: json["image"] ?? "",
    name: json["name"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "image": image,
    "name": name,
  };
}
