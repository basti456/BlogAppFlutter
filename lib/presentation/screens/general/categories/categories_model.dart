// To parse this JSON data, do
//
//     final categoriesModal = categoriesModalFromJson(jsonString);

import 'dart:convert';

CategoriesModal categoriesModalFromJson(String str) => CategoriesModal.fromJson(json.decode(str));

String categoriesModalToJson(CategoriesModal data) => json.encode(data.toJson());

class CategoriesModal {
    int? status;
    int? categoriesCount;
    List<Category>? categories;

    CategoriesModal({
        this.status,
        this.categoriesCount,
        this.categories,
    });

    factory CategoriesModal.fromJson(Map<String, dynamic> json) => CategoriesModal(
        status: json["status"],
        categoriesCount: json["categories_count"],
        categories: json["categories"] == null ? [] : List<Category>.from(json["categories"]!.map((x) => Category.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "categories_count": categoriesCount,
        "categories": categories == null ? [] : List<dynamic>.from(categories!.map((x) => x.toJson())),
    };
}

class Category {
    int? id;
    String? title;
    String? slug;
    DateTime? createdAt;
    DateTime? updatedAt;

    Category({
        this.id,
        this.title,
        this.slug,
        this.createdAt,
        this.updatedAt,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}
