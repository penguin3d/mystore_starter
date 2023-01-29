import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mystore_starter/main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Sign In"),
      ),
      body: Center(
        child: ElevatedButton(onPressed: ()=>context.goNamed('Home'),child: const Text('Login'),),
      )
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
