// // To parse this JSON data, do
// //
// //     final userModel = userModelFromJson(jsonString);

// import 'dart:convert';

// UserModel userModelFromJson(String str) {
//     final jsonData = json.decode(str);
//     return UserModel.fromJson(jsonData);
// }

// String userModelToJson(UserModel data) {
//     final dyn = data.toJson();
//     return json.encode(dyn);
// }

// class UserModel {
//     int? page;
//     int? perPage;
//     int? total;
//     int? totalPages;
//     List<Datum>? data;
//     Support? support;

//     UserModel({
//         this.page,
//         this.perPage,
//         this.total,
//         this.totalPages,
//         this.data,
//         this.support,
//     });

//     factory UserModel.fromJson(Map<String, dynamic> json) => new UserModel(
//         page: json["page"],
//         perPage: json["per_page"],
//         total: json["total"],
//         totalPages: json["total_pages"],
//         data: new List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         support: Support.fromJson(json["support"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "page": page,
//         "per_page": perPage,
//         "total": total,
//         "total_pages": totalPages,
//         "data": new List<dynamic>.from(data.map((x) => x.toJson())),
//         "support": support.toJson(),
//     };
// }

// class Datum {
//     int? id;
//     String? email;
//     String? firstName;
//     String? lastName;
//     String? avatar;

//     Datum({
//         this.id,
//         this.email,
//         this.firstName,
//         this.lastName,
//         this.avatar,
//     });

//     factory Datum.fromJson(Map<String, dynamic> json) => new Datum(
//         id: json["id"],
//         email: json["email"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         avatar: json["avatar"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "first_name": firstName,
//         "last_name": lastName,
//         "avatar": avatar,
//     };
// }

// class Support {
//     String? url;
//     String? text;

//     Support({
//         this.url,
//         this.text,
//     });

//     factory Support.fromJson(Map<String, dynamic> json) => new Support(
//         url: json["url"],
//         text: json["text"],
//     );

//     Map<String, dynamic> toJson() => {
//         "url": url,
//         "text": text,
//     };
// }

import 'dart:convert';

// To parse this JSON data, do
// final userModel = userModelFromJson(jsonString);

UserModel userModelFromJson(String str) {
  final jsonData = json.decode(str);
  return UserModel.fromJson(jsonData);
}

String userModelToJson(UserModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class UserModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<Datum>? data;
  Support? support;

  UserModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "support": support?.toJson(),
      };
}

class Datum {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Datum({
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.avatar,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
      };
}

class Support {
  String? url;
  String? text;

  Support({
    this.url,
    this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
