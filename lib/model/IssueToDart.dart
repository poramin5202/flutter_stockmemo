// To parse this JSON data, do
//
//     final issueDart = issueDartFromJson(jsonString);

import 'dart:convert';

IssueDart issueDartFromJson(String str) => IssueDart.fromJson(json.decode(utf8.decode(str.runes.toList())));

String issueDartToJson(IssueDart data) => json.encode(data.toJson());

class IssueDart {
    List<IssueLog>? issueLogs;

    IssueDart({
        this.issueLogs,
    });

    factory IssueDart.fromJson(Map<String, dynamic> json) => IssueDart(
        issueLogs: json["IssueLogs"] == null ? [] : List<IssueLog>.from(json["IssueLogs"]!.map((x) => IssueLog.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "IssueLogs": issueLogs == null ? [] : List<dynamic>.from(issueLogs!.map((x) => x.toJson())),
    };
}

class IssueLog {
    String? projName;
    String? issueDescription;
    String? issueProblem;
    String? issuePriority;
    String? issueName;
    DateTime? issueFixDate;
    String? issueRunningId;
    DateTime? issueDate;
    String? ownerFullname;
    String? issueSolution;
    String? issueStatus;

    IssueLog({
        this.projName,
        this.issueDescription,
        this.issueProblem,
        this.issuePriority,
        this.issueName,
        this.issueFixDate,
        this.issueRunningId,
        this.issueDate,
        this.ownerFullname,
        this.issueSolution,
        this.issueStatus,
    });

    factory IssueLog.fromJson(Map<String, dynamic> json) => IssueLog(
        projName: json["ProjName"],
        issueDescription: json["IssueDescription"],
        issueProblem: json["IssueProblem"],
        issuePriority: json["IssuePriority("],
        issueName: json["IssueName"],
        issueFixDate: json["IssueFixDate"] == null ? null : DateTime.parse(json["IssueFixDate"]),
        issueRunningId: json["IssueRunningId"],
        issueDate: json["IssueDate"] == null ? null : DateTime.parse(json["IssueDate"]),
        ownerFullname: json["OwnerFullname"],
        issueSolution: json["IssueSolution"],
        issueStatus: json["IssueStatus"],
    );

    Map<String, dynamic> toJson() => {
        "ProjName": projName,
        "IssueDescription": issueDescription,
        "IssueProblem": issueProblem,
        "IssuePriority(": issuePriority,
        "IssueName": issueName,
        "IssueFixDate": issueFixDate?.toIso8601String(),
        "IssueRunningId": issueRunningId,
        "IssueDate": issueDate?.toIso8601String(),
        "OwnerFullname": ownerFullname,
        "IssueSolution": issueSolution,
        "IssueStatus": issueStatus,
    };
}
