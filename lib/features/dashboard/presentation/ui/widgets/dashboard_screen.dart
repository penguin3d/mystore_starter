import 'package:flutter/material.dart';

import 'bottom_navigation_bar.dart';

class DashBoardScreen extends StatefulWidget {
  final Widget child;
  const DashBoardScreen({Key? key, required this.child}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
