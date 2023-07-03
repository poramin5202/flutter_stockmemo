import 'package:flutter/material.dart';

import '../model/ProjectToDart.dart';

class ProjectPageView extends StatefulWidget {
  final Project project;

  const ProjectPageView({Key? key, required this.project}) : super(key: key);

  @override
  State<ProjectPageView> createState() => _ProjectPageViewState();
}

class _ProjectPageViewState extends State<ProjectPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Project Data"),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                readOnly: true,
                controller: TextEditingController(text: widget.project.projRunningId),
                decoration: InputDecoration(
                  labelText: 'Project RunningId',
                  hintText: 'ป้อน ProjectRunningId',
                  icon: Image.asset(
                    'assets/images/id.png',
                    width: 24,
                  ),
                ),
              ),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: widget.project.projName),
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
                maxLines: null, // กำหนดให้มีหลายบรรทัด
                readOnly: true,
                controller: TextEditingController(text: widget.project.projDesc),
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
                controller: TextEditingController(text: widget.project.projDepartment),
                decoration: InputDecoration(
                  labelText: 'Department',
                  hintText: 'ป้อน Department',
                  icon: Image.asset(
                    'assets/images/deparment.png',
                    width: 24,
                  ),
                ),
              ),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: widget.project.projStatus),
                decoration: InputDecoration(
                  labelText: 'Status',
                  hintText: 'ป้อน Status',
                  icon: Image.asset(
                    'assets/images/status.png',
                    width: 24,
                  ),
                ),
              ),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: widget.project.projStartDate.toString().substring(0, 10)),
                decoration: InputDecoration(
                  labelText: 'Start Date',
                  hintText: 'ป้อน Start Date',
                  icon: Image.asset(
                    'assets/images/date.png',
                    width: 24,
                  ),
                ),
              ),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: widget.project.projEndDate.toString().substring(0, 10)),
                decoration: InputDecoration(
                  labelText: 'End Date',
                  hintText: 'ป้อน End Date',
                  icon: Image.asset(
                    'assets/images/enddate.png',
                    width: 24,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
