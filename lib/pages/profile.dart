import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.goNamed('Login'),
              child: const Text('Logout'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () => context.goNamed('Home'),
                child: const Text('Go Home')),
          ],
        ),
      ),
    );
  }
}
