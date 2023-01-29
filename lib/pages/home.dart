import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
            ElevatedButton(
              onPressed: () => context.goNamed('Login'),
              child: const Text('Logout'),
            ),
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
