import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final int id;
  const ProductDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
        centerTitle: true,
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
                          'casual-life-3d-young-man-online-shopping-for-sneakers-on-his-smartphone.png'),
                      fit: BoxFit.cover)),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Product Detail : ${widget.id}'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
