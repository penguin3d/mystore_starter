import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mystore_starter/routes/go_router_notifier.dart';



class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Log In"),
      ),
      body: Consumer(builder:(context, ref, child){
        return Center(
          child: ElevatedButton(onPressed: () {
            ref.read(goRouterNotifierProvider).isLoggedIn = true;
          },child: const Text('Login'),),
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
