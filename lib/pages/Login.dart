import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:abp_revisi/component/colors.dart';
import 'package:abp_revisi/component/Button.dart';
import 'package:http/http.dart' as http;
import '/main.dart';
import '/pages/Register.dart';

class Login extends StatelessWidget {
  Login({Key? key,
  }) : super(key: key);
  var email = TextEditingController();
  var password = TextEditingController();

  Future<Map<String, dynamic>> login_user(email,password) async {
    final res = await http.post(
        Uri.parse('http://192.168.2.105:8000/api/login'),
        body: {
          'email' : email,
          'password' : password,
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
                    Text("LOGINNNNNN",
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
                    PasswordTextField(controller: password),

                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: 300,
                        child: ElevatedButton(onPressed: () async{
                          var res = await login_user(email.text, password.text);
                          print(res);
                          if (res['success'] == true) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => home()),
                            );
                          } else if (res['kosong'] == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['msg'])));
                          } else if (res['error'] == false) {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res['msg'])));
                          }

                        },
                          child: Text('LOGIN'),),),
                    Container(
                      width: 300,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      }, child: Text('Sign Up')),
                    )
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
  });

  final TextEditingController controller;


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
        labelText: 'Password',
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
