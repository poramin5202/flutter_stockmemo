// To parse this JSON data, do
//
//     final serialDart = serialDartFromJson(jsonString);

import 'dart:convert';

SerialDart serialDartFromJson(String str) => SerialDart.fromJson(json.decode(utf8.decode(str.runes.toList())));

String serialDartToJson(SerialDart data) => json.encode(data.toJson());

class SerialDart {
  List<Sn>? sn;

  SerialDart({
    this.sn,
  });

  factory SerialDart.fromJson(Map<String, dynamic> json) => SerialDart(
        sn: json["SN"] == null ? [] : List<Sn>.from(json["SN"]!.map((x) => Sn.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "SN": sn == null ? [] : List<dynamic>.from(sn!.map((x) => x.toJson())),
      };
}

class Sn {
  String? snProjName;
  String? snRemark;
  DateTime? snWaStartDate;
  String? snRunningId;
  DateTime? snWaEndDate;
  String? snStatus;
  String? snPrdtName;
  String? snPoNo;

  Sn({
    this.snProjName,
    this.snRemark,
    this.snWaStartDate,
    this.snRunningId,
    this.snWaEndDate,
    this.snStatus,
    this.snPrdtName,
    this.snPoNo,
  });

  factory Sn.fromJson(Map<String, dynamic> json) => Sn(
        snProjName: json["SnProjName"],
        snRemark: json["SnRemark"],
        snWaStartDate: json["SnWaStartDate"] == null ? null : DateTime.parse(json["SnWaStartDate"]),
        snRunningId: json["SnRunningId"],
        snWaEndDate: json["SnWaEndDate"] == null ? null : DateTime.parse(json["SnWaEndDate"]),
        snStatus: json["SnStatus"],
        snPrdtName: json["SnPrdtName"],
        snPoNo: json["SnPo_No"],
      );

  Map<String, dynamic> toJson() => {
        "SnProjName": snProjName,
        "SnRemark": snRemark,
        "SnWaStartDate": snWaStartDate?.toIso8601String(),
        "SnRunningId": snRunningId,
        "SnWaEndDate": snWaEndDate?.toIso8601String(),
        "SnStatus": snStatus,
        "SnPrdtName": snPrdtName,
        "SnPo_No": snPoNo,
      };
}
