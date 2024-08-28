// To parse this JSON data, do
//
//     final addUpdateModal = addUpdateModalFromJson(jsonString);

import 'dart:convert';

AddUpdateModal addUpdateModalFromJson(String str) => AddUpdateModal.fromJson(json.decode(str));

String addUpdateModalToJson(AddUpdateModal data) => json.encode(data.toJson());

class AddUpdateModal {
    int? status;
    String? message;

    AddUpdateModal({
        this.status,
        this.message,
    });

    factory AddUpdateModal.fromJson(Map<String, dynamic> json) => AddUpdateModal(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
