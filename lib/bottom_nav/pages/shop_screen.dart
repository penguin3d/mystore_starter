import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  State<ShopScreen> createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BottomNavShop'),
      ),
      body: Stack(
        children: [
           Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const UserAvatar(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Shop Screen'),
                    ElevatedButton.icon(
                        onPressed: () {
                          GoRouter.of(context).push('/shop/productDetail/100');
                        },
                        icon: const Icon(Icons.next_plan),
                        label: const Text('Product Detail')),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () => context.goNamed('profile'),
                        child: const Text('Go to Profile')),
                    const SizedBox(height: 10),
                    ElevatedButton(
                        onPressed: () => context.goNamed('root'),
                        child: const Text('Go to Root'))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
