import 'package:StockMemo/pages/claimPageView.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:StockMemo/model/ClaimToDart.dart';

class ClaimPage extends StatefulWidget {
  const ClaimPage({super.key});

  @override
  State<ClaimPage> createState() => _ClaimPageState();
}

class _ClaimPageState extends State<ClaimPage> {
  final formkey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Claim Search")),
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
                    "ClaimProduct RunningId.",
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
                  FutureBuilder<ClaimDart>(
                    future: getSn(),
                    builder: (BuildContext context, AsyncSnapshot<ClaimDart> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // สถานะการเชื่อมต่อ: กำลังรอ
                        return LinearProgressIndicator();
                      } else if (snapshot.hasError) {
                        // เกิดข้อผิดพลาด
                        return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
                      } else {
                        // สถานะการเชื่อมต่อ: เสร็จสิ้นและได้รับข้อมูล
                        if (snapshot.hasData) {
                          ClaimDart data = snapshot.data!;
                          // นำข้อมูลไปแสดงผล
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (data.claimProduct != null)
                                for (ClaimProduct claimProduct in data.claimProduct!)
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
                                              builder: (context) => ClaimPageView(claimProduct: claimProduct),
                                            ),
                                          );
                                        },
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Text("CliamProductRunningId: ${claimProduct.claimRunningId}"),
                                          Text("ProjectName: ${claimProduct.projName}"),
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

  Future<ClaimDart> getSn() async {
    String url = 'http://10.0.2.2:8080/stock_memo/stockMemo';
    var res = await http.post(Uri.parse(url), body: "claim");

    if (res.statusCode == 200) {
      ClaimDart dataAPI = claimDartFromJson(res.body);
      print(dataAPI.toJson());
      return dataAPI;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
