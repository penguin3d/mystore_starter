import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore_starter/routes/go_router_notifier.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Root'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Consumer(builder: (context, ref, child) {
              return ElevatedButton(
                onPressed: () =>
                    ref.read(goRouterNotifierProvider).isLoggedIn = false,
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
