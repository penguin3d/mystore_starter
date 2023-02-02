import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routes/go_router_notifier.dart';

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
        return Center(
          child: ElevatedButton(onPressed: () {
            ref.read(goRouterNotifierProvider).isLoggedIn =false;
          },child: const Text('Sign Out'),),
        );
      })
    );
  }
}
