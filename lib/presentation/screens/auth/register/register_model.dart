import 'dart:convert';

RegisterModal registerModalFromJson(String str) => RegisterModal.fromJson(json.decode(str));

String registerModalToJson(RegisterModal data) => json.encode(data.toJson());

class RegisterModal {
    Data? data;
    String? accessToken;
    String? tokenType;
    List<String>? emailErrors;

    RegisterModal({
        this.data,
        this.accessToken,
        this.tokenType,
        this.emailErrors,
    });

    factory RegisterModal.fromJson(Map<String, dynamic> json) => RegisterModal(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        emailErrors: json["email"] != null ? List<String>.from(json["email"].map((x) => x)) : null,
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "access_token": accessToken,
        "token_type": tokenType,
        "email": emailErrors != null ? List<dynamic>.from(emailErrors!.map((x) => x)) : null,
    };
}

class Data {
    String? name;
    String? email;
    DateTime? updatedAt;
    DateTime? createdAt;
    int? id;
    String? profilePhotoUrl;

    Data({
        this.name,
        this.email,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.profilePhotoUrl,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        email: json["email"],
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        id: json["id"],
        profilePhotoUrl: json["profile_photo_url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "profile_photo_url": profilePhotoUrl,
    };
}
