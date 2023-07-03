import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:StockMemo/model/ProjectToDart.dart';
import 'package:StockMemo/pages/ProjectPageView.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  final formkey = GlobalKey<FormState>();
  //ProjectDart? _data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project Search")),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Project RunningId",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    validator: RequiredValidator(errorText: "โปรดใส่ Serial No."),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Text(
                        "Search",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        if (formkey.currentState!.validate()) {
                          getSn();
                          formkey.currentState!.save();
                          formkey.currentState!.reset();
                        }
                      },
                    ),
                  ),
                  FutureBuilder<ProjectDart>(
                    future: getSn(),
                    builder: (BuildContext context, AsyncSnapshot<ProjectDart> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // สถานะการเชื่อมต่อ: กำลังรอ
                        return LinearProgressIndicator();
                      } else if (snapshot.hasError) {
                        // เกิดข้อผิดพลาด
                        return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
                      } else {
                        // สถานะการเชื่อมต่อ: เสร็จสิ้นและได้รับข้อมูล

                        if (snapshot.hasData) {
                          ProjectDart data = snapshot.data!;
                          // นำข้อมูลไปแสดงผล
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // แสดงข้อมูลตามต้องการ
                              if (data.project != null)
                                for (Project project in data.project!)
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Divider(
                                        thickness: 2,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => ProjectPageView(project: project),
                                            ),
                                          );
                                        },
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Text("ProjRunningId: ${project.projRunningId}"),
                                          Text("ProjName: ${project.projName}"),
                                          Divider(
                                            thickness: 2,
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                            ],
                          );
                        } else {
                          // ไม่มีข้อมูล
                          return Text('ไม่มีข้อมูล');
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<ProjectDart> getSn() async {
    String url = 'http://10.0.2.2:8080/stock_memo/stockMemo';
    var res = await http.post(Uri.parse(url), body: "project");

    if (res.statusCode == 200) {
      ProjectDart dataAPI = projectDartFromJson(res.body);
      print(dataAPI.toJson());
      return dataAPI;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
