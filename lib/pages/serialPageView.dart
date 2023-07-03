import 'package:StockMemo/model/SerialToDart.dart';

import 'package:flutter/material.dart';

class SerialPageView extends StatefulWidget {
  final Sn sn;

  const SerialPageView({Key? key, required this.sn}) : super(key: key);

  @override
  State<SerialPageView> createState() => _SerialPageViewState();
}

class _SerialPageViewState extends State<SerialPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Serial Data"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.sn.snRunningId),
                  decoration: InputDecoration(
                    labelText: 'Serial RunningId',
                    hintText: 'ป้อน SerialRunningId',
                    icon: Image.asset(
                      'assets/images/id.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.sn.snPoNo),
                  decoration: InputDecoration(
                    labelText: 'PoNo',
                    hintText: 'ป้อน PoNo',
                    icon: Image.asset(
                      'assets/images/number.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  maxLines: null, // กำหนดให้มีหลายบรรทัด
                  readOnly: true,
                  controller: TextEditingController(text: widget.sn.snProjName),
                  decoration: InputDecoration(
                    labelText: 'ProjectName',
                    hintText: 'ป้อน ProjectName',
                    icon: Image.asset(
                      'assets/images/name.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.sn.snPrdtName),
                  decoration: InputDecoration(
                    labelText: 'Product Name',
                    hintText: 'ป้อน Product Name',
                    icon: Image.asset(
                      'assets/images/name.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.sn.snRemark),
                  decoration: InputDecoration(
                    labelText: 'Remark',
                    hintText: 'ป้อน Remark',
                    icon: Image.asset(
                      'assets/images/description.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.sn.snStatus),
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
                  controller: TextEditingController(text: widget.sn.snWaStartDate.toString().substring(0, 10)),
                  decoration: InputDecoration(
                    labelText: 'WarrantyStartDate',
                    hintText: 'ป้อน WarrantyStartDate',
                    icon: Image.asset(
                      'assets/images/date.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.sn.snWaEndDate.toString().substring(0, 10)),
                  decoration: InputDecoration(
                    labelText: 'WarrantyEndDate',
                    hintText: 'ป้อน WarrantyEndDate',
                    icon: Image.asset(
                      'assets/images/enddate.png',
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
