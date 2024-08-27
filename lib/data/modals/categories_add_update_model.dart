// To parse this JSON data, do
//
//     final categoryAddUpdateModal = categoryAddUpdateModalFromJson(jsonString);

import 'dart:convert';

CategoryAddUpdateModal categoryAddUpdateModalFromJson(String str) => CategoryAddUpdateModal.fromJson(json.decode(str));

String categoryAddUpdateModalToJson(CategoryAddUpdateModal data) => json.encode(data.toJson());

class CategoryAddUpdateModal {
    int? status;
    String? message;

    CategoryAddUpdateModal({
        this.status,
        this.message,
    });

    factory CategoryAddUpdateModal.fromJson(Map<String, dynamic> json) => CategoryAddUpdateModal(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
