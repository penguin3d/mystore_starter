import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mystore_starter/routes/auth_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:firebase_ui_oauth_apple/firebase_ui_oauth_apple.dart';

import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Log In"),
        ),
        body: Consumer(builder: (context, ref, child) {
          return SignInScreen(
            sideBuilder:  (context, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.only(top: 1000),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/GSC_Huge.png'),
                ),
              );
            },
            headerBuilder: (context, constraints, shrinkOffset
                ) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/GSC_Huge.png'),
                ),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to FlutterFire, please sign in!')
                    : const Text('Welcome to Flutterfire, please sign up!'),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
          );
        })

        // SignInScreen(
        //   actions: [
        //             AuthStateChangeAction(((context, state) {
        //       if (state is SignedIn || state is UserCreated) {
        //         var user = (state is SignedIn)
        //             ? state.user
        //             : (state as UserCreated).credential.user;
        //         if (user == null) {
        //           return;
        //         }
        //         if (state is UserCreated) {
        //           user.updateDisplayName(user.email!.split('@')[0]);
        //         }
        //         if (!user.emailVerified) {
        //           user.sendEmailVerification();
        //           const snackBar = SnackBar(
        //               content: Text(
        //                   'Please check your email to verify your email address'));
        //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //         }
        //         Navigator.of(context).popUntil(ModalRoute.withName('/home'));
        //       }
        //     })),
        //   ],
        // ),
        );
  }
}
