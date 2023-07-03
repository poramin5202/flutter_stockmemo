import 'package:StockMemo/model/IssueToDart.dart';
import 'package:flutter/material.dart';

class IssuePageView extends StatefulWidget {
  final IssueLog issue;

  const IssuePageView({Key? key, required this.issue}) : super(key: key);

  @override
  State<IssuePageView> createState() => _IssuePageViewState();
}

class _IssuePageViewState extends State<IssuePageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IssueLogs Data"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.issue.issueRunningId.toString()),
                  decoration: InputDecoration(
                    labelText: 'Issue RunningId',
                    hintText: 'ป้อน IssuetRunningId',
                    icon: Image.asset(
                      'assets/images/id.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.issue.issueName),
                  decoration: InputDecoration(
                    labelText: 'Issue Name',
                    hintText: 'ป้อน Issue Name',
                    icon: Image.asset(
                      'assets/images/name.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  maxLines: null, // กำหนดให้มีหลายบรรทัด
                  readOnly: true,
                  controller: TextEditingController(text: widget.issue.issueDescription),
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'ป้อน Description',
                    icon: Image.asset(
                      'assets/images/description.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.issue.projName),
                  decoration: InputDecoration(
                    labelText: 'Project Name',
                    hintText: 'ป้อน Project Name',
                    icon: Image.asset(
                      'assets/images/name.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.issue.issueStatus),
                  decoration: InputDecoration(
                    labelText: 'Issue Status',
                    hintText: 'ป้อน Issue Status',
                    icon: Image.asset(
                      'assets/images/status.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.issue.issuePriority),
                  decoration: InputDecoration(
                    labelText: 'Priority',
                    hintText: 'ป้อน Priority',
                    icon: Image.asset(
                      'assets/images/priority.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.issue.issueDate.toString().substring(0, 10)),
                  decoration: InputDecoration(
                    labelText: 'Issue Date',
                    hintText: 'ป้อน Issue Date',
                    icon: Image.asset(
                      'assets/images/date.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.issue.issueFixDate.toString().substring(0, 10)),
                  decoration: InputDecoration(
                    labelText: 'Update Date',
                    hintText: 'ป้อน Update Date',
                    icon: Image.asset(
                      'assets/images/date.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  maxLines: null,
                  controller: TextEditingController(text: widget.issue.issueProblem),
                  decoration: InputDecoration(
                    labelText: 'Problem',
                    hintText: 'ป้อน Problem',
                    icon: Image.asset(
                      'assets/images/problem.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.issue.issueSolution),
                  decoration: InputDecoration(
                    labelText: 'Solution',
                    hintText: 'ป้อน Solution',
                    icon: Image.asset(
                      'assets/images/solution.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.issue.ownerFullname),
                  decoration: InputDecoration(
                    labelText: 'OwnerFullname',
                    hintText: 'ป้อน OwnerFullname',
                    icon: Image.asset(
                      'assets/images/owner.png',
                      width: 24,
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
