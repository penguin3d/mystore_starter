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
import 'package:go_router/go_router.dart';

import 'package:mystore_starter/pages/home.dart';
import 'package:mystore_starter/pages/login.dart';
import 'package:mystore_starter/pages/profile.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //
  // FirebaseUIAuth.configureProviders([
  //   EmailAuthProvider(),
  //   GoogleProvider(
  //       clientId:
  //           '404767129554-rj3uoo4altgjsq6tpqm48ovqr69i3ki0.apps.googleusercontent.com'),
  // ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
      title: "Skeleton",
    );
  }
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      name: "Login",
      path: "/",
      builder: (context, state) => const LoginPage(),
      routes: [
        GoRoute(
          name: 'Home',
          path: 'home',
          pageBuilder: (context, state) {
            // TODO Try to find a way to move these CustomTransitionPage calls
            // TODO to my own class that can be responsive/adaptive.  I want
            // TODO the below behavior when in a web browser, but am fine with
            // TODO the default transition animations for native apps.
            // TODO but for now, I can deal with the extra code.
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: const HomePage(),
              transitionDuration: const Duration(milliseconds: 0),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return FadeTransition(
                  opacity:
                  CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          name: 'Profile',
          path: 'profile',
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: const ProfilePage(),
              transitionDuration: const Duration(milliseconds: 0),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return FadeTransition(
                  opacity:
                  CurveTween(curve: Curves.easeInOut).animate(animation),
                  child: child,
                );
              },
            );
          },
        ),
      ],
    ),
  ],
);
