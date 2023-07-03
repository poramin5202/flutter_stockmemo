// To parse this JSON data, do
//
//     final projectDart = projectDartFromJson(jsonString);

import 'dart:convert';

ProjectDart projectDartFromJson(String str) => ProjectDart.fromJson(json.decode(utf8.decode(str.runes.toList())));

String projectDartToJson(ProjectDart data) => json.encode(data.toJson());

class ProjectDart {
  List<Project>? project;

  ProjectDart({
    this.project,
  });

  factory ProjectDart.fromJson(Map<String, dynamic> json) => ProjectDart(
        project: json["Project"] == null ? [] : List<Project>.from(json["Project"]!.map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Project": project == null ? [] : List<dynamic>.from(project!.map((x) => x.toJson())),
      };
}

class Project {
  String? projName;
  DateTime? projStartDate;
  DateTime? projEndDate;
  String? projStatus;
  String? projDesc;
  String? projRunningId;
  String? projDepartment;

  Project({
    this.projName,
    this.projStartDate,
    this.projEndDate,
    this.projStatus,
    this.projDesc,
    this.projRunningId,
    this.projDepartment,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        projName: json["ProjName"],
        projStartDate: json["ProjStartDate"] == null ? null : DateTime.parse(json["ProjStartDate"]),
        projEndDate: json["ProjEndDate"] == null ? null : DateTime.parse(json["ProjEndDate"]),
        projStatus: json["ProjStatus"],
        projDesc: json["ProjDesc"],
        projRunningId: json["ProjRunningId"],
        projDepartment: json["ProjDepartment"],
      );

  Map<String, dynamic> toJson() => {
        "ProjName": projName,
        "ProjStartDate": projStartDate?.toIso8601String(),
        "ProjEndDate": projEndDate?.toIso8601String(),
        "ProjStatus": projStatus,
        "ProjDesc": projDesc,
        "ProjRunningId": projRunningId,
        "ProjDepartment": projDepartment,
      };
}
