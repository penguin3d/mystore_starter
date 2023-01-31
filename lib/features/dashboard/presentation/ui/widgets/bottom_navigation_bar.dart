import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore_starter/features/dashboard/presentation/controller/dashboard_controller.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  const BottomNavigationWidget({Key? key}) : super(key: key);

  @override
  ConsumerState<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends ConsumerState<BottomNavigationWidget> {

  @override
  Widget build(BuildContext context) {
    final position = ref.watch(dashboardControllerProvider);
    return BottomNavigationBar(
        currentIndex: position,
        onTap: (value) => _onTap(value),
        items: const [
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
      label: 'Home'),
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.shopping_bag),
          icon: Icon(Icons.shopping_bag_outlined),
          label: 'Cart'),
      BottomNavigationBarItem(
          activeIcon: Icon(Icons.settings),
          icon: Icon(Icons.settings_outlined),
          label: 'Settings'),


    ]);
  }
  void _onTap(int index){
    ref.read(dashboardControllerProvider.notifier).setPosition(index);
    switch(index){
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/cart');
        break;
      case 2:
        context.go('/settings');
        break;
  default:
    }
  }
}
