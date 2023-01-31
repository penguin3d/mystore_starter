import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../providers/authstatenotifier.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () => ref.read(authStateProvider.notifier).logOut(context),
                child: const Text('Logout'),
              );
            }),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: () => context.goNamed('Profile'),
                child: const Text('Go to Profile'))
          ],
        ),
      ),
    );
  }
}
