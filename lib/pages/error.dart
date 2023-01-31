import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key, required this.errorMsg}) : super(key: key);
  final String errorMsg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('My Own Error Route'),
      ),
      body: Center(
        child: Text(errorMsg, textAlign: TextAlign.center,),
      ),
    );
  }
}
