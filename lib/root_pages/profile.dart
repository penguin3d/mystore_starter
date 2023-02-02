import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../routes/go_router_notifier.dart';

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
            Consumer(builder:(context, ref, child){
              return Center(
                child: ElevatedButton(onPressed: () {
                  ref.read(goRouterNotifierProvider).isLoggedIn =false;
                },child: const Text('Sign Out'),),
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
