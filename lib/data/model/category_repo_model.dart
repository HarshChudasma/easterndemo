import 'dart:convert';

CategoryRepositoryModel categoryRepositoryModelFromJson(String str) => CategoryRepositoryModel.fromJson(json.decode(str));

String categoryRepositoryModelToJson(CategoryRepositoryModel data) => json.encode(data.toJson());

class CategoryRepositoryModel {
  List<Category>? categories;
  String bannerImage;
  String status;
  String message;

  CategoryRepositoryModel({
    this.categories,
    this.bannerImage = '',
    this.status = '',
    this.message =' ',
  });

  factory CategoryRepositoryModel.fromJson(Map<String, dynamic> json) => CategoryRepositoryModel(
    categories:json["categories"] == null ? [] : List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
    bannerImage: json["banner_image"] ?? '',
    status: json["status"] ?? '',
    message: json["message"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    "banner_image": bannerImage,
    "status": status,
    "message": message,
  };
}

class Category {
  String categoryId;
  String categoryName;
  String parentId;
  List<Child>? child;

  Category({
    this.categoryId = '',
    this.categoryName = '',
    this.parentId = '',
    this.child,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryId: json["category_id"] ?? '',
    categoryName: json["category_name"] ?? '',
    parentId: json["parent_id"] ?? '',
    child: json["child"] == null ? [] : List<Child>.from(json["child"]!.map((x) => Child.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "parent_id": parentId,
    "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x.toJson())),
  };
}

class Child {
  String categoryId;
  String categoryName;
  String parentId;

  Child({
    this.categoryId = '',
    this.categoryName = '',
    this.parentId = '',
  });

  factory Child.fromJson(Map<String, dynamic> json) => Child(
    categoryId: json["category_id"] ?? '',
    categoryName: json["category_name"] ?? '',
    parentId: json["parent_id"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "parent_id": parentId,
  };

}