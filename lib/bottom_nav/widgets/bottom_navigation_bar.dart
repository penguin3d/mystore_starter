import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../controller/bottom_nav_controller.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends ConsumerState<BottomNavigationWidget> {

  @override
  Widget build(BuildContext context) {
    final position = ref.watch(bottomNavControllerProvider);
    return BottomNavigationBar(
        currentIndex: position,
        onTap: (value) => _onTap(value),
        items: const [
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.store),
          icon: Icon(Icons.store_outlined),
      label: 'Store'),
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.calendar_month),
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Classes'),
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.tv),
          icon: Icon(Icons.tv_outlined),
          label: 'News'),


    ]);
  }
  void _onTap(int index){
    ref.read(bottomNavControllerProvider.notifier).setPosition(index);
    switch(index){
      case 0:
        context.go('/shop');
        break;
      case 1:
        context.go('/classes');
        break;
      case 2:
        context.go('/news');
        break;
  default:
    }
  }
}
