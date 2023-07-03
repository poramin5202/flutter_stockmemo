import 'package:StockMemo/model/ProductToDart.dart';
import 'package:flutter/material.dart';

class ProductPageView extends StatefulWidget {
  final Product product;

  const ProductPageView({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductPageView> createState() => _ProductPageViewState();
}

class _ProductPageViewState extends State<ProductPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Data"),
      ),
      body: Container(
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                readOnly: true,
                controller: TextEditingController(text: widget.product.prdtRunningId.toString()),
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
                controller: TextEditingController(text: widget.product.prdtName),
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
                controller: TextEditingController(text: widget.product.prdtCode),
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
                controller: TextEditingController(text: widget.product.prdtModel),
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
                controller: TextEditingController(text: widget.product.prdtUpdateBy),
                decoration: InputDecoration(
                  labelText: 'Update By',
                  hintText: 'ป้อน Update By',
                  icon: Image.asset(
                    'assets/images/update.png',
                    width: 24,
                  ),
                ),
              ),
              TextField(
                readOnly: true,
                controller: TextEditingController(text: widget.product.prdtUpdateDate.toString().substring(0, 10)),
                decoration: InputDecoration(
                  labelText: 'Update Date',
                  hintText: 'ป้อน Update Date',
                  icon: Image.asset(
                    'assets/images/date.png',
                    width: 24,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
