import 'package:flutter/material.dart';
import 'package:StockMemo/pages/claimPage.dart';
import 'package:StockMemo/pages/issuePage.dart';
import 'package:StockMemo/pages/poPage.dart';
import 'package:StockMemo/pages/ProductPage.dart';
import 'package:StockMemo/pages/serialPage.dart';
import 'package:StockMemo/pages/ProjectPage.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text("Stock Memo")),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset(
              "assets/images/logoStockMemo.png",
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ProjectPage();
                    }));
                  },
                  icon: Image.asset(
                    'assets/images/project.png',
                    width: 24,
                  ),
                  label: Text(
                    "Project.",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ProductPage();
                    }));
                  },
                  icon: Image.asset(
                    'assets/images/product.png',
                    width: 24,
                  ),
                  label: Text(
                    "Product.",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return PoPage();
                    }));
                  },
                  icon: Image.asset(
                    'assets/images/po.png',
                    width: 24,
                  ),
                  label: Text(
                    "PO.",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return IssuePage();
                    }));
                  },
                  icon: Image.asset(
                    'assets/images/issue.png',
                    width: 24,
                  ),
                  label: Text(
                    "Issue.",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return SerialSn();
                    }));
                  },
                  icon: Image.asset(
                    'assets/images/serial.png',
                    width: 24,
                  ),
                  label: Text(
                    "serial.",
                    style: TextStyle(fontSize: 20),
                  )),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return ClaimPage();
                    }));
                  },
                  icon: Image.asset(
                    'assets/images/claim.png',
                    width: 24,
                  ),
                  label: Text(
                    "Claim Product",
                    style: TextStyle(fontSize: 20),
                  )),
            )
          ],
        )),
      ),
    );
  }
}
