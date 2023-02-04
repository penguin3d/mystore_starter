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
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.1),
              BlendMode.dstIn,
            ),
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          '3d-casual-life-online-shopping-2.png'),
                      fit: BoxFit.cover)),
            ),
          ),
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
                    child: const Text('Go to Profile'))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
