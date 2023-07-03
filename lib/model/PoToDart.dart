// To parse this JSON data, do
//
//     final poDart = poDartFromJson(jsonString);

import 'dart:convert';

PoDart poDartFromJson(String str) => PoDart.fromJson(json.decode(utf8.decode(str.runes.toList())));

String poDartToJson(PoDart data) => json.encode(data.toJson());

class PoDart {
  List<Po>? po;

  PoDart({
    this.po,
  });

  factory PoDart.fromJson(Map<String, dynamic> json) => PoDart(
        po: json["PO"] == null ? [] : List<Po>.from(json["PO"]!.map((x) => Po.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "PO": po == null ? [] : List<dynamic>.from(po!.map((x) => x.toJson())),
      };
}

class Po {
  String? projName;
  DateTime? poServiceStartDate;
  String? poServiceLevel;
  String? poVendorFullname;
  String? poVendorContact;
  String? poNo;
  String? poRunningId;
  DateTime? poDeliveryDate;
  DateTime? poServiceEndDate;
  String? poRemark;

  Po({
    this.projName,
    this.poServiceStartDate,
    this.poServiceLevel,
    this.poVendorFullname,
    this.poVendorContact,
    this.poNo,
    this.poRunningId,
    this.poDeliveryDate,
    this.poServiceEndDate,
    this.poRemark,
  });

  factory Po.fromJson(Map<String, dynamic> json) => Po(
        projName: json["ProjName"],
        poServiceStartDate: json["PoServiceStartDate"] == null ? null : DateTime.parse(json["PoServiceStartDate"]),
        poServiceLevel: json["PoServiceLevel"],
        poVendorFullname: json["PoVendorFullname"],
        poVendorContact: json["PoVendorContact"],
        poNo: json["PoNo"],
        poRunningId: json["PoRunningId"],
        poDeliveryDate: json["PoDeliveryDate"] == null ? null : DateTime.parse(json["PoDeliveryDate"]),
        poServiceEndDate: json["PoServiceEndDate"] == null ? null : DateTime.parse(json["PoServiceEndDate"]),
        poRemark: json["PoRemark"],
      );

  Map<String, dynamic> toJson() => {
        "ProjName": projName,
        "PoServiceStartDate": poServiceStartDate?.toIso8601String(),
        "PoServiceLevel": poServiceLevel,
        "PoVendorFullname": poVendorFullname,
        "PoVendorContact": poVendorContact,
        "PoNo": poNo,
        "PoRunningId": poRunningId,
        "PoDeliveryDate": poDeliveryDate?.toIso8601String(),
        "PoServiceEndDate": poServiceEndDate?.toIso8601String(),
        "PoRemark": poRemark,
      };
}
