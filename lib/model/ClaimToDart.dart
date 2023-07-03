// To parse this JSON data, do
//
//     final claimDart = claimDartFromJson(jsonString);

import 'dart:convert';

ClaimDart claimDartFromJson(String str) => ClaimDart.fromJson(json.decode(utf8.decode(str.runes.toList())));

String claimDartToJson(ClaimDart data) => json.encode(data.toJson());

class ClaimDart {
  List<ClaimProduct>? claimProduct;

  ClaimDart({
    this.claimProduct,
  });

  factory ClaimDart.fromJson(Map<String, dynamic> json) => ClaimDart(
        claimProduct: json["ClaimProduct"] == null ? [] : List<ClaimProduct>.from(json["ClaimProduct"]!.map((x) => ClaimProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ClaimProduct": claimProduct == null ? [] : List<dynamic>.from(claimProduct!.map((x) => x.toJson())),
      };
}

class ClaimProduct {
  String? projName;
  String? claimDamage;
  DateTime? claimClamDate;
  String? pName;
  String? claimStatus;
  String? claimRunningId;
  String? claimGood;

  ClaimProduct({
    this.projName,
    this.claimDamage,
    this.claimClamDate,
    this.pName,
    this.claimStatus,
    this.claimRunningId,
    this.claimGood,
  });

  factory ClaimProduct.fromJson(Map<String, dynamic> json) => ClaimProduct(
        projName: json["ProjName"],
        claimDamage: json["ClaimDamage"],
        claimClamDate: json["ClaimClamDate"] == null ? null : DateTime.parse(json["ClaimClamDate"]),
        pName: json["pName"],
        claimStatus: json["ClaimStatus"],
        claimRunningId: json["ClaimRunningId"],
        claimGood: json["ClaimGood"],
      );

  Map<String, dynamic> toJson() => {
        "ProjName": projName,
        "ClaimDamage": claimDamage,
        "ClaimClamDate": claimClamDate?.toIso8601String(),
        "pName": pName,
        "ClaimStatus": claimStatus,
        "ClaimRunningId": claimRunningId,
        "ClaimGood": claimGood,
      };
}
