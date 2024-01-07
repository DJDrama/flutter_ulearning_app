import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/routes/names.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/sign_in/bloc/signin_blocs.dart';

class SignInController {
  final BuildContext context;

  const SignInController({required this.context});

  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // BlockProvider.of<SignInBloc>(context).state; (same)
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;

        if (emailAddress.isEmpty) {
          toastInfo(msg: "You need to fill email address.");
          return;
        }
        if (password.isEmpty) {
          toastInfo(msg: "You need to fill password.");
          return;
        }
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            toastInfo(msg: "User does not exist!");
            return;
          }
          if (credential.user!.emailVerified) {
            toastInfo(msg: "You need to verify your email account!");
            return;
          }
          var user = credential.user;
          if (user != null) {
            print("user exist");
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoutes.APPLICATION, (route) => false);
          } else {
            toastInfo(msg: "Currently you are not a user of this app!");
            return;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            toastInfo(msg: "No user found!");
          } else if (e.code == 'wrong-password') {
            toastInfo(msg: "Wrong password!");
          } else if (e.code == 'invalid-email') {
            toastInfo(msg: "Invalid email!");
          }
        }
      }
    } catch (e) {}
  }
}
