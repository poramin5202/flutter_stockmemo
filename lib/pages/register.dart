import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:StockMemo/model/Profile.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile(email: '', password: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("สร้างบัญชีผู้ใช้")),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
              key: formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      validator: MultiValidator([
                        RequiredValidator(errorText: "ใส่อีเมลด้วย"),
                        EmailValidator(errorText: "ใส่เมลให้ถูก")
                      ]),
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (email) {
                        profile.email = email!;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "password",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextFormField(
                      validator:
                          RequiredValidator(errorText: "กรุณาป้อน รหัสผ่าน"),
                      obscureText: true,
                      onSaved: (pass) {
                        profile.password = pass!;
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        child: Text(
                          "Submit",
                          style: TextStyle(fontSize: 20),
                        ),
                        onPressed: () {
                          if (formkey.currentState!.validate()) {
                            formkey.currentState!.save();
                            formkey.currentState!.reset();
                          }
                        },
                      ),
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

