import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:abp_revisi/component/colors.dart';
import 'package:abp_revisi/component/Button.dart';
import 'package:http/http.dart' as http;
import '/main.dart';
import '/pages/Login.dart';

class Register extends StatelessWidget {
  Register({Key? key,
  }) : super(key: key);
  var email = TextEditingController();
  var name = TextEditingController();
  var password = TextEditingController();
  var cpassword = TextEditingController();

  Future<Map<String, dynamic>> regis_user(email,name,password,cpassword) async {
    final res = await http.post(
        Uri.parse('http://192.168.2.105:8000/api/register'),
        body: {
          'email' : email,
          'name' : name,
          'password' : password,
          'cpassword' : cpassword,
        });
    if(res.statusCode == 200){
      return jsonDecode(res.body);
    }else{
      throw Exception('Failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: Container(
                width: 300,
                padding: EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Column(
                  children: [
                    Text("REGISSSSS",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Email",
                      ),
                      controller: email,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Username",
                      ),
                      controller: name,
                    ),
                    PasswordTextField(controller: password, label: 'Password',),
                    PasswordTextField(controller: cpassword, label: 'Confirm password',),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: 300,
                      child: ElevatedButton(onPressed: () async{
                        var res = await regis_user(email.text,name.text, password.text,cpassword.text);
                        print(res);
                        if (res['success'] == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Login()),
                          );
                        } else if (res['kosong'] == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['msg'])));
                        } else if (res['sudah'] == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['msg'])));
                        } else if (res['sesuai'] == false) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['msg'])));
                        }

                      },
                        child: Text('SIGNUP'),),)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordTextField extends StatefulWidget {
  PasswordTextField({Key? key,
    required this.controller,
    required this.label,

  });

  final TextEditingController controller;
  final String label;


  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _obscureText = true;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      decoration: InputDecoration(
        labelText: widget.label,
        suffixIcon: GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
        ),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a password.';
        }
        return null;
      },
      controller: widget.controller,
    );
  }
}
