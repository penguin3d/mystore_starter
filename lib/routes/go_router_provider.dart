import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore_starter/bottom_nav/controller/bottom_nav_controller.dart';
import 'package:mystore_starter/bottom_nav/pages/classes_screen.dart';

import 'package:mystore_starter/bottom_nav/pages/shop_screen.dart';
import 'package:mystore_starter/bottom_nav/pages/product_detail.dart';
import 'package:mystore_starter/bottom_nav/pages/news_screen.dart';

import 'package:mystore_starter/routes/go_router_notifier.dart';

import '../bottom_nav/pages/bottom_nav_screen.dart';
import '../root_pages/login.dart';

import '../root_pages/error.dart';
import '../root_pages/profile.dart';
import '../root_pages/root.dart';

final GlobalKey<NavigatorState> _rootNavigator = GlobalKey(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigator =
    GlobalKey(debugLabel: 'shell');

final goRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  // The below redirect gets triggered twice
  // I am not sure why that happens, but I
  // Saw this in a tutorial to ensure that we
  // only set the new route once.
  bool isDuplicate = false;

  final notifier = ref.read(goRouterNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigator,
    initialLocation: '/login',
    refreshListenable: notifier,
    redirect: (context, GoRouterState state) {
      print('Checkpoint A');
      //Capture the notifier value that has brought us here
      final isLoggedIn = notifier.isLoggedIn;

      //Check if we are at the login screen
      final isGoingToLogin = state.subloc == '/login';

      // if we are not logged in and login wasn't the current page
      // then we were brought here by a sign OUT event
      if (!isLoggedIn && !isGoingToLogin && !isDuplicate) {
        print('Checkpoint B');
        isDuplicate = true;
        return '/login';
      }

      // if we are logged in and login was the current page
      // then we were brought here by a sign IN event
      if (isLoggedIn && isGoingToLogin && !isDuplicate) {
        print('Checkpoint C');
        isDuplicate = true;
        return '/shop';
      }
      if (isDuplicate) {
        print('Checkpoint D');
        isDuplicate = false;
      }
      return null;
    },
    routes: [
      GoRoute(
          path: '/',
          name: 'root',
          pageBuilder: (context, state) {
            return NoTransitionPage(child: RootPage(key: state.pageKey));
          }),
      GoRoute(
          path: '/profile',
          name: 'profile',
          pageBuilder: (context, state) {
            return NoTransitionPage(child: ProfilePage(key: state.pageKey));
          }),
      GoRoute(
          path: '/login',
          name: 'login',
          builder: (context, state) {
            return LoginPage(key: state.pageKey);
          }),
      ShellRoute(
        navigatorKey: _shellNavigator,
        builder: (context, state, child) =>
            BottomNavScreen(key: state.pageKey, child: child),
        routes: [
          GoRoute(
            path: '/shop',
            name: 'shop',
            pageBuilder: (context, state) {
              // If we navigate away from the bottom nav and return,
              // the active icon may not match this route.
              // The below setPosition addresses this by setting the bottom
              // nav index to be the index for the shop
              // The Future ensures that we do not do this when the widget
              // tree is being rebuilt. "Don't cross the streams"
              Future(() {
                ref.read(bottomNavControllerProvider.notifier).setPosition(0);
               });
              return NoTransitionPage(
                child: ShopScreen(key: state.pageKey),
              );
            },
            routes: [
              GoRoute(
                  path: 'productDetail/:id',
                  name: 'productDetail',
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
              path: '/classes',
              name: 'classes',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: ClassesScreen(key: state.pageKey),
                );
              }),
          GoRoute(
              path: '/news',
              name: 'news',
              pageBuilder: (context, state) {
                return NoTransitionPage(
                  child: NewsScreen(key: state.pageKey),
                );
              }),
        ],
      )
    ],
    errorBuilder: (context, state) => ErrorPage(
      errorMsg: state.error.toString(),
      key: state.pageKey,
    ),
  );
});
