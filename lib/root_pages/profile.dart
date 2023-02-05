import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';


import '../routes/auth_notifier.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  final displayName = FirebaseAuth.instance.currentUser?.displayName;
  final phoneNumber = FirebaseAuth.instance.currentUser?.phoneNumber;
  final avatarUrl = FirebaseAuth.instance.currentUser?.photoURL;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const UserAvatar(),
            Consumer(builder: (context, ref, child) {
              return Center(
                child: ElevatedButton(
                  onPressed: () async {
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
