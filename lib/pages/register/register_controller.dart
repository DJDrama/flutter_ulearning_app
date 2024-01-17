import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning_app/common/widgets/flutter_toast.dart';
import 'package:ulearning_app/pages/register/bloc/register_blocs.dart';

class RegisterController {
  final BuildContext context;

  const RegisterController({required this.context});

  Future<void> handleEmailRegister() async {
    final state = context.read<RegisterBloc>().state;
    String userName = state.userName;
    String email = state.email;
    String password = state.password;
    String confirmPassword = state.confirmPassword;

    print("$userName $email $password $confirmPassword");

    if (userName.isEmpty) {
      toastInfo(msg: "User name cannot be empty.");
      return;
    }
    if (email.isEmpty) {
      toastInfo(msg: "Email cannot be empty.");
      return;
    }
    if (password.isEmpty) {
      toastInfo(msg: "Password cannot be empty.");
      return;
    }
    if (confirmPassword.isEmpty) {
      toastInfo(msg: "Confirm password cannot be empty.");
      return;
    }

    try {
      final credentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (credentials.user != null) {
        await credentials.user?.sendEmailVerification();
        await credentials.user?.updateDisplayName(userName);
        //String photoUrl = "${AppConstants.SERVER_API_URL}uploads/deafult.png";
        String photoUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRT5xVEYCsmQ8I3QZoC4bOEbpZByyKxCqxI199jm6ShDQ&s";
        await credentials.user?.updatePhotoURL(photoUrl);
        toastInfo(
            msg:
                "An email has been sent to your registered email. To activate it, please check your email box.");
        Navigator.of(context).pop();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        toastInfo(msg: "The password provided is too weak.");
      } else if (e.code == 'email-already-in-use') {
        toastInfo(msg: "The email is already in use.");
      } else if (e.code == 'invalid-email') {
        toastInfo(msg: "Your email address is invalid.");
      }
    }
  }
}
