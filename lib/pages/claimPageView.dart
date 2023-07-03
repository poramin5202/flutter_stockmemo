import 'package:StockMemo/model/ClaimToDart.dart';
import 'package:flutter/material.dart';

class ClaimPageView extends StatefulWidget {
  final ClaimProduct claimProduct;

  const ClaimPageView({Key? key, required this.claimProduct}) : super(key: key);

  @override
  State<ClaimPageView> createState() => _ClaimPageViewState();
}

class _ClaimPageViewState extends State<ClaimPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Data"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.claimProduct.claimRunningId.toString()),
                  decoration: InputDecoration(
                    labelText: 'ClaimProduct RunningId',
                    hintText: 'ป้อน ClaimProduct RunningId',
                    icon: Image.asset(
                      'assets/images/id.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.claimProduct.projName),
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
                  controller: TextEditingController(text: widget.claimProduct.pName),
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
                  controller: TextEditingController(text: widget.claimProduct.claimStatus),
                  decoration: InputDecoration(
                    labelText: 'Claim Status',
                    hintText: 'Claim Status',
                    icon: Image.asset(
                      'assets/images/status.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.claimProduct.claimDamage),
                  decoration: InputDecoration(
                    labelText: 'SN Damage',
                    hintText: 'ป้อน SN Damage',
                    icon: Image.asset(
                      'assets/images/damage.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.claimProduct.claimGood),
                  decoration: InputDecoration(
                    labelText: 'SN Good',
                    hintText: 'ป้อน SN Good',
                    icon: Image.asset(
                      'assets/images/good.png',
                      width: 24,
                    ),
                  ),
                ),
                TextField(
                  readOnly: true,
                  controller: TextEditingController(text: widget.claimProduct.claimClamDate.toString().substring(0, 10)),
                  decoration: InputDecoration(
                    labelText: 'Claim Date',
                    hintText: 'ป้อน Claim Date',
                    icon: Image.asset(
                      'assets/images/date.png',
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
