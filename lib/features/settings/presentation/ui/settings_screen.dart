import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../routes/go_router_notifier.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavSettings'),
      ),
      body: Consumer(builder:(context, ref, child){
        return Center(
          child: ElevatedButton(onPressed: () {
            ref.read(goRouterNotifierProvider).isLoggedIn =false;
          },child: const Text('Sign Out'),),
        );
      })
    );
  }
}
