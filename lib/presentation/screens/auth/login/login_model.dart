// To parse this JSON data, do
//
//     final loginModal = loginModalFromJson(jsonString);

import 'dart:convert';

LoginModal loginModalFromJson(String str) => LoginModal.fromJson(json.decode(str));

String loginModalToJson(LoginModal data) => json.encode(data.toJson());

class LoginModal {
    String? message;
    String? accessToken;
    String? tokenType;

    LoginModal({
        this.message,
        this.accessToken,
        this.tokenType,
    });

    factory LoginModal.fromJson(Map<String, dynamic> json) => LoginModal(
        message: json["message"],
        accessToken: json["access_token"],
        tokenType: json["token_type"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "access_token": accessToken,
        "token_type": tokenType,
    };
}

