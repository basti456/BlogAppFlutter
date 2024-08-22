// To parse this JSON data, do
//
//     final messageModal = messageModalFromJson(jsonString);

import 'dart:convert';

MessageModal messageModalFromJson(String str) => MessageModal.fromJson(json.decode(str));

String messageModalToJson(MessageModal data) => json.encode(data.toJson());

class MessageModal {
    String? message;

    MessageModal({
        this.message,
    });

    factory MessageModal.fromJson(Map<String, dynamic> json) => MessageModal(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
