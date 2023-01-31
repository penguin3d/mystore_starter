import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore_starter/pages/home.dart';

import '../constants/named_routes.dart';
import '../pages/error.dart';
import '../pages/profile.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
          path: '/home',
          name: home,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: HomePage(key: state.pageKey));
          }),
      GoRoute(
          path: '/profile',
          name: profile,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              child: ProfilePage(key: state.pageKey),
            );
          }),
    ],
    // ToDo implement an Error Page
    errorBuilder: (context, state) => ErrorPage(
      errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});
