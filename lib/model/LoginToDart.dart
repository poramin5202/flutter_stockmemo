// To parse this JSON data, do
//
//     final loginDart = loginDartFromJson(jsonString);

import 'dart:convert';

LoginDart loginDartFromJson(String str) => LoginDart.fromJson(json.decode(utf8.decode(str.runes.toList())));

String loginDartToJson(LoginDart data) => json.encode(data.toJson());

class LoginDart {
  List<Login>? login;

  LoginDart({
    this.login,
  });

  factory LoginDart.fromJson(Map<String, dynamic> json) => LoginDart(
        login: json["Login"] == null ? [] : List<Login>.from(json["Login"]!.map((x) => Login.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Login": login == null ? [] : List<dynamic>.from(login!.map((x) => x.toJson())),
      };
}

class Login {
  String? usrName;
  String? usrStatus;

  Login({
    this.usrName,
    this.usrStatus,
  });

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        usrName: json["UsrName"],
        usrStatus: json["UsrStatus"],
      );

  Map<String, dynamic> toJson() => {
        "UsrName": usrName,
        "UsrStatus": usrStatus,
      };
}
