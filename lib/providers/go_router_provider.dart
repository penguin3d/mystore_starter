import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore_starter/pages/home.dart';

import '../constants/named_routes.dart';
import '../pages/error.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
     initialLocation: '/home',
    routes: [
      GoRoute(
          path: '/home',
          name: home,
          builder: (context, state) => HomePage(key: state.pageKey),
      )
    ],
    // ToDo implement an Error Page
     errorBuilder: (context, state) => ErrorPage(errorMsg: state.error.toString(), key: state.pageKey,),
  );
});
