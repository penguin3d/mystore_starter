import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import '../../routes/auth_notifier.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Page'),
      ),
      body: Consumer(builder:(context, ref, child){
        return Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.1),
                BlendMode.dstIn,
              ),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            'casual-life-3d-planet-earth-3.png'),
                        fit: BoxFit.cover)),
              ),
            ),
            Center(
              child: ElevatedButton(onPressed: () async {
                // ref.read(goRouterNotifierProvider).isLoggedIn = false;
                await FirebaseAuth.instance.signOut();
              },child: const Text('Sign Out'),),
            ),
          ],
        );
      })
    );
  }
}
