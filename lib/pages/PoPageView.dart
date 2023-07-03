import 'package:StockMemo/model/PoToDart.dart';
import 'package:flutter/material.dart';

class PoPageView extends StatefulWidget {
  final Po po;

  const PoPageView({Key? key, required this.po}) : super(key: key);

  @override
  State<PoPageView> createState() => _PoPageViewState();
}

class _PoPageViewState extends State<PoPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PO Data"),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.po.poRunningId.toString()),
                  decoration: InputDecoration(
                    labelText: 'Product RunningId',
                    hintText: 'ป้อน ProductRunningId',
                    icon: Image.asset(
                      'assets/images/id.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.po.poNo),
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
                  maxLines: null, // กำหนดให้มีหลายบรรทัด
                  readOnly: true,
                  controller: TextEditingController(text: widget.po.poRemark),
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
                  controller: TextEditingController(text: widget.po.poVendorFullname),
                  decoration: InputDecoration(
                    labelText: 'Product Model',
                    hintText: 'ป้อน Product Model',
                    icon: Image.asset(
                      'assets/images/model.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.po.poVendorContact),
                  decoration: InputDecoration(
                    labelText: 'VendorContact',
                    hintText: 'ป้อน VendorContact',
                    icon: Image.asset(
                      'assets/images/phone.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.po.projName),
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
                  controller: TextEditingController(text: widget.po.poDeliveryDate.toString().substring(0, 10)),
                  decoration: InputDecoration(
                    labelText: 'Update Date',
                    hintText: 'ป้อน Update Date',
                    icon: Image.asset(
                      'assets/images/delivery.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.po.poServiceLevel),
                  decoration: InputDecoration(
                    labelText: 'Service Status',
                    hintText: 'ป้อน Service Status',
                    icon: Image.asset(
                      'assets/images/status.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.po.poServiceStartDate.toString().substring(0, 10)),
                  decoration: InputDecoration(
                    labelText: 'ServiceStartDate',
                    hintText: 'ป้อน ServiceStartDate',
                    icon: Image.asset(
                      'assets/images/date.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.po.poServiceEndDate.toString().substring(0, 10)),
                  decoration: InputDecoration(
                    labelText: 'ServiceEndDate',
                    hintText: 'ป้อน ServiceEndDate',
                    icon: Image.asset(
                      'assets/images/enddate.png',
                      width: 24,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
