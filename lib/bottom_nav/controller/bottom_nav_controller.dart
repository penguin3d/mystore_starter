import 'package:flutter_riverpod/flutter_riverpod.dart';

final bottomNavControllerProvider = StateNotifierProvider<BottomNavController, int>((ref){
  return BottomNavController(0);
});

class BottomNavController extends StateNotifier<int> {
  BottomNavController(super.state);

  void setPosition(int value) {
    state = value;
  }
}