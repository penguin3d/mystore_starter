import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore_starter/features/cart/presentation/ui/cart_screen.dart';
import 'package:mystore_starter/features/dashboard/presentation/ui/dashboard_screen.dart';
import 'package:mystore_starter/features/home/presentation/ui/home_screen.dart';
import 'package:mystore_starter/features/product/presentation/ui/prduct_detail.dart';
import 'package:mystore_starter/features/settings/presentation/ui/settings_screen.dart';
import 'package:mystore_starter/pages/root.dart';
import 'package:mystore_starter/routes/go_router_notifier.dart';

import '../pages/login.dart';
import 'named_routes.dart';
import '../pages/error.dart';
import '../pages/profile.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider<GoRouter>((ref) {
  bool isDuplicate = false;

  final notifier = ref.read(goRouterNotifierProvider);
  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/login',
    refreshListenable: notifier,
    redirect: (context, state) {
      final isLoggedIn = notifier.isLoggedIn;
      final isGoingToLogin = state.subloc == '/login';
      if(!isLoggedIn && !isGoingToLogin && !isDuplicate){
        isDuplicate = true;
        return '/login';
      }
      if(isLoggedIn && isGoingToLogin && !isDuplicate){
        isDuplicate = true;
        return '/home';
      }
      if(isDuplicate){
        isDuplicate = false;
      }
      return null;
    },
    routes: [
      GoRoute(
          path: '/',
          name: root,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: RootPage(key: state.pageKey));
          }),
      GoRoute(
          path: '/login',
          name: login,
          pageBuilder: (context, state) {
            return NoTransitionPage(child: LoginPage(key: state.pageKey));
          }),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) =>
            DashBoardScreen(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            path: '/home',
            name: home,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                child: HomeScreen(key: state.pageKey),
              );
            },
            routes: [
              GoRoute(
                  path: 'productDetail/:id',
                  name: productDetail,
                  pageBuilder: (context, state) {
                    final id = state.params['id'].toString();
                    return NoTransitionPage(
                      child: ProductDetailScreen(
                        key: state.pageKey,
                        id: int.parse(id),
                      ),
                    );
                  }),
            ],
          ),
          GoRoute(
              path: '/cart',
              name: cart,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: CartScreen(key: state.pageKey),
                );
              }),
          GoRoute(
              path: '/settings',
              name: settings,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: SettingsScreen(key: state.pageKey),
                );
              }),
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
