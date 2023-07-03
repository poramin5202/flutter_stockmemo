import 'package:StockMemo/model/LoginToDart.dart';
import 'package:StockMemo/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscurePassword = true;
  String? userId;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stock Memo"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
          child: Form(
            child: Column(children: [
              Image.asset("assets/images/logoStockMemo.png"),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  labelText: 'User Id',
                  hintText: 'ป้อน User Id',
                  icon: Image.asset(
                    'assets/images/userid.png',
                    width: 24,
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    userId = value;
                  });
                },
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'ป้อน Password',
                  icon: Image.asset(
                    'assets/images/password.png',
                    width: 24,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(_obscurePassword ? Icons.visibility : Icons.visibility_off),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    password = value;
                  });
                },
                obscureText: _obscurePassword, // กำหนดให้ซ่อน/แสดงรหัสผ่าน
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                    onPressed: () {
                      login();
                    },
                    icon: Icon(Icons.login),
                    label: Text(
                      "Login",
                      style: TextStyle(fontSize: 20),
                    )),
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> login() async {
    String url = 'http://10.0.2.2:8080/stock_memo/stockMemo';
    var res = await http.post(Uri.parse(url), body: "login/$userId/$password");

    if (res.statusCode == 200) {
      LoginDart dataAPI = loginDartFromJson(res.body);

      print(dataAPI.login?[0].usrName);
      print(dataAPI.login?[0].usrStatus);

      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    } else {
      throw Exception('Failed to fetch data');
    }
  }
}
