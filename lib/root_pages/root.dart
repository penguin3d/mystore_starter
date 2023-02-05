import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore_starter/routes/auth_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300]!,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Root'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const UserAvatar(),
            Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () async {
                  // ref.read(goRouterNotifierProvider).isLoggedIn = false;
                  await FirebaseAuth.instance.signOut();
                  },
                child: const Text('Sign Out'),
              );
            }),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () => context.goNamed('profile'),
                child: const Text('Go to Profile')),
          ],
        ),
      ),
    );
  }
}
