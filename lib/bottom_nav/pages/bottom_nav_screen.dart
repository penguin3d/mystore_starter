import 'package:flutter/material.dart';

import '../widgets/bottom_navigation_bar.dart';

class BottomNavScreen extends StatefulWidget {
  final Widget child;
  const BottomNavScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
