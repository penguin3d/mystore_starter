import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../routes/auth_notifier.dart';

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
            Consumer(builder: (context, ref, child) {
              return Center(
                child: ElevatedButton(
                  onPressed: () async {
                    // ref.read(goRouterNotifierProvider).isLoggedIn = false;
                    await FirebaseAuth.instance.signOut();
                  },
                  child: const Text('Sign Out'),
                ),
              );
            }),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () => context.goNamed('root'),
                child: const Text('Go to Root')),
          ],
        ),
      ),
    );
  }
}
