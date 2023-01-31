import 'dart:async';

// TODO implement firebase auth and firestore functions for the app once
// TODO the dummy implementation of routing and state management are working
// TODO to properly deal with routing and auth state changes, along with
// TODO any other state changes
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart'
//     hide EmailAuthProvider, PhoneAuthProvider;
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
// import 'firebase_options.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mystore_starter/routes/go_router_provider.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //
  // FirebaseUIAuth.configureProviders([
  //   EmailAuthProvider(),
  //   GoogleProvider(
  //       clientId:
  //           '404767129554-rj3uoo4altgjsq6tpqm48ovqr69i3ki0.apps.googleusercontent.com'),
  // ]);
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState()=> _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp>{
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      title: "Skeleton",
    );
  }

}
// final GoRouter _router = GoRouter(
//   // redirect: (BuildContext context, GoRouterState state) {
//   //   if (authStateProvider.isLoggeIn()) {
//   //     return '/';
//   //   } else {
//   //     return 'home';
//   //   }
//   // },
//   routes: [
//     GoRoute(
//       name: "Login",
//       path: "/",
//       builder: (context, state) => const LoginPage(),
//       routes: [
//         GoRoute(
//           name: 'Home',
//           path: 'home',
//           pageBuilder: (context, state) {
//             // TODO Try to find a way to move these CustomTransitionPage calls
//             // TODO to my own class that can be responsive/adaptive.  I want
//             // TODO the below behavior when in a web browser, but am fine with
//             // TODO the default transition animations for native apps.
//             // TODO but for now, I can deal with the extra code.
//             return CustomTransitionPage<void>(
//               key: state.pageKey,
//               child: const HomePage(),
//               transitionDuration: const Duration(milliseconds: 0),
//               transitionsBuilder: (BuildContext context,
//                   Animation<double> animation,
//                   Animation<double> secondaryAnimation,
//                   Widget child) {
//                 return FadeTransition(
//                   opacity:
//                       CurveTween(curve: Curves.easeInOut).animate(animation),
//                   child: child,
//                 );
//               },
//             );
//           },
//         ),
//         GoRoute(
//           name: 'Profile',
//           path: 'profile',
//           pageBuilder: (context, state) {
//             return CustomTransitionPage<void>(
//               key: state.pageKey,
//               child: const ProfilePage(),
//               transitionDuration: const Duration(milliseconds: 0),
//               transitionsBuilder: (BuildContext context,
//                   Animation<double> animation,
//                   Animation<double> secondaryAnimation,
//                   Widget child) {
//                 return FadeTransition(
//                   opacity:
//                       CurveTween(curve: Curves.easeInOut).animate(animation),
//                   child: child,
//                 );
//               },
//             );
//           },
//         ),
//       ],
//     ),
//   ],
// );
