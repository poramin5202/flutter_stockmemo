import 'package:StockMemo/pages/issuePageView.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:StockMemo/model/IssueToDart.dart';

import '../model/conf.dart';

class IssuePage extends StatefulWidget {
  const IssuePage({super.key});

  @override
  State<IssuePage> createState() => _IssuePageState();
}

class _IssuePageState extends State<IssuePage> {
  final formkey = GlobalKey<FormState>();
  IssueDart? _data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Issue Search")),
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
                    "Issue RuningId.",
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
                  FutureBuilder<IssueDart>(
                    future: getSn(),
                    builder: (BuildContext context, AsyncSnapshot<IssueDart> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // สถานะการเชื่อมต่อ: กำลังรอ
                        return LinearProgressIndicator();
                      } else if (snapshot.hasError) {
                        // เกิดข้อผิดพลาด
                        return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
                      } else {
                        // สถานะการเชื่อมต่อ: เสร็จสิ้นและได้รับข้อมูล
                        if (snapshot.hasData) {
                          IssueDart data = snapshot.data!;
                          // นำข้อมูลไปแสดงผล
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (data.issueLogs != null)
                                for (IssueLog issue in data.issueLogs!)
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
                                              builder: (context) => IssuePageView(issue: issue),
                                            ),
                                          );
                                        },
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Text("ProductRunningId: ${issue.issueRunningId}"),
                                          Text("ProductName: ${issue.issueName}"),
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
                  if (_data?.issueLogs != null)
                    Column(
                      children: _data!.issueLogs!
                          .map((issueLogs) => Column(
                                children: [
                                  Text("issueRunningId: ${issueLogs.issueRunningId}"),
                                  Text("issueName: ${issueLogs.issueName}"),
                                  Text("issueProblem: ${issueLogs.issueProblem}"),
                                  Text("------------------------"),
                                ],
                              ))
                          .toList(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<IssueDart> getSn() async {
     Conf conf = new Conf();
    String system = conf.system;
    String url = '$system/stock_memo/stockMemo';
    var res = await http.post(Uri.parse(url), body: "issue");

    if (res.statusCode == 200) {
      IssueDart dataAPI = issueDartFromJson(res.body);
      print(dataAPI.toJson());
      return dataAPI;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
