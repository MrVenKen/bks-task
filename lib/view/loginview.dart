// ignore_for_file: prefer_const_constructors

import 'package:bks_case/viewmodel/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/base_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
        Center(
          child: Text('BKS',
          style: TextStyle(
            fontSize: Get.height * 0.05,
            fontWeight: FontWeight.bold,
            ),
            )
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
        TextField(
          controller: _email,
          enableSuggestions: false,
          autocorrect: false,
          textAlign: TextAlign.center,
          style: TextStyle(),
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: 'E-mail',
          ),
        ),    
        SizedBox(
          height: Get.height * 0.02,
        ),
        TextField(
          controller: _password,
          enableSuggestions: false,
          autocorrect: false,
          textAlign: TextAlign.center,
          style: TextStyle(),
          decoration: InputDecoration(
            alignLabelWithHint: true,
            labelText: 'Şifre',
          ),
        ),    
        SizedBox(
          height: Get.height * 0.02,
        ),
        ElevatedButton(
          onPressed: () {},
         child: Text("Giriş Yap / Kayıt Ol"))
      ]),
    );
  }
}