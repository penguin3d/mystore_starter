import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore_starter/features/cart/presentation/ui/cart_screen.dart';
import 'package:mystore_starter/features/dashboard/presentation/ui/widgets/dashboard_screen.dart';
import 'package:mystore_starter/features/home/presentation/ui/home_screen.dart';
import 'package:mystore_starter/features/settings/presentation/ui/settings_screen.dart';
import 'package:mystore_starter/pages/home.dart';

import 'named_routes.dart';
import '../pages/error.dart';
import '../pages/profile.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/home',
          name: root,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: HomePage(key: state.pageKey));
          }),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) =>
            DashBoardScreen(key: state.pageKey, child: child),
        routes: [
          GoRoute(
              path: '/',
              name: cart,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: HomeScreen(key: state.pageKey),);
              }
          ),
          GoRoute(
              path: '/cart',
              name: settings,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: CartScreen(key: state.pageKey),);
              }
          ),
          GoRoute(
              path: '/settings',
              name: home,
              pageBuilder: (context, state) {
                return NoTransitionPage(child: SettingsScreen(key: state.pageKey),);
              }
          ),
        ],
      )
    ],
    // ToDo implement an Error Page
    errorBuilder: (context, state) => ErrorPage(
      errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});
