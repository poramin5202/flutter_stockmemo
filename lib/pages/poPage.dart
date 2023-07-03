import 'package:StockMemo/pages/PoPageView.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:StockMemo/model/PoToDart.dart';

import '../model/conf.dart';

class PoPage extends StatefulWidget {
  const PoPage({super.key});

  @override
  State<PoPage> createState() => _PoPageState();
}

class _PoPageState extends State<PoPage> {
  final formkey = GlobalKey<FormState>();
  PoDart? _data;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PO Search")),
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
                    "PO RunningId.",
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
                  FutureBuilder<PoDart>(
                    future: getSn(),
                    builder: (BuildContext context, AsyncSnapshot<PoDart> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // สถานะการเชื่อมต่อ: กำลังรอ
                        return LinearProgressIndicator();
                      } else if (snapshot.hasError) {
                        // เกิดข้อผิดพลาด
                        return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
                      } else {
                        // สถานะการเชื่อมต่อ: เสร็จสิ้นและได้รับข้อมูล
                        if (snapshot.hasData) {
                          PoDart data = snapshot.data!;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (data.po != null)
                                for (Po po in data.po!)
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
                                              builder: (context) => PoPageView(po: po),
                                            ),
                                          );
                                        },
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Text("ProductRunningId: ${po.poRunningId}"),
                                          Text("ProductName: ${po.projName}"),
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
                  if (_data?.po != null)
                    Column(
                      children: _data!.po!
                          .map((po) => Column(
                                children: [
                                  Text("PoRunningId: ${po.poRunningId}"),
                                  Text("PoNo: ${po.poNo}"),
                                  Text("PoRemark: ${po.poRemark}"),
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

  Future<PoDart> getSn() async {
     Conf conf = new Conf();
    String system = conf.system;
    String url = '$system/stock_memo/stockMemo';
    var res = await http.post(Uri.parse(url), body: "po");

    if (res.statusCode == 200) {
      PoDart dataAPI = poDartFromJson(res.body);
      print(dataAPI.toJson());

      return dataAPI;
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
