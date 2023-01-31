import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AuthStateNotifier extends StateNotifier<bool> {
  AuthStateNotifier() : super(false);

  void logIn(BuildContext ctx) {
    state = true;
    print('Logged In');
  }
  void logOut(BuildContext ctx) {
    state = false;
    print('Logged Out');
  }
  bool isLoggedIn(){
    print('Logged in is $state');
    return state;
  }
}

// State notifier provider holding the state
final authStateProvider = StateNotifierProvider(
      (ref) => AuthStateNotifier(),
);


