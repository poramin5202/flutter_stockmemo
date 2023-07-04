import 'package:StockMemo/pages/serialPageView.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:http/http.dart' as http;
import 'package:StockMemo/model/PoToDart.dart';
import '../model/SerialToDart.dart';
import '../model/conf.dart';

class SerialSn extends StatefulWidget {
  const SerialSn({super.key});

  @override
  State<SerialSn> createState() => _SerialSnState();
}

class _SerialSnState extends State<SerialSn> {
  final formkey = GlobalKey<FormState>();
  SerialDart? _data;
  final TextEditingController textEditingController = TextEditingController();
  PoDart? _pono;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Serial Search")),
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
                    "SN RunningId",
                    style: TextStyle(fontSize: 20),
                  ),
                  TextFormField(
                    controller: textEditingController,
                    validator: RequiredValidator(errorText: "โปรดใส่ Serial RunningId"),
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
                          formkey.currentState!.save();
                          String userInput = textEditingController.text;
                          getPoNO(userInput);
                          textEditingController.clear();
                          formkey.currentState!.reset();
                        }
                      },
                    ),
                  ),
                  FutureBuilder<SerialDart>(
                    future: getSn(),
                    builder: (BuildContext context, AsyncSnapshot<SerialDart> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        // สถานะการเชื่อมต่อ: กำลังรอ
                        return LinearProgressIndicator();
                      } else if (snapshot.hasError) {
                        // เกิดข้อผิดพลาด
                        return Text('เกิดข้อผิดพลาด: ${snapshot.error}');
                      } else {
                        // สถานะการเชื่อมต่อ: เสร็จสิ้นและได้รับข้อมูล
                        if (snapshot.hasData) {
                          SerialDart data = snapshot.data!;
                          // นำข้อมูลไปแสดงผล
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (data.sn != null)
                                for (Sn sn in data.sn!)
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
                                              builder: (context) => SerialPageView(sn: sn),
                                            ),
                                          );
                                        },
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                          Text("ProductRunningId: ${sn.snRunningId}"),
                                          Text("ProductName: ${sn.snPrdtName}"),
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
                  if (_data?.sn != null)
                    Column(
                      children: _data!.sn!
                          .map((sn) => Column(
                                children: [
                                  Text("SnRemark: ${sn.snRemark}"),
                                  Text("SnRunningId: ${sn.snRunningId}"),
                                  Text("------------------------"),
                                ],
                              ))
                          .toList(),
                    ),
                  if (_pono?.po != null)
                    Column(
                      children: _pono!.po!
                          .map((po) => Column(
                                children: [
                                  Text("PoNo: ${po.poNo}"),
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

  Future<SerialDart> getSn() async {
    String url = 'http://10.0.2.2:8080/stock_memo/stockMemo';
    var res = await http.post(Uri.parse(url), body: "serial");

    if (res.statusCode == 200) {
      SerialDart dataAPI = serialDartFromJson(res.body);
      print(dataAPI.toJson());
      return dataAPI;
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  void getPoNO(String SnRunnigId) async {
     Conf conf = new Conf();
    String system = conf.system;
    String url = '$system';
    var res = await http.post(Uri.parse(url), body: "serial/" + SnRunnigId);

    if (res.statusCode == 200) {
      PoDart dataAPI = poDartFromJson(res.body);
      print(dataAPI.toJson());
      if (dataAPI.po != null) {
        for (Po po in dataAPI.po!) {
          print("SnRemark: ${po.poNo}");
          print("------------------------");
        }
      }
      setState(() {
        _pono = dataAPI;
      });
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
